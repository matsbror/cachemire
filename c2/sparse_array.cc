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

#include "sparse_array.h"

template <class T>
SparseArray<T>::SparseArray() {
    int i;

    fl_arr = new T ** [0x100];
    assert(fl_arr != 0);

    last_index = 0xFFFFFFFF;

    for (i = 0; i < 0x100; i++)
      fl_arr[i] = NULL;
  }

template <class T>
SparseArray<T>::~SparseArray(){
  T **sl_arr;
  T *tl_arr;

  for (int i = 0; i < 0x100; i++) {
    if (fl_arr[i] != NULL) {
      sl_arr = fl_arr[i];
      for (int i = 0; i < 0x1000; i++) {
	if (sl_arr[i] != NULL) {
	  tl_arr = sl_arr[i];
	  delete [] tl_arr;
	}
      }
      delete [] sl_arr;
    }
  }
  delete [] fl_arr;
}


template <class T>
T& SparseArray<T>::operator[](unsigned long index){
  unsigned long flind, slind, tlind;
  T **sl_arr;
  T *tl_arr;

  assert(index < 0xFFFFFFFF);

  if (index == last_index) {
    return *(last_val);
  }
  
  last_index = index;

  flind = index >> 24;

  if (fl_arr[flind] == NULL) {
    fl_arr[flind] = new T * [0x1000];
    assert(fl_arr[flind] != 0);

    for (int i = 0; i < 0x1000; i++) 
      fl_arr[flind][i] = NULL;
  }

  sl_arr = fl_arr[flind];
  slind = (index >> 12) & 0xFFF;

  if (sl_arr[slind] == NULL) {
    sl_arr[slind] = new T [0x1000];
    assert(sl_arr[slind] != 0);
  }

  tl_arr = sl_arr[slind];
  tlind = index & 0xFFF;

  last_val = &(tl_arr[tlind]);

  return tl_arr[tlind];

}


// This function test if an entry with the corresponding 
// index exists. Returns 1 if entry exists, 0 otherwise.

template <class T>
int SparseArray<T>::exist(unsigned long index){
  unsigned long flind, slind;
  T **sl_arr;

  assert(index < 0xFFFFFFFF);

  if (index == last_index) {
    return 1;
  }

  flind = index >> 24;

  if (fl_arr[flind] == NULL) {
    return 0;
  }

  sl_arr = fl_arr[flind];
  slind = (index >> 12) & 0xFFF;

  if (sl_arr[slind] == NULL) {
    return 0;
  }

  return 1;

}

