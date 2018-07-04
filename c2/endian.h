#ifndef _ENDIAN_H_
#define _ENDIAN_H_

inline short htons(short s){
  union {
     unsigned char b[2];
     short             s1;
  } x;
  register unsigned char t;
  x.s1 = s;
  t = x.b[1];
  x.b[1] = x.b[0];
  x.b[0] = t;
  return x.s1;
}

inline long htonl(long l){
  union {
     unsigned char b[4];
     long             l1;
  } x;
  register unsigned char t;
  x.l1 = l;
  t = x.b[0];
  x.b[0] = x.b[3];
  x.b[3] = t;
  t = x.b[1];
  x.b[1] = x.b[2];
  x.b[2] = t;
  return x.l1;
}

inline short ntohs(short s){
  union {
     unsigned char b[2];
     short             s1;
  } x;
  register unsigned char t;
  x.s1 = s;
  t = x.b[1];
  x.b[1] = x.b[0];
  x.b[0] = t;
  return x.s1;
}

inline long ntohl(long l){
  union {
     unsigned char b[4];
     long             l1;
  } x;
  register unsigned char t;
  x.l1 = l;
  t = x.b[0];
  x.b[0] = x.b[3];
  x.b[3] = t;
  t = x.b[1];
  x.b[1] = x.b[2];
  x.b[2] = t;
  return x.l1;
}

#endif


