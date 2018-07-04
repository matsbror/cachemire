#include <assert.h>
#include <stdlib.h>
#include <stdio.h>
#include <libelf.h>
#include <fcntl.h>
#include <unistd.h>
#include <iostream.h>

#include "cachemire-2.h"
#include "cm_memory.h"

int load_file(char* file, unsigned long * start_address)
{
  int fp;
  char name[80];
  int main_found = 0;
  int slave_found = 0;
  char err_str[80];

  Elf *elf;
  Elf_Cmd cmd;
  Elf_Scn *scn = 0;
  Elf32_Ehdr *ehdr;
  Elf32_Shdr *shdr;
  Elf32_Phdr *phdr;
  Elf_Scn *scn_string_table;
  Elf_Data *string_table = 0;
  Elf_Data *sym_string_table = 0;
  Elf_Data *data = 0;
  int little_endian = 0;

  fprintf(stderr,"\n");

  /* Check if file exists, otherwise exit */
  if ((fp = open(file, O_RDONLY)) == -1) {
    perror("File doesn't exist\n");
    exit(1);
  }

  if (elf_version(EV_CURRENT) == EV_NONE) {
    /* library out of date */
    /* recover from error */
  }

  cmd = ELF_C_READ;
  elf = elf_begin(fp, cmd, (Elf *)0);
  
  /* Check that the file is an elf file */
  if (elf_kind(elf) != ELF_K_ELF) {
    fprintf(stderr,"Error: file %s is not an elf file\n", file);
    return CM_ERROR;
  }

  ehdr = elf32_getehdr(elf);

  if (ehdr->e_ident[EI_DATA] == ELFDATA2LSB){
    little_endian = 1;
  } else   if (ehdr->e_ident[EI_DATA] == ELFDATA2MSB){
    little_endian = 0;
  } else {
    perror("Unknown data encoding!");
    exit(-1);
  }
    
  *start_address = (unsigned long) ehdr->e_entry;

  // What am I going to do with it???

  phdr = elf32_getphdr(elf);

  // Get the section string table
  scn_string_table = elf_getscn(elf, (size_t) ehdr->e_shstrndx);
  string_table = elf_getdata(scn_string_table, string_table);

  while ((scn = elf_nextscn(elf, scn)) != 0) {
    char *id;
    char *t;

    shdr = elf32_getshdr(scn);

    t = (char *)string_table->d_buf;
    id = (char *)&(t[shdr->sh_name]);
#if 0
    id = (char *)&(string_table->d_buf[shdr->sh_name]);
#endif

    data = 0;
    data = elf_getdata(scn, data);

#if DEBUGLEVEL>=1
    if (shdr->sh_addr)
      fprintf(stderr,"Section %s start occupies addresses 0x%x to 0x%x\n",
	     id, shdr->sh_addr, shdr->sh_addr+data->d_size);
#endif

    if (shdr->sh_addr) {
	  
	// Find the start and finish of text and data respectively.
	// Try also to determine where the heap is going to be. 
	
	// If the section is writeable, then it is data
	// otherwise text
	if (shdr->sh_flags & SHF_WRITE) {
	    // data
	    min_data_addr = (min_data_addr < shdr->sh_addr ? 
			     min_data_addr : shdr->sh_addr);
	    max_data_addr = (max_data_addr > (shdr->sh_addr+data->d_size) ? 
			     max_data_addr : (shdr->sh_addr+data->d_size));
	} else {
	    // text
	    min_text_addr = (min_text_addr < shdr->sh_addr ? 
			     min_text_addr : shdr->sh_addr);
	    max_text_addr = (max_text_addr > (shdr->sh_addr+data->d_size) ? 
			     max_text_addr : (shdr->sh_addr+data->d_size));
	}
	  
	if (data->d_buf)
	    CopyMemSun2CM(INVALID, (unsigned long)data->d_buf, 
			  (unsigned long) shdr->sh_addr, (int) data->d_size);
	  
	}
    
  }
  
  data_start = min_data_addr;
  data_end   = max_data_addr;
  text_start = min_text_addr;
  text_end   = max_text_addr;

#if 0
  /* Insert a ta TRAP_EXIT at address 8 */
  i = 0x91d02024;
  GlobalMemoryOp(INVALID, WRITE_OP, 8, &i, S_WORD);
#endif

  close(fp);

  return CM_OK;


}
