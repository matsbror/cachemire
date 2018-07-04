///////////////////////////////////////////////////////////////////////
//
//    Title:             sparse_array.cc
//    Creation Date:     94-06-03
//    Authour:           Mats Brorsson
//    Function:          Class for sparse arrays. Allocates
//                       only memory when needed. Allows
//                       up to (2^32)-1 entries.
//
//    Change log:        Improved 1994-06-27
// 
///////////////////////////////////////////////////////////////////////

#ifndef _SPARSE_ARRAY_H_
#define _SPARSE_ARRAY_H_

#include <assert.h>
#ifndef NULL
#define NULL 0
#endif

template <class T>
class SparseArray {

 public:

  // Constructor
  SparseArray();
  // Destructor
  ~SparseArray();


  // Access operator
  T& operator[](unsigned long index);

  // test if entry exists
  int exist(unsigned long index);

private:

  T         ***fl_arr;

  unsigned long last_index;
  T           *last_val;

};


#endif
