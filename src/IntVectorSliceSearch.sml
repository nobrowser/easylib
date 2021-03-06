(* Copyright (C) 2012 Ian Zimmerman <itz@buug.org>
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the conditions spelled out in
 * the file LICENSE are met. *)

structure IntVectorSliceSearch = MonoVectorSliceSearch (
    structure S = IntVectorSliceX
    structure E = struct type elem = int end
)
