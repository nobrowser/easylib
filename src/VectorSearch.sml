(* Copyright (C) 2012 Ian Zimmerman <itz@buug.org>
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the conditions spelled out in
 * the file LICENSE are met. *)

structure VectorSearch :> VECTOR_SEARCH = 
struct

    structure V = VectorX
    structure S = VectorSliceX
    structure SS = VectorSliceSearch

    fun findElem x v =
        Option.map #1 $ V.findi (fn (_, y) => y = x) v

    fun rfindElem x v =
        Option.map #1 $ V.rfindi (fn (_, y) => y = x) v

    fun findAllElem x v =
        let fun prepend (j, y, js) = if y = x then j :: js else js
        in V.foldri prepend [] v end

    fun isSubI v1 v2 j = V.alli (fn (i, y) => v2 // (j + i) = y) v1

    fun isPrefix v1 v2 =
        let val (l1, l2) = (V.length v1, V.length v2)
        in l1 <= l2 andalso isSubI v1 v2 0 end

    fun isSuffix v1 v2 =
        let val (l1, l2) = (V.length v1, V.length v2)
            val dl = l2 - l1
        in dl >= 0 andalso isSubI v1 v2 dl end

    type ''a lrsearch = ''a SS.lrsearch

    fun compile v = SS.compile (S.full v)

    fun findSub lsrch v = SS.findSub lsrch (S.full v)

    fun isSub v1 v2 = isSome $ findSub (compile v1) v2

    type ''a rlsearch = ''a SS.rlsearch

    fun rcompile v = SS.rcompile (S.full v)

    fun rfindSub rsrch v = SS.rfindSub rsrch (S.full v)

end
