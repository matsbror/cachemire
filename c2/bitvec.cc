/*#################################################################
# Copyright (c) 1991 AT&T Bell Laboratories, All Rights Reserved   
# Published in ``A C++ Primer''  by Stanley Lippman, Addison-Wesley
#################################################################*/

#include "bitvec.h"
#include <assert.h>
#include <stdio.h>

// default values: sz => WORDSIZE, init => OFF
BitVector::BitVector( int sz, int init )
{
    assert( sz > 0 );
    size = sz;
    wordWidth = (size + WORDSIZE - 1)/WORDSIZE;
    bv = new BitVecType[ wordWidth ];
    assert( bv != 0 );

    // now initialize bv to either all 0's or 1's
    if ( init != OFF ) init = ~0; 

    // assign 0 or -1 to each word of bv
    for ( int i = 0; i < wordWidth; i++ )
	*(bv + i) = init;
}

void BitVector::operator+=( int pos )
{// turn on bit at position pos
    assert( pos >= 0 && pos < size );

    int index = getIndex( pos );
    int offset = getOffset( pos );

    // turn on bit offset at word index
    *(bv + index) |= (ON << offset);
}

void BitVector::operator-=( int pos )
{// turn on bit at position pos
    assert( pos >= 0 && pos < size );

    int index = getIndex( pos );
    int offset = getOffset( pos );

    // turn off bit in word index at position offset
    *(bv + index) &= (~(ON << offset));
}

BitVector::operator==( int pos ) const
{// true if bit at position pos is 1
    assert( pos >= 0 && pos < size );

    int index = getIndex( pos );
    int offset = getOffset( pos );
    return( *(bv + index) & (ON << offset) );
}

BitVector::operator!=( int pos ) const { 
    return ( !(*this == pos) );
}

ostream& 
operator<<(ostream& os, BitVector& bv)
{  
    os << "< ";
    for ( int cnt = 0, i = 0; i < bv.size; ++i ) 
        // BitVector::operator==(int)
	if ( bv == i ) os << i << " ";
    return os << ">";
}

void BitVector::reset()
{ // reinitialize all elements to 0
     for ( int i = 0; i < wordWidth; ++i )
         *( bv + i ) = 0;
}

BitVector 
BitVector::operator|( const BitVector& b ) const
{// simplifying assumption: both have same size
    BitVector result( size, OFF );
    BitVec tmp = result.bv;
    for ( int i = 0; i < wordWidth; ++i )
	*(tmp + i) = *(bv + i) | *(b.bv + i);
    return result;
}

BitVector 
BitVector::operator&( const BitVector& b ) const
{// simplifying assumption: both have same size
    BitVector result( size, OFF );
    BitVec tmp = result.bv;
    for ( int i = 0; i < wordWidth; ++i )
	*(tmp + i) = *(bv + i) & *(b.bv + i);
    return result;
}
