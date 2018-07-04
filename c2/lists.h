/*
**************************************************************
**
**  Title     : lists.h
**
**  Author    : Mats Brorsson
**
**  Date      : 1990-03-14
**
**  Comments  : 
**
**  (c) COPYRIGHT TeleSoft AB 1990
**************************************************************
**
**  Modification History
**
**  Ver No   Mdfr   Date       Reason for change
**  1.1      MBr    90-03-14   Created
**
**************************************************************
**
*/

#ifndef _LISTS_H_
#define _LISTS_H_


typedef void *typeofdata;        /* typeofdata is a pointer to whatever
				   the user wants to define. */

typedef enum {
  headkind,
  linkkind
} kindtype;

typedef struct element{
  kindtype          kind;
  struct element    *pre;
  struct element    *suc;
  typeofdata        data;
} el_type;

typedef el_type *link;   /* link is a pointer to struct element */
typedef link    *head;

/*
 * Allowed operations on lists and elements.
 */
/* Creates a new empty list 'h' */
extern void newhead(head *);

/* Creates a new element 'e' */
extern void newlink(link *);

/* If e is an element of a list it is taken out of that list. */
extern void out(link);

/* Puts 'e' in front of 'x' in the same list as 'x' */
extern void precede(link, link);

/* Puts 'e' after of 'x' in the same list as 'x' */
extern void follow(link, link);

/* Puts 'e' last in list 'h' */
extern void into(link, head);

/* Puts 'e' first in list 'h' */
extern void intoasfirst(link, head);

/* Returns the element preceding 'e' */
extern link lpred(link);

/* Returns the element following 'e' */
extern link lsucc(link);

/* Returns 1 if list 'h' is empty, 0 otherwise. */
extern int empty(head);

/* Return pointer to the first element in list 'h' */
extern link first(head);

/* Return pointer to the last element in list 'h' */
extern link last(head);

/* Return the number of elements in list 'h' */
extern int cardinal(head);

/* Erase element 'e' */
extern void disposelink(link *);

/* Erase the list 'h' except for the head. */
extern void clear(head);

/* Erase list 'h' completely. */
extern void disposehead(head *);


/*************/

typedef head stack;

extern void newstack(stack*);
extern void push(stack, link);
extern link pop(stack);
extern link indexed(stack, int);

#endif
