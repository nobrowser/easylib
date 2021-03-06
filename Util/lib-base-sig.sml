(* lib-base-sig.sml
 *
 * COPYRIGHT (c) 1993 by AT&T Bell Laboratories.  See COPYRIGHT file for details.
 *)

signature LIB_BASE =
  sig

    exception Unimplemented of string
	(* raised to report unimplemented features *)
    exception Impossible of string
	(* raised to report internal errors *)

    exception NotFound
	(* raised by searching operations *)

    val failure : {module : string, func : string, msg : string} -> 'a
	(* raise the exception Fail with a standard format message. *)

  end (* LIB_BASE *)

