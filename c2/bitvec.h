/*#################################################################
# Copyright (c) 1991 AT&T Bell Laboratories, All Rights Reserved   
# Published in ``A C++ Primer''  by Stanley Lippman, Addison-Wesley
#################################################################*/

#ifndef BITVECTOR_H
#define BITVECTOR_H

const BITSPERBYTE = 8;
const BYTESPERWORD = 4;

const WORDSIZE = BITSPERBYTE * BYTESPERWORD;
enum { OFF, ON };
typedef unsigned long BitVecType;
typedef BitVecType *BitVec;

#include <iostream.h>
class BitVector {
    friend ostream& 
        operator<<(ostream&, BitVector&);
public:
    BitVector( int = WORDSIZE, int = OFF );
    ~BitVector() { delete [] bv; }
    void operator+=( int pos ); // turn on pos
    void operator-=( int pos ); // turn off pos
    BitVector operator &( const BitVector& ) const;
    BitVector operator |( const BitVector& ) const;
    operator == ( int pos ) const;
    operator != ( int pos ) const;
    void reset(); // reinit to 0
private: // helping functions
    inline getOffset( int ) const;
    inline getIndex( int ) const;
private: // internal representation
    short wordWidth;
    short size;
    BitVec bv;
};

inline BitVector::getIndex( int pos ) const {
    // return word bit is positioned in
    return( pos / WORDSIZE );
}

inline BitVector::getOffset( int pos ) const {
    // return position of bit in word
    return( pos % WORDSIZE );
}

#endif
