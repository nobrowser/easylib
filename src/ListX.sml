(* Copyright (C) 2012 Ian Zimmerman <itz@buug.org>
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the conditions spelled out in
 * the file LICENSE are met. *)


structure ListX :> LIST_X = struct

    open List

    fun takeWhile f [] = []
      | takeWhile f (x::xs) =
        if f x then x :: takeWhile f xs else []

    fun dropWhile f [] = []
      | dropWhile f (l as x::xs) =
        if f x then dropWhile f xs else l

    fun tabulateRec f =
        let fun loop l =
                case f l of NONE => l | SOME x => loop (x :: l)
        in loop [] end

    fun intersperse sep l =
        let fun prepend (y, []) = [y]
              | prepend (y, xs) = y :: sep :: xs
        in foldr prepend [] l end

end
