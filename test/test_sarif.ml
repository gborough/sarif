open Core
open Sarif

let%expect_test "code_flows" =
  let json = In_channel.read_all "data/code_flows.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result = Sarif_v_2_1_0_j.string_of_result @@ List.hd_exn @@ Option.value_exn parsed_run.results in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let code_flows = Sarif_v_2_1_0_j.string_of_code_flow @@ List.hd_exn @@ Option.value_exn parsed_result.code_flows in
  print_endline code_flows;
  [%expect {| {"message":{"text":"Path from declaration to usage."},"threadFlows":[{"locations":[{"importance":"essential","location":{"logicalLocations":[{"fullyQualifiedName":"collections::list::add"}],"message":{"text":"Variable 'ptr' declared."},"physicalLocation":{"artifactLocation":{"uri":"collections/list.h"},"region":{"snippet":{"text":"int* ptr;"},"startColumn":"8","startLine":"15"}}}},{"importance":"unimportant","location":{"logicalLocations":[{"fullyQualifiedName":"collections::list::add"}],"physicalLocation":{"artifactLocation":{"uri":"collections/list.h"},"region":{"snippet":{"text":"offset = 0;"},"startColumn":"8","startLine":"18"}}}},{"importance":"essential","location":{"logicalLocations":[{"fullyQualifiedName":"collections::list::add"}],"message":{"text":"Uninitialized variable 'ptr' passed to method 'add_core'."},"physicalLocation":{"artifactLocation":{"uri":"collections/list.h"},"region":{"snippet":{"text":"add_core(ptr, offset, val)"},"startColumn":"8","startLine":"25"}}}}]}]} |}]

let%expect_test "context_region" =
  let json = In_channel.read_all "data/context_region.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result = Sarif_v_2_1_0_j.string_of_result @@ List.hd_exn @@ Option.value_exn parsed_run.results in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let location = Sarif_v_2_1_0_j.string_of_location @@ List.hd_exn @@ Option.value_exn parsed_result.locations in
  let parsed_location = Sarif_v_2_1_0_j.location_of_string location in
  let physical_location = Sarif_v_2_1_0_j.string_of_physical_location @@ Option.value_exn parsed_location.physical_location in
  let parsed_physical_location = Sarif_v_2_1_0_j.physical_location_of_string physical_location in
  let context_region = Sarif_v_2_1_0_j.string_of_region @@ Option.value_exn parsed_physical_location.context_region in
  print_endline context_region;
  [%expect {| {"endColumn":"28","snippet":{"text":"/// This is a BAD word."},"startColumn":"5","startLine":"4"} |}]

let%expect_test "default_rule_configuration" =
  let json = In_channel.read_all "data/default_rule_configuration.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let tool = Sarif_v_2_1_0_j.string_of_tool parsed_run.tool in
  let parsed_tool = Sarif_v_2_1_0_j.tool_of_string tool in
  let driver = Sarif_v_2_1_0_j.string_of_tool_component parsed_tool.driver in
  let parsed_driver = Sarif_v_2_1_0_j.tool_component_of_string driver in
  let rules = Sarif_v_2_1_0_j.string_of_reporting_descriptor @@ List.hd_exn @@ Option.value_exn parsed_driver.rules in
  print_endline rules;
  [%expect {| {"defaultConfiguration":{"level":"error"},"id":"TUT0001"} |}]

let%expect_test "embedded_binary_content" =
  let json = In_channel.read_all "data/embedded_binary_content.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result = Sarif_v_2_1_0_j.string_of_result @@ List.hd_exn @@ Option.value_exn parsed_run.results in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let location = Sarif_v_2_1_0_j.string_of_location @@ List.hd_exn @@ Option.value_exn parsed_result.locations in
  print_endline location;
  [%expect {| {"physicalLocation":{"artifactLocation":{"index":"0","uri":"data.bin"},"region":{"byteLength":"2","byteOffset":"2"}}} |}]

let%expect_test "embedded_text_content" =
  let json = In_channel.read_all "data/embedded_text_content.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let artifacts = Sarif_v_2_1_0_j.string_of_artifact @@ List.hd_exn @@ Option.value_exn parsed_run.artifacts in
  print_endline artifacts;
  [%expect {| {"contents":{"text":"Hello,\r\nworld"},"encoding":"UTF-8","location":{"uri":"explicit.txt"}} |}]

let%expect_test "notifications" =
  let json = In_channel.read_all "data/notifications.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let tool = Sarif_v_2_1_0_j.string_of_tool parsed_run.tool in
  let parsed_tool = Sarif_v_2_1_0_j.tool_of_string tool in
  let driver = Sarif_v_2_1_0_j.string_of_tool_component parsed_tool.driver in
  let parsed_driver = Sarif_v_2_1_0_j.tool_component_of_string driver in
  let notifications = Sarif_v_2_1_0_j.string_of_reporting_descriptor @@ List.hd_exn @@ Option.value_exn parsed_driver.notifications in
  print_endline notifications;
  [%expect {| {"defaultConfiguration":{"level":"warning"},"id":"TUTN9001","messageStrings":{"disabled":{"text":"'{0}' cannot be disabled because this rule does not exist."},"enabled":{"text":"'{0}' cannot be enabled because this rule does not exist."}},"name":"unknown-rule"} |}]

let%expect_test "original_uri_base_ids" =
  let json = In_channel.read_all "data/original_uri_base_ids.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let original_uri_base_ids = Sarif_v_2_1_0_j.string_of_hm_str_al @@ Option.value_exn parsed_run.original_uri_base_ids in
  print_endline original_uri_base_ids;
  [%expect {| {"REPOROOT":{"description":{"text":"The directory into which the repo was cloned."},"properties":{"comment":"The SARIF producer has chosen not to specify a URI for REPOROOT. See §3.14.14, NOTE 1, for an explanation."}},"SRCROOT":{"description":{"text":"The r."},"properties":{"comment":"SRCROOT is expressed relative to REPOROOT."},"uri":"src/","uriBaseId":"REPOROOT"},"LOGSROOT":{"description":{"text":"Destination for tool logs."},"properties":{"comment":"An originalUriBaseId that resolves directly to an absolute URI."},"uri":"file:///C:/logs/"}} |}]

let%expect_test "regional_variants" =
  let json = In_channel.read_all "data/regional_variants.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result = Sarif_v_2_1_0_j.string_of_result @@ List.hd_exn @@ Option.value_exn parsed_run.results in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let location = Sarif_v_2_1_0_j.string_of_location @@ List.hd_exn @@ Option.value_exn parsed_result.locations in
  print_endline location;
  [%expect {| {"physicalLocation":{"artifactLocation":{"index":"0","uri":"TextFile.txt"},"region":{"endColumn":"4","endLine":"1","startColumn":"2","startLine":"1"}}} |}]

let%expect_test "result_stacks" =
  let json = In_channel.read_all "data/result_stacks.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result = Sarif_v_2_1_0_j.string_of_result @@ List.hd_exn @@ Option.value_exn parsed_run.results in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let stacks = Sarif_v_2_1_0_j.string_of_stack @@ List.hd_exn @@ Option.value_exn parsed_result.stacks in
  print_endline stacks;
  [%expect {| {"frames":[{"location":{"logicalLocations":[{"fullyQualifiedName":"collections::list::add_core"}],"message":{"text":"Exception thrown."},"physicalLocation":{"artifactLocation":{"uri":"collections/list.h","uriBaseId":"SRCROOT"},"region":{"startColumn":"15","startLine":"110"}}},"module":"platform","parameters":["null","0","14"],"threadId":"52"},{"location":{"logicalLocations":[{"fullyQualifiedName":"collections::list::add"}],"physicalLocation":{"artifactLocation":{"uri":"collections/list.h","uriBaseId":"SRCROOT"},"region":{"startColumn":"15","startLine":"43"}}},"module":"platform","parameters":["14"],"threadId":"52"},{"location":{"logicalLocations":[{"fullyQualifiedName":"main"}],"physicalLocation":{"artifactLocation":{"uri":"application/main.cpp","uriBaseId":"SRCROOT"},"region":{"startColumn":"9","startLine":"28"}}},"module":"application","threadId":"52"}],"message":{"text":"Call stack resulting from usage of uninitialized variable."}} |}]

let%expect_test "rule_metadata" =
  let json = In_channel.read_all "data/rule_metadata.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let tool = Sarif_v_2_1_0_j.string_of_tool parsed_run.tool in
  let parsed_tool = Sarif_v_2_1_0_j.tool_of_string tool in
  let driver = Sarif_v_2_1_0_j.string_of_tool_component parsed_tool.driver in
  let parsed_driver = Sarif_v_2_1_0_j.tool_component_of_string driver in
  let rules = Sarif_v_2_1_0_j.string_of_reporting_descriptor @@ List.hd_exn @@ Option.value_exn parsed_driver.rules in
  print_endline rules;
  [%expect {| {"defaultConfiguration":{"level":"error"},"fullDescription":{"markdown":"Every JSON property whose value is defined by the schema to be a URI (with `\"format\": \"uri\"` or `\"format\": \"uri-reference\"`) must contain a valid URI.","text":"Every JSON property whose value is defined by the schema to be a URI (with \"format\": \"uri\" or \"format\": \"uri-reference\") must contain a valid URI."},"id":"TUT1001","messageStrings":{"default":{"markdown":"The URI `{0}` is invalid.","text":"The URI '{0}' is invalid."}},"name":"InvalidUri"} |}]

let%expect_test "suppresions" =
  let json = In_channel.read_all "data/suppresions.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result = Sarif_v_2_1_0_j.string_of_result @@ List.nth_exn (Option.value_exn parsed_run.results) 1 in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let suppressions = Sarif_v_2_1_0_j.string_of_suppression @@ List.hd_exn @@ Option.value_exn parsed_result.suppressions in
  print_endline suppressions;
  [%expect {| {"kind":"inSource"} |}]

let%expect_test "taxonomies" =
  let json = In_channel.read_all "data/taxonomies.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd_exn @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let taxonomies = Sarif_v_2_1_0_j.string_of_tool_component @@ List.hd_exn @@ Option.value_exn parsed_run.taxonomies in
  print_endline taxonomies;
  [%expect {| {"guid":"1A567403-868F-405E-92CF-771A9ECB03A1","name":"Requirement levels","shortDescription":{"text":"This taxonomy classifies rules according to whether their use is required or recommended by company policy."},"taxa":[{"id":"RQL1001","name":"Required"},{"id":"RQL1002","name":"Recommended"}]} |}]