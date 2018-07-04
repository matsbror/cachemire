/* yfuns.h functions header -- UNIX version */
#ifndef _YFUNS
#define _YFUNS
		/* macros */
#define _Envp	(*_environ)
#define _Fclose(str)	_Close((str)->_Handle)
#define _Fread(str, buf, cnt)	_Read((str)->_Handle, buf, cnt)
#define _Fwrite(str, buf, cnt)	_Write((str)->_Handle, buf, cnt)
		/* interface declarations */
extern const char **_environ;

extern int __dpce;
extern int __do_count;

int _Close(int);
int _Open(int);
void _Exit(int);
int _Read(int, unsigned char *, int);
int _Write(int, const unsigned char *, int);

#endif
