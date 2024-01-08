open Core
open Sarif

let%expect_test "malformed_iso8601_date" =
  let json = In_channel.read_all "data/malformed.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let artifact = Sarif_v_2_1_0_j.string_of_artifact @@ List.nth_exn (Option.value_exn parsed_run.artifacts) 0 in
  let parsed_artifact = Sarif_v_2_1_0_j.artifact_of_string artifact in
  let res = Sarif_v_2_1_0_util.validate_artifact parsed_artifact in
  if res then print_endline "true" else print_endline "false";
  [%expect {|false|}]

let%expect_test "malformed_mime_type" =
  let json = In_channel.read_all "data/malformed.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let artifact = Sarif_v_2_1_0_j.string_of_artifact @@ List.nth_exn (Option.value_exn parsed_run.artifacts) 1 in
  let parsed_artifact = Sarif_v_2_1_0_j.artifact_of_string artifact in
  let res = Sarif_v_2_1_0_util.validate_artifact parsed_artifact in
  if res then print_endline "true" else print_endline "false";
  [%expect {|false|}]

let%expect_test "malformed_minimum_zero" =
  let json = In_channel.read_all "data/malformed.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let artifact = Sarif_v_2_1_0_j.string_of_artifact @@ List.nth_exn (Option.value_exn parsed_run.artifacts) 2 in
  let parsed_artifact = Sarif_v_2_1_0_j.artifact_of_string artifact in
  let res = Sarif_v_2_1_0_util.validate_artifact parsed_artifact in
  if res then print_endline "true" else print_endline "false";
  [%expect {|false|}]

let%expect_test "malformed_minimum_one" =
  let json = In_channel.read_all "data/malformed.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result = Sarif_v_2_1_0_j.string_of_result @@ List.nth_exn (Option.value_exn parsed_run.results) 0 in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let res = Sarif_v_2_1_0_util.validate_result parsed_result in
  if res then print_endline "true" else print_endline "false";
  [%expect {|false|}]

let%expect_test "malformed_minimum_minus_one" =
  let json = In_channel.read_all "data/malformed.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let artifact = Sarif_v_2_1_0_j.string_of_artifact @@ List.nth_exn (Option.value_exn parsed_run.artifacts) 3 in
  let parsed_artifact = Sarif_v_2_1_0_j.artifact_of_string artifact in
  let res = Sarif_v_2_1_0_util.validate_artifact parsed_artifact in
  if res then print_endline "true" else print_endline "false";
  [%expect {|false|}]

let%expect_test "malformed_guid" =
  let json = In_channel.read_all "data/malformed.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result = Sarif_v_2_1_0_j.string_of_result @@ List.nth_exn (Option.value_exn parsed_run.results) 1 in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let res = Sarif_v_2_1_0_util.validate_result parsed_result in
  if res then print_endline "true" else print_endline "false";
  [%expect {|false|}]

let%expect_test "malformed_dotted_quad_file" =
  let json = In_channel.read_all "data/malformed.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let taxonomies = Sarif_v_2_1_0_j.string_of_tool_component @@ List.hd_exn @@ Option.value_exn parsed_run.taxonomies in
  let parsed_taxonomies = Sarif_v_2_1_0_j.tool_component_of_string taxonomies in
  let res = Sarif_v_2_1_0_util.validate_tool_component parsed_taxonomies in
  if res then print_endline "true" else print_endline "false";
  [%expect {|false|}]

let%expect_test "malformed_language" =
  let json = In_channel.read_all "data/malformed1.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let res = Sarif_v_2_1_0_util.validate_run parsed_run in
  if res then print_endline "true" else print_endline "false";
  [%expect {|false|}]

let%expect_test "malformed_none_unique" =
  let json = In_channel.read_all "data/malformed1.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result = Sarif_v_2_1_0_j.string_of_result @@ List.hd_exn @@ Option.value_exn parsed_run.results in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let res = Sarif_v_2_1_0_util.validate_result parsed_result in
  if res then print_endline "true" else print_endline "false";
  [%expect {|false|}]

let%expect_test "malformed_rank" =
  let json = In_channel.read_all "data/malformed2.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result = Sarif_v_2_1_0_j.string_of_result @@ List.hd_exn @@ Option.value_exn parsed_run.results in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let res = Sarif_v_2_1_0_util.validate_result parsed_result in
  if res then print_endline "true" else print_endline "false";
  [%expect {|false|}]

let%expect_test "malformed_uri" =
  let json = In_channel.read_all "data/malformed3.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result = Sarif_v_2_1_0_j.string_of_result @@ List.hd_exn @@ Option.value_exn parsed_run.results in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let res = Sarif_v_2_1_0_util.validate_result parsed_result in
  if res then print_endline "true" else print_endline "false";
  [%expect {|false|}]

let%expect_test "malformed_list_min_size_one" =
  let json = In_channel.read_all "data/malformed4.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let res = Sarif_v_2_1_0_util.validate_run parsed_run in
  if res then print_endline "true" else print_endline "false";
  [%expect {|false|}]