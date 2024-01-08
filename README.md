[![CI](https://github.com/gborough/sarif/actions/workflows/ci.yml/badge.svg)](https://github.com/gborough/sarif/actions/workflows/ci.yml)

# SARIF(v2.1.0)

Reference implementation of the Static Analysis Results Interchange Format (SARIF) For OCaml, currently supporting version 2.1.0(latest)

This library uses atdgen to generate ocaml types therefore familiarity with its naming and conversion convention is highly recommended

## User Manual

### Module organisation

The core type of sarif is: Sarif_v_2_1_0_t.sarif_json_schema

Sarif_v_2_1_0_t -> Generated ocaml types for all sarif objects and properties

Sarif_v_2_1_0_j -> Generated json helper functions for all relevant ocaml types

Sarif_v_2_1_0_v -> Generated validation functions for all relevant ocaml types

Sarif_v_2_1_0_util -> Utility functions which the validation functions rely on

### Parsing example

Assume that a well-formed sarif json file "example.sarif" and we'd like to parse and print

```ocaml
open Core
open Sarif

let sarif_json = In_channel.read_all "example.sarif" in
let parsed_core_type = Sarif_v_2_1_0_j.sarif_json_schema_of_string sarif_json in
let core_type_string = Sarif_v_2_1_0_j.string_of_sarif_json_schema parsed_core_type in
print_endline core_type_string
```

### Validation example

Assume that a malformed sarif json file "malformed.sarif" and we suspect the "runs" field is invalid

```ocaml
open Core
open Sarif

let sarif_json = In_channel.read_all "malformed.sarif" in
let parsed_core_type = Sarif_v_2_1_0_j.sarif_json_schema_of_string sarif_json in
let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_core_type.runs in
let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
let res = Sarif_v_2_1_0_util.validate_run parsed_run in
if res then print_endline "valid" else print_endline "invalid"
```

Or to validate payload via directly constructing the types with Sarif_v_2_1_0_t, we can use validation functions present in Sarif_v_2_1_0_v. Please refer to atdgen validation example(https://github.com/ahrefs/atd/tree/master/doc/atdgen-tutorial-data/validate)

## License

This project is licensed under the [MIT license].

[MIT license]: https://github.com/gborough/sarif/blob/main/LICENSE

## Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in sarif by you, shall be licensed as MIT, without any additional
terms or conditions.