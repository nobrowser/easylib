(* Copyright (C) 2012 Ian Zimmerman <itz@buug.org>
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the conditions spelled out in
 * the file LICENSE are met. *)

signature MONO_VECTOR_SLICE_X = sig

    include MONO_VECTOR_SLICE

    val append : slice * slice -> vector

    val concatWith: vector -> slice list -> vector

    val rfindi : (int * elem -> bool)
                  -> slice -> (int * elem) option
    val rfind  : (elem -> bool) -> slice -> elem option
    val findiAll: (int * elem -> bool)
                  -> slice -> (int * elem) list
    val findAll: (elem -> bool) -> slice -> elem list
    val existsi : (int * elem -> bool) -> slice -> bool
    val alli : (int * elem -> bool) -> slice -> bool
    val rcollate : (elem * elem -> order)
                    -> slice * slice -> order
    val tokens: (elem -> bool) -> slice -> slice list
    val fields: (elem -> bool) -> slice -> slice list

end
