(*Generated by Lem from missing_pervasives.lem.*)
open Lem_basic_classes
open Lem_bool
open Lem_list
open Lem_maybe
open Lem_num
open Lem_string
open Lem_assert_extra
open Show
open Lem_sorting

(*val naturalZero : natural*)
(*let naturalZero:natural=  0*)

(*val id : forall 'a. 'a -> 'a*)
let id0 x:'a=  x

(*type byte*)
(*val natural_of_byte : byte -> natural*)

let compare_byte b1 b2:int=  (Nat_big_num.compare (Nat_big_num.of_int (Char.code b1)) (Nat_big_num.of_int (Char.code b2)))

let instance_Basic_classes_Ord_Missing_pervasives_byte_dict:(char)ord_class= ({

  compare_method = compare_byte;

  isLess_method = (fun f1 -> (fun f2 -> ( Lem.orderingEqual(compare_byte f1 f2) (-1))));

  isLessEqual_method = (fun f1 -> (fun f2 -> let result = (compare_byte f1 f2) in Lem.orderingEqual result (-1) || Lem.orderingEqual result 0));

  isGreater_method = (fun f1 -> (fun f2 -> ( Lem.orderingEqual(compare_byte f1 f2) 1)));

  isGreaterEqual_method = (fun f1 -> (fun f2 -> let result = (compare_byte f1 f2) in Lem.orderingEqual result 1 || Lem.orderingEqual result  0))})

(*val char_of_byte : byte -> char*)

(*val byte_of_char : char -> byte*)

(* Define how to print a byte in hex *)
(*val hex_char_of_nibble : natural -> char*)
let hex_char_of_nibble n:char=  
 (if Nat_big_num.equal n(Nat_big_num.of_int 0) then
    '0'
  else if Nat_big_num.equal n(Nat_big_num.of_int 1) then
    '1'
  else if Nat_big_num.equal n(Nat_big_num.of_int 2) then
    '2'
  else if Nat_big_num.equal n(Nat_big_num.of_int 3) then
    '3'
  else if Nat_big_num.equal n(Nat_big_num.of_int 4) then
    '4'
  else if Nat_big_num.equal n(Nat_big_num.of_int 5) then
    '5'
  else if Nat_big_num.equal n(Nat_big_num.of_int 6) then
    '6'
  else if Nat_big_num.equal n(Nat_big_num.of_int 7) then
    '7'
  else if Nat_big_num.equal n(Nat_big_num.of_int 8) then
    '8'
  else if Nat_big_num.equal n(Nat_big_num.of_int 9) then
    '9'
  else if Nat_big_num.equal n(Nat_big_num.of_int 10) then
    'a'
  else if Nat_big_num.equal n(Nat_big_num.of_int 11) then
    'b'
  else if Nat_big_num.equal n(Nat_big_num.of_int 12) then
    'c'
  else if Nat_big_num.equal n(Nat_big_num.of_int 13) then
    'd'
  else if Nat_big_num.equal n(Nat_big_num.of_int 14) then
    'e'
  else if Nat_big_num.equal n(Nat_big_num.of_int 15) then
    'f'
   else     
(assert false))

let hex_string_of_byte b:string=    
  (Xstring.implode [ hex_char_of_nibble ( Nat_big_num.div(Nat_big_num.of_int (Char.code b))(Nat_big_num.of_int 16))
             ; hex_char_of_nibble ( Nat_big_num.modulus(Nat_big_num.of_int (Char.code b))(Nat_big_num.of_int 16))])

let instance_Show_Show_Missing_pervasives_byte_dict:(char)show_class= ({

  show_method = hex_string_of_byte})

(*val natural_of_decimal_digit : char -> maybe natural*)
let natural_of_decimal_digit c:(Nat_big_num.num)option=  
 (if c = '0' then
    Some(Nat_big_num.of_int 0)
  else if c = '1' then
    Some(Nat_big_num.of_int 1)
  else if c = '2' then
    Some(Nat_big_num.of_int 2)
  else if c = '3' then
    Some(Nat_big_num.of_int 3)
  else if c = '4' then
    Some(Nat_big_num.of_int 4)
  else if c = '5' then
    Some(Nat_big_num.of_int 5)
  else if c = '6' then
    Some(Nat_big_num.of_int 6)
  else if c = '7' then
    Some(Nat_big_num.of_int 7)
  else if c = '8' then
    Some(Nat_big_num.of_int 8)
  else if c = '9' then
    Some(Nat_big_num.of_int 9)
  else
    None)

(*val natural_of_decimal_string_helper : natural -> list char -> natural*)
let rec natural_of_decimal_string_helper acc chars:Nat_big_num.num=    
 ((match chars with 
        [] -> acc
        | c :: cs -> (match natural_of_decimal_digit c with
            Some dig -> natural_of_decimal_string_helper ( Nat_big_num.add( Nat_big_num.mul(Nat_big_num.of_int 10) acc) dig) cs
            | None -> acc
        )
    ))

(*val natural_of_decimal_string : string -> natural*)
let natural_of_decimal_string s:Nat_big_num.num=    
  (natural_of_decimal_string_helper(Nat_big_num.of_int 0) (Xstring.explode s))

(*val hex_string_of_natural : natural -> string*)
let rec hex_string_of_natural n:string=    
  (if Nat_big_num.less n(Nat_big_num.of_int 16) then Xstring.implode [hex_char_of_nibble n]
    else (hex_string_of_natural ( Nat_big_num.div n(Nat_big_num.of_int 16))) ^ (Xstring.implode [hex_char_of_nibble ( Nat_big_num.modulus n(Nat_big_num.of_int 16))]))

(*val natural_of_bool : bool -> natural*)
let natural_of_bool b:Nat_big_num.num=  
 ((match b with
    | true  ->Nat_big_num.of_int 1
    | false ->Nat_big_num.of_int 0
  ))

(*val unsafe_nat_of_natural : natural -> nat*)

(*val unsafe_int_of_natural   : natural -> int*)

(*val byte_of_natural : natural -> byte*)

(*val natural_ordering : natural -> natural -> ordering*)
(*let natural_ordering left right:ordering= 
  if (Instance_Basic_classes_Eq_Num_natural.=) left right then
    EQ
  else if (Instance_Basic_classes_Ord_Num_natural.<) left right then
    LT
  else
    GT*)

(*val merge_by : forall 'a. ('a -> 'a -> ordering) -> list 'a -> list 'a -> list 'a*)
let rec merge_by comp xs ys:'a list=  
 ((match (xs, ys) with
    | ([], ys)      -> ys
    | (xs, [])     -> xs
    | (x::xs, y::ys) ->
      if Lem.orderingEqual (comp x y) (-1) then
        x::(merge_by comp xs (y::ys))
      else
        y::(merge_by comp (x::xs) ys)
  ))

(*val sort_by : forall 'a. ('a -> 'a -> ordering) -> list 'a -> list 'a*)
(*let rec sort_by comp xs:list 'a= 
  match xs with
    | [] -> []
    | [x] -> [x]
    | xs ->
      let ls = List.take (Instance_Num_NumIntegerDivision_nat.div List.length xs 2) xs in
      let rs = List.drop (Instance_Num_NumIntegerDivision_nat.div List.length xs 2) xs in
        merge_by comp (sort_by comp ls) (sort_by comp rs)
  end*)

(** [mapMaybei f xs] maps a function expecting an index (the position in the list
  * [xs] that it is currently viewing) and producing a [maybe] type across a list.
  * Elements that produce [Nothing] under [f] are discarded in the output, whilst
  * those producing [Just e] for some [e] are kept.
  *)
(*val mapMaybei' : forall 'a 'b. (natural -> 'a -> maybe 'b) -> natural -> list 'a -> list 'b*)
let rec mapMaybei' f idx1 xs:'b list=  
 ((match xs with
  | []    -> []
  | x::xs ->
      (match f idx1 x with
      | None -> mapMaybei' f ( Nat_big_num.add(Nat_big_num.of_int 1) idx1) xs
      | Some e  -> e :: mapMaybei' f ( Nat_big_num.add(Nat_big_num.of_int 1) idx1) xs
      )
  ))

(*val mapMaybei : forall 'a 'b. (natural -> 'a -> maybe 'b) -> list 'a -> list 'b*)
    
let mapMaybei f xs:'b list=  
 (mapMaybei' f(Nat_big_num.of_int 0) xs)

(** [partitionii is xs] returns a pair of lists: firstly those elements in [xs] that are
    at indices in [is], and secondly the remaining elements. 
    It preserves the order of elements in xs. *)
(*val partitionii' : forall 'a. natural -> list natural -> list 'a 
    -> list (natural * 'a) (* accumulates the 'in' partition *)
    -> list (natural * 'a) (* accumulates the 'out' partition *)
    -> (list (natural * 'a) * list (natural * 'a))*)
let rec partitionii' (offset : Nat_big_num.num) sorted_is xs reverse_accum reverse_accum_compl:(Nat_big_num.num*'a)list*(Nat_big_num.num*'a)list=    
(  
    (* offset o means "xs begins at index o, as reckoned by the indices in sorted_is" *)(match sorted_is with
        [] -> (List.rev reverse_accum, List.rev reverse_accum_compl)
        | i :: more_is -> 
            let (length_to_split_off : int) = (Nat_big_num.to_int ( Nat_big_num.sub_nat i offset))
            in
            let (left, right) = (Lem_list.split_at length_to_split_off xs) in
            let left_indices : Nat_big_num.num list = (Lem_list.genlist 
                (fun j -> Nat_big_num.add (Nat_big_num.of_int j) offset)
                (List.length left)) 
            in
            let left_with_indices = (list_combine left_indices left) in
            (* left begins at offset, right begins at offset + i *)
            (match right with 
                [] -> (* We got to the end of the list before the target index. *) 
                    (List.rev reverse_accum, 
                     List.rev_append reverse_accum_compl left_with_indices)
                | x :: more_xs -> 
                    (* x is at index i by definition, so more_xs starts with index i + 1 *)
                    partitionii' (Nat_big_num.add i(Nat_big_num.of_int 1)) more_is more_xs ((i, x) :: reverse_accum) 
                        (List.rev_append left_with_indices reverse_accum_compl)
            )
    ))

(*val filteri : forall 'a. list natural -> list 'a -> list 'a*)
let filteri is xs:'a list=    
  (let sorted_is = (List.sort Nat_big_num.compare is) in
    let (accum, accum_compl) = (partitionii'(Nat_big_num.of_int 0) sorted_is xs [] [])
    in 
    let (just_indices, just_items) = (List.split accum)
    in 
    just_items)

(*val filterii : forall 'a. list natural -> list 'a -> list (natural * 'a)*)
let filterii is xs:(Nat_big_num.num*'a)list=    
  (let sorted_is = (List.sort Nat_big_num.compare is) in
    let (accum, accum_compl) = (partitionii'(Nat_big_num.of_int 0) sorted_is xs [] [])
    in 
    accum)

(*val partitioni : forall 'a. list natural -> list 'a -> (list 'a * list 'a)*)
let partitioni is xs:'a list*'a list=    
  (let sorted_is = (List.sort Nat_big_num.compare is) in
    let (accum, accum_compl) = (partitionii'(Nat_big_num.of_int 0) sorted_is xs [] [])
    in
    let (just_indices, just_items) = (List.split accum)
    in
    let (just_indices_compl, just_items_compl) = (List.split accum_compl)
    in
    (just_items, just_items_compl))

(*val partitionii : forall 'a. list natural -> list 'a -> (list (natural * 'a) * list (natural * 'a))*)
let partitionii is xs:(Nat_big_num.num*'a)list*(Nat_big_num.num*'a)list=    
  (let sorted_is = (List.sort Nat_big_num.compare is) in
    partitionii'(Nat_big_num.of_int 0) sorted_is xs [] [])

(** [unzip3 ls] takes a list of triples and returns a triple of lists. *)
(*val unzip3: forall 'a 'b 'c. list ('a * 'b * 'c) -> (list 'a * list 'b * list 'c)*)
let rec unzip3 l:'a list*'b list*'c list=  ((match l with
  | [] -> ([], [], [])
  | (x, y, z) :: xyzs -> let (xs, ys, zs) = (unzip3 xyzs) in ((x :: xs), (y :: ys), (z :: zs))
))

(** [zip3 ls] takes a triple of lists and returns a list of triples. *)
(*val zip3: forall 'a 'b 'c. list 'a -> list 'b -> list 'c -> list ('a * 'b * 'c)*)
let rec zip3 alist blist clist:('a*'b*'c)list=  ((match (alist, blist, clist) with
  | ([], [], []) -> []
  | (x :: morex, y :: morey, z :: morez) -> let more_xyz = (zip3 morex morey morez) in (x, y, z) :: more_xyz
))

(** [null_byte] is the null character a a byte. *)
(*val null_byte : byte*)

(** [null_char] is the null character. *)
(*val null_char : char*)
let null_char:char=  ( '\000')

(** [println s] prints [s] to stdout, adding a trailing newline. *)
(* val println : string -> unit *)
(* declare ocaml target_rep function println = `print_endline` *)

(** [prints s] prints [s] to stdout, without adding a trailing newline. *)
(* val prints : string -> unit *)
(* declare ocaml target_rep function prints = `print_string` *)

(** [errln s] prints [s] to stderr, adding a trailing newline. *)
(*val errln : string -> unit*)

(** [errs s] prints [s] to stderr, without adding a trailing newline. *)
(*val errs : string -> unit*)

(** [outln s] prints [s] to stdout, adding a trailing newline. *)
(*val outln : string -> unit*)

(** [outs s] prints [s] to stdout, without adding a trailing newline. *)
(*val outs : string -> unit*)

(** [intercalate sep xs] places [sep] between all elements of [xs].
  * Made tail recursive and unrolled slightly to improve performance on large
  * lists.*)
(*val intercalate' : forall 'a. 'a -> list 'a -> list 'a -> list 'a*)
let rec intercalate' sep xs accum:'a list=	
 ((match xs with
		| []       -> List.rev accum
		| [x]      ->  List.rev_append (List.rev (List.rev accum)) [x]
		| [x; y]   ->  List.rev_append (List.rev (List.rev accum)) [x; sep; y]
		| x::y::xs -> intercalate' sep xs (sep::(y::(sep::(x::accum))))
	))
	
(*val intercalate : forall 'a. 'a -> list 'a -> list 'a*)
let intercalate sep xs:'a list=  (intercalate' sep xs [])

(** [unlines xs] concatenates a list of strings [xs], placing each entry
  * on a new line.
  *)
(*val unlines : list string -> string*)
let unlines xs:string=  
 (List.fold_left (^) "" (intercalate "\n" xs))

(** [bracket xs] concatenates a list of strings [xs], separating each entry with a
  * space, and bracketing the resulting string.
  *)
(*val bracket : list string -> string*)
let bracket xs:string=  
 ("(" ^ (List.fold_left (^) "" (intercalate " " xs) ^ ")"))
	
(** [string_of_list l] produces a string representation of list [l].
  *)
(*val string_of_list : forall 'a. Show 'a => list 'a -> string*)
let string_of_list dict_Show_Show_a l:string=  
 (let result = (intercalate "," (Lem_list.map  
  dict_Show_Show_a.show_method l)) in
  let folded = (List.fold_left (^) "" result) in
    "[" ^ (folded ^ "]"))

let instance_Show_Show_list_dict dict_Show_Show_a:('a list)show_class= ({

  show_method = 
  (string_of_list dict_Show_Show_a)})

(** [split_string_on_char s c] splits a string [s] into a list of substrings
  * on character [c], otherwise returning the singleton list containing [s]
  * if [c] is not found in [s].
  * 
  * NOTE: quirkily, this doesn't discard separators (e.g. because NUL characters 
  * are significant when indexing into string tables). FIXME: given this, is this 
  * function really reusable? I suspect not.
  *)
(*val split_string_on_char : string -> char -> list string*)

(* [find_substring sub s] returns the index at which *)
(*val find_substring : string -> string -> maybe natural*)

(** [string_of_nat m] produces a string representation of natural number [m]. *)
(*val string_of_nat : nat -> string*)

(** [string_suffix i s] returns all but the first [i] characters of [s].
  * Fails if the index is negative, or beyond the end of the string.
  *)
(*val string_suffix : natural -> string -> maybe string*)
  
(*val nat_length : forall 'a. list 'a -> nat*)
  
(*val length : forall 'a. list 'a -> natural*)
let length xs:Nat_big_num.num=  (Nat_big_num.of_int (List.length xs))

(*val takeRevAcc : forall 'a. natural -> list 'a -> list 'a -> list 'a*)
let rec takeRevAcc m xs rev_acc:'a list=  
 ((match xs with
    | []    -> List.rev rev_acc
    | x::xs ->
      if Nat_big_num.equal m(Nat_big_num.of_int 0) then
        List.rev rev_acc
      else
        takeRevAcc ( Nat_big_num.sub_nat m(Nat_big_num.of_int 1)) xs (x::rev_acc)
  ))

(** [take cnt xs] takes the first [cnt] elements of list [xs].  Returns a truncation
  * if [cnt] is greater than the length of [xs].
  *)
(*val take : forall 'a. natural -> list 'a -> list 'a*)
let rec take0 m xs:'a list=  
 (takeRevAcc m xs [])
  
(** [drop cnt xs] returns all but the first [cnt] elements of list [xs].  Returns an empty list
  * if [cnt] is greater than the length of [xs].
  *)
(*val drop : forall 'a. natural -> list 'a -> list 'a*)
let rec drop0 m xs:'a list=  
 ((match xs with
    | []    -> []
    | x::xs ->
      if Nat_big_num.equal m(Nat_big_num.of_int 0) then
        x::xs
      else
        drop0 ( Nat_big_num.sub_nat m(Nat_big_num.of_int 1)) xs
  ))
  
(** [string_prefix i s] returns the first [i] characters of [s].
  * Fails if the index is negative, or beyond the end of the string.
  *)
(*val string_prefix : natural -> string -> maybe string*)
(*let string_prefix m s:maybe(string)= 
  let cs = String.toCharList s in
    if (Instance_Basic_classes_Ord_Num_natural.>) m (length cs) then
      Nothing
    else
      Just (String.toString (take m cs))*)
(* FIXME: isabelle *)

(** [string_index_of c s] returns [Just(i)] where [i] is the index of the first 
  * occurrence if [c] in [s], if it exists, otherwise returns [Nothing]. *)
(*val string_index_of' : char -> list char -> natural -> maybe natural*)
let rec string_index_of' e ss idx1:(Nat_big_num.num)option=  
 ((match ss with
    | []    -> None
    | s::ss ->
      if s = e then
        Some idx1
      else
        string_index_of' e ss ( Nat_big_num.add(Nat_big_num.of_int 1) idx1)
  ))
  
(*val string_index_of : char -> string -> maybe natural*)
(*let string_index_of e s:maybe(natural)=  string_index_of' e (String.toCharList s) 0*)

(*val index : forall 'a. natural -> list 'a -> maybe 'a*)
(*let rec index m xs:maybe 'a= 
  match xs with
    | []    -> Nothing
    | x::xs ->
        if (Instance_Basic_classes_Eq_Num_natural.=) m 0 then
          Just x
        else
          index ((Instance_Num_NumMinus_Num_natural.-) m 1) xs
  end*)

(*val find_index_helper : forall 'a. natural -> ('a -> bool) -> list 'a -> maybe natural*)
let rec find_index_helper count p xs:(Nat_big_num.num)option=	
 ((match xs with
		| []    -> None
		| y::ys ->
			if p y then
				Some count
			else
				find_index_helper ( Nat_big_num.add count(Nat_big_num.of_int 1)) p ys
	))

(*val find_index : forall 'a. ('a -> bool) -> list 'a -> maybe natural*)
let find_index0 p xs:(Nat_big_num.num)option=  (find_index_helper(Nat_big_num.of_int 0) p xs)

(*val argv : list string*)

(*val replicate_revacc : forall 'a. list 'a -> natural -> 'a -> list 'a*)
let rec replicate_revacc revacc len e:'a list= 
  (
  if(Nat_big_num.equal len (Nat_big_num.of_int 0)) then (List.rev revacc)
  else
    (replicate_revacc (e :: revacc)
       ( Nat_big_num.sub_nat len (Nat_big_num.of_int 1)) e))

(*val replicate : forall 'a. natural -> 'a -> list 'a*)
let rec replicate0 len e:'a list=	
 (replicate_revacc [] len e)

(* We want a tail-recursive append. reverse_append l1 l2 appends l2 to the
 * reverse of l1. So we get [l1-backwards] [l2]. So just reverse l1. *)
(*val list_append : forall 'a. list 'a -> list 'a -> list 'a*)
let list_append l1 l2:'a list=    
 (List.rev_append (List.rev l1) l2)

(*val list_concat : forall 'a. list (list 'a) -> list 'a*) 
let list_concat ll:'a list=  (List.fold_left list_append [] ll)

(*val list_concat_map : forall 'a 'b. ('a -> list 'b) -> list 'a -> list 'b*)
let list_concat_map f l:'b list=    
  (list_concat (Lem_list.map f l))

(*val list_reverse_concat_map_helper : forall 'a 'b. ('a -> list 'b) -> list 'b -> list 'a -> list 'b*)
let rec list_reverse_concat_map_helper f acc ll:'b list=    
  (let lcons = (fun l -> (fun i -> i :: l))
    in
    (match ll with
      | []      -> acc
      | item :: items -> 
            (* item is a thing that maps to a list. it needn't be a list yet *)
            let mapped_list = (f item)
            in 
            (* let _ = Missing_pervasives.errln ("Map function gave us a list of " ^ (show (List.length mapped_list)) ^ " items") in *)
            list_reverse_concat_map_helper f (List.fold_left lcons acc (f item)) items
    ))

(*val list_reverse_concat_map : forall 'a 'b. ('a -> list 'b) -> list 'a -> list 'b*)
let list_reverse_concat_map f ll:'b list=  (list_reverse_concat_map_helper f [] ll)

(*val list_take_with_accum : forall 'a. nat -> list 'a -> list 'a -> list 'a*)
let rec list_take_with_accum n reverse_acc l:'a list=   
( 
  (*  let _ = Missing_pervasives.errs ("Taking a byte; have accumulated " ^ (show (List.length acc) ^ " so far\n"))
   in *)(match n with
        0 -> List.rev reverse_acc
      | _ -> (match l with
            [] -> failwith "list_take_with_accum: not enough elements"
            | x :: xs -> list_take_with_accum (Nat_num.nat_monus n( 1)) (x :: reverse_acc) xs
        )
    ))

(*val unsafe_string_take : natural -> string -> string*)
let unsafe_string_take m str:string=  
 (let m = (Nat_big_num.to_int m) in
    Xstring.implode (Lem_list.take m (Xstring.explode str)))

(** [padding_and_maybe_newline c w s] creates enough of char [c] to pad string [s] to [w] characters, 
  * unless [s] is of length [w - 1] or greater, in which case it generates [w] copies preceded by a newline.
  * This style of formatting is used by the GNU linker in its link map output, so we
  * reproduce it using this function. Note that string [s] does not appear in the
  * output. *)
(*val padding_and_maybe_newline : char -> natural -> string -> string*)
let padding_and_maybe_newline c width str:string=    
  (let padlen = (Nat_big_num.sub_nat width (Nat_big_num.of_int (String.length str))) in
    (if Nat_big_num.less_equal padlen(Nat_big_num.of_int 1) then "\n" else "")
     ^ (Xstring.implode (replicate0 (if Nat_big_num.less_equal padlen(Nat_big_num.of_int 1) then width else padlen) c)))

(** [space_padding_and_maybe_newline w s] creates enoughspaces to pad string [s] to [w] characters, 
  * unless [s] is of length [w - 1] or greater, in which case it generates [w] copies preceded by a newline.
  * This style of formatting is used by the GNU linker in its link map output, so we
  * reproduce it using this function. Note that string [s] does not appear in the
  * output. *)
(*val space_padding_and_maybe_newline : natural -> string -> string*)
let space_padding_and_maybe_newline width str:string=    
  (padding_and_maybe_newline ' ' width str)

(** [padded_and_maybe_newline w s] pads string [s] to [w] characters, using char [c]
  * unless [s] is of length [w - 1] or greater, in which case the padding consists of
  * [w] copies of [c] preceded by a newline.
  * This style of formatting is used by the GNU linker in its link map output, so we
  * reproduce it using this function. *)
(*val padded_and_maybe_newline : char -> natural -> string -> string*)
let padded_and_maybe_newline c width str:string=    
  (str ^ (padding_and_maybe_newline c width str))

(** [padding_to c w s] creates enough copies of [c] to pad string [s] to [w] characters, 
  * or 0 characters if [s] is of length [w] or greater. Note that string [s] does not appear in the
  * output. *)
(*val padding_to : char -> natural -> string -> string*)
let padding_to c width str:string=    
  (let padlen = (Nat_big_num.sub_nat width (Nat_big_num.of_int (String.length str))) in
    if Nat_big_num.less_equal padlen(Nat_big_num.of_int 0) then "" else (Xstring.implode (replicate0 padlen c)))

(** [left_padded_to c w s] left-pads string [s] to [w] characters using [c], 
  * returning it unchanged if [s] is of length [w] or greater. *)
(*val left_padded_to : char -> natural -> string -> string*)
let left_padded_to c width str:string=    
  ((padding_to c width str) ^ str)
    
(** [right_padded_to c w s] right-pads string [s] to [w] characters using [c], 
  * returning it unchanged if [s] is of length [w] or greater. *)
(*val right_padded_to : char -> natural -> string -> string*)
let right_padded_to c width str:string=    
  (str ^ (padding_to c width str))

(** [space_padded_and_maybe_newline w s] pads string [s] to [w] characters, using spaces,
  * unless [s] is of length [w - 1] or greater, in which case the padding consists of
  * [w] spaces preceded by a newline.
  * This style of formatting is used by the GNU linker in its link map output, so we
  * reproduce it using this function. *)
(*val space_padded_and_maybe_newline : natural -> string -> string*)
let space_padded_and_maybe_newline width str:string=    
  (str ^ (padding_and_maybe_newline ' ' width str))

(** [left_space_padded_to w s] left-pads string [s] to [w] characters using spaces, 
  * returning it unchanged if [s] is of length [w] or greater. *)
(*val left_space_padded_to : natural -> string -> string*)
let left_space_padded_to width str:string=    
  ((padding_to ' ' width str) ^ str)
    
(** [right_space_padded_to w s] right-pads string [s] to [w] characters using spaces, 
  * returning it unchanged if [s] is of length [w] or greater. *)
(*val right_space_padded_to : natural -> string -> string*)
let right_space_padded_to width str:string=    
  (str ^ (padding_to ' ' width str))

(** [left_zero_padded_to w s] left-pads string [s] to [w] characters using zeroes, 
  * returning it unchanged if [s] is of length [w] or greater. *)
(*val left_zero_padded_to : natural -> string -> string*)
let left_zero_padded_to width str:string=    
  ((padding_to '0' width str) ^ str)
 