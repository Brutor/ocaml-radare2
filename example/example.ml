let () =
  let r2 = R2.of_pipe () in
  R2.command ~r2 "?E Hello from OCaml!" |> print_endline;
  exit 0
