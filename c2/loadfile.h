/**********************************************************************
 *
 *    Title:             ReadExe.h
 *    Creation Date:     92-02-21
 *    Authour:           Mats Brorsson
 *    Function:          Prototypes for reading executable image of 
 *                       simulation program.
 *
 *    Change log:
 * 
 **********************************************************************/
#ifndef _LOADFILE_H_
#define _LOADFILE_H_


/**********************************************************************
 *
 *  CacheMireRC loadfile(char *programfilename, 
 *                      unsigned long *start_address);
 *
 *  Parameters: 
 *        programfilename  File name of the executable image
 *        *start_address    Reference to start address 
 *
 *  Function: Reads the executable file and loads it into the memory
 *            of CacheMire-2
 *            Uses the SunOS 5 elf format
 * 
 **********************************************************************/


extern int load_file(char *, unsigned long *);

#endif
