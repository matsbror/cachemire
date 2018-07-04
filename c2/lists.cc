/*
**************************************************************
**
**
**  Title     : lists.c
**
**  Author    : Mats Brorsson
**
**  Date      : 1990-03-14
**
**  Comments  : Linked list package
**
**************************************************************
**
**  Modification History
**
**  Ver No   Mdfr   Date       Reason for change
**  0.1      MBr    90-03-14   Creation
**  1.1      MBr    93-03-18   Added stack operations
**  
**************************************************************
*/

#include <stdio.h>
#include <malloc.h>
#include "lists.h"

/* Creates a new empty list 'h' */
void newhead(head *h_r)
{
  link hp;

  (*h_r)  = (head) malloc(sizeof(link));
  (**h_r) = (link) malloc(sizeof(el_type));
  hp = **h_r;
  
  (*hp).kind = headkind;
  (*hp).pre  = hp;
  (*hp).suc  = hp;
}


/* Creates a new element 'e' */
void newlink(link *e_r)
{
  *e_r = (link) malloc(sizeof(el_type));

  (**e_r).kind = linkkind;
  (**e_r).pre  = NULL;
  (**e_r).suc  = NULL;
}


/* If e is an element of a list it is taken out of that list. */
void out(link e)
{
  if ((*e).pre != NULL){
    (*(*e).pre).suc = (*e).suc;
    (*(*e).suc).pre = (*e).pre;
    (*e).pre = NULL;
    (*e).suc = NULL;
  }
}


/* Puts 'e' in front of 'x' in the same list as 'x' */
void precede(link e,link x)
{
  out(e);
  (*(*x).pre).suc = e;
  (*e).pre = (*x).pre;
  (*e).suc = x;
  (*x).pre = e;
}



/* Puts 'e' after of 'x' in the same list as 'x' */
void follow(link e, link x)
{
  out(e);
  (*(*x).suc).pre = e;
  (*e).pre = x;
  (*e).suc = (*x).suc;
  (*x).suc = e;
}


/* Puts 'e' last in list 'h' */
void into(link e, head h)
{
  out(e);
  (*(**h).pre).suc = e;
  (*e).pre = (**h).pre;
  (*e).suc = *h;
  (**h).pre = e;
}


/* Puts 'e' first in list 'h' */
void intoasfirst(link e, head h)
{
  out(e);
  (*(**h).suc).pre = e;
  (*e).pre = *h;
  (*e).suc = (**h).suc;
  (**h).suc = e;
}



/* Returns the element preceding 'e' */
link lpred(link e)
{
  return(((*(*e).pre).kind == linkkind)?((*e).pre):NULL);
}



/* Returns the element following 'e' */
link lsucc(link e)
{
  return(((*(*e).suc).kind == linkkind)?((*e).suc):NULL);
}



/* Returns 1 if list 'h' is empty, 0 otherwise. */
int empty(head h)
{
  return(((*(**h).suc).kind == headkind)?1:0);
}


/* Return pointer to the first element in list 'h' */
link first(head h)
{
  if (!empty(h)) {
    return((**h).suc);
  } else {
    return(NULL);
  }
}



/* Return pointer to the last element in list 'h' */
link last(head h)
{
  if (!empty(h)) {
    return((**h).pre);
  } else {
    return(NULL);
  }
}



/* Return the number of elements in list 'h' */
int cardinal(head h)
{
  int  k = 0;
  link e;

  e = first(h);
  while (e != NULL){
    k++;
    e = lsucc(e);
  }
  return(k);
}


/* Erase element 'e' */
void disposelink(link *e_r)
{
  out(*e_r);
  free(*e_r);
  *e_r = NULL;
}

/* Erase the list 'h' except for the head. */
void clear(head h)
{
  link e;
  while (!empty(h)){
    e = first(h);
    disposelink(&e);
  }
}


/* Erase list 'h' completely. */
void disposehead(head *h_r)
{
  clear(*h_r);
  free(**h_r);
  free(*h_r);
  *h_r = NULL;
}


/* Create a new stack */
void newstack(stack *s_ref){
  newhead((head *)s_ref);
}

/* Push an element onto a stack */
void push(stack s, link e){
  intoasfirst(e, (head)s);
}

/* Pop en element from a stack */
link pop(stack s){
  link e;
  e = first((head) s);
  out(e);
  return e;
}

/* Return the i'th element in the stack */
link indexed(stack s, int index){
  link e;
  int i = 0;

  if ((index > cardinal((head) s)) || empty((head) s)){
    return NULL;
  }

  e = first((head) s);
  while (i < index){
    e = lsucc(e);
    i++;
  }
  return e;
}
