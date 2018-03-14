(** Interact with radare2, ideal for utop interaction *)

(** A running instance of r2 *)
type t

(** Send a command to r2, get back plain string output *)
val command : r2:t -> string -> string

(** Send a command to r2, get back Yojson. If output isn't JSON
    parsable then raises {Invalid_argument} so make sure command starts
    with /j *)
val command_json : r2:t -> string -> Yojson.Basic.json

(** Create a r2 instance with a given file, raises {Invalid_argument}
    if file doesn't exists *)
val open_file : string -> t

(** Get a r2 instance handler from the parent r2 process,
    throws if program not launched from r2 *)
val of_pipe : unit -> t

(** close a r2 instance *)
val close : t -> unit

(** Convenience function for opening a r2 instance, sending a command,
    getting the result as plain string and closing the r2 instance *)
val with_command : cmd:string -> string -> string

(** Convenience function for opening a r2 instance, sending a command,
    getting the result as Yojson and closing the r2 instance *)
val with_command_j : cmd:string -> string -> Yojson.Basic.json
