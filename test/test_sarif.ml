open Sarif

let read_all file =
  let ic = open_in_bin file in
  let s = really_input_string ic (in_channel_length ic) in
  close_in ic;
  s

let%expect_test "code_flows" =
  let json = read_all "data/code_flows.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result = Sarif_v_2_1_0_j.string_of_result @@ List.hd @@ Option.get parsed_run.results in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let code_flows = Sarif_v_2_1_0_j.string_of_code_flow @@ List.hd @@ Option.get parsed_result.code_flows in
  print_endline code_flows;
  [%expect {| {"message":{"text":"Path from declaration to usage."},"threadFlows":[{"locations":[{"importance":"essential","location":{"logicalLocations":[{"fullyQualifiedName":"collections::list::add"}],"message":{"text":"Variable 'ptr' declared."},"physicalLocation":{"artifactLocation":{"uri":"collections/list.h"},"region":{"snippet":{"text":"int* ptr;"},"startColumn":8,"startLine":15}}}},{"importance":"unimportant","location":{"logicalLocations":[{"fullyQualifiedName":"collections::list::add"}],"physicalLocation":{"artifactLocation":{"uri":"collections/list.h"},"region":{"snippet":{"text":"offset = 0;"},"startColumn":8,"startLine":18}}}},{"importance":"essential","location":{"logicalLocations":[{"fullyQualifiedName":"collections::list::add"}],"message":{"text":"Uninitialized variable 'ptr' passed to method 'add_core'."},"physicalLocation":{"artifactLocation":{"uri":"collections/list.h"},"region":{"snippet":{"text":"add_core(ptr, offset, val)"},"startColumn":8,"startLine":25}}}}]}]} |}]

let%expect_test "context_region" =
  let json = read_all "data/context_region.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result = Sarif_v_2_1_0_j.string_of_result @@ List.hd @@ Option.get parsed_run.results in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let location = Sarif_v_2_1_0_j.string_of_location @@ List.hd @@ Option.get parsed_result.locations in
  let parsed_location = Sarif_v_2_1_0_j.location_of_string location in
  let physical_location = Sarif_v_2_1_0_j.string_of_physical_location @@ Option.get parsed_location.physical_location in
  let parsed_physical_location = Sarif_v_2_1_0_j.physical_location_of_string physical_location in
  let context_region = Sarif_v_2_1_0_j.string_of_region @@ Option.get parsed_physical_location.context_region in
  print_endline context_region;
  [%expect {| {"endColumn":28,"snippet":{"text":"/// This is a BAD word."},"startColumn":5,"startLine":4} |}]

let%expect_test "default_rule_configuration" =
  let json = read_all "data/default_rule_configuration.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let tool = Sarif_v_2_1_0_j.string_of_tool parsed_run.tool in
  let parsed_tool = Sarif_v_2_1_0_j.tool_of_string tool in
  let driver = Sarif_v_2_1_0_j.string_of_tool_component parsed_tool.driver in
  let parsed_driver = Sarif_v_2_1_0_j.tool_component_of_string driver in
  let rules = Sarif_v_2_1_0_j.string_of_reporting_descriptor @@ List.hd @@ Option.get parsed_driver.rules in
  print_endline rules;
  [%expect {| {"defaultConfiguration":{"level":"error"},"id":"TUT0001"} |}]

let%expect_test "embedded_binary_content" =
  let json = read_all "data/embedded_binary_content.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result = Sarif_v_2_1_0_j.string_of_result @@ List.hd @@ Option.get parsed_run.results in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let location = Sarif_v_2_1_0_j.string_of_location @@ List.hd @@ Option.get parsed_result.locations in
  print_endline location;
  [%expect {| {"physicalLocation":{"artifactLocation":{"index":0,"uri":"data.bin"},"region":{"byteLength":2,"byteOffset":2}}} |}]

let%expect_test "embedded_text_content" =
  let json = read_all "data/embedded_text_content.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let artifacts = Sarif_v_2_1_0_j.string_of_artifact @@ List.hd @@ Option.get parsed_run.artifacts in
  print_endline artifacts;
  [%expect {| {"contents":{"text":"Hello,\r\nworld"},"encoding":"UTF-8","location":{"uri":"explicit.txt"}} |}]

let%expect_test "notifications" =
  let json = read_all "data/notifications.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let tool = Sarif_v_2_1_0_j.string_of_tool parsed_run.tool in
  let parsed_tool = Sarif_v_2_1_0_j.tool_of_string tool in
  let driver = Sarif_v_2_1_0_j.string_of_tool_component parsed_tool.driver in
  let parsed_driver = Sarif_v_2_1_0_j.tool_component_of_string driver in
  let notifications = Sarif_v_2_1_0_j.string_of_reporting_descriptor @@ List.hd @@ Option.get parsed_driver.notifications in
  print_endline notifications;
  [%expect {| {"defaultConfiguration":{"level":"warning"},"id":"TUTN9001","messageStrings":{"disabled":{"text":"'{0}' cannot be disabled because this rule does not exist."},"enabled":{"text":"'{0}' cannot be enabled because this rule does not exist."}},"name":"unknown-rule","shortDescription":{"text":"This notification is triggered when the user supplies a command line argument to enable or disable a rule that does not exist."}} |}]

let%expect_test "original_uri_base_ids" =
  let json = read_all "data/original_uri_base_ids.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let original_uri_base_ids = Sarif_v_2_1_0_j.string_of_hm_str_al @@ Option.get parsed_run.original_uri_base_ids in
  print_endline original_uri_base_ids;
  [%expect {| {"REPOROOT":{"description":{"text":"The directory into which the repo was cloned."},"properties":{"comment":"The SARIF producer has chosen not to specify a URI for REPOROOT. See §3.14.14, NOTE 1, for an explanation."}},"SRCROOT":{"description":{"text":"The r."},"properties":{"comment":"SRCROOT is expressed relative to REPOROOT."},"uri":"src/","uriBaseId":"REPOROOT"},"LOGSROOT":{"description":{"text":"Destination for tool logs."},"properties":{"comment":"An originalUriBaseId that resolves directly to an absolute URI."},"uri":"file:///C:/logs/"}} |}]

let%expect_test "regional_variants" =
  let json = read_all "data/regional_variants.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result = Sarif_v_2_1_0_j.string_of_result @@ List.hd @@ Option.get parsed_run.results in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let location = Sarif_v_2_1_0_j.string_of_location @@ List.hd @@ Option.get parsed_result.locations in
  print_endline location;
  [%expect {| {"physicalLocation":{"artifactLocation":{"index":0,"uri":"TextFile.txt"},"region":{"endColumn":4,"endLine":1,"startColumn":2,"startLine":1}}} |}]

let%expect_test "result_stacks" =
  let json = read_all "data/result_stacks.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result = Sarif_v_2_1_0_j.string_of_result @@ List.hd @@ Option.get parsed_run.results in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let stacks = Sarif_v_2_1_0_j.string_of_stack @@ List.hd @@ Option.get parsed_result.stacks in
  print_endline stacks;
  [%expect {| {"frames":[{"location":{"logicalLocations":[{"fullyQualifiedName":"collections::list::add_core"}],"message":{"text":"Exception thrown."},"physicalLocation":{"artifactLocation":{"uri":"collections/list.h","uriBaseId":"SRCROOT"},"region":{"startColumn":15,"startLine":110}}},"module":"platform","parameters":["null","0","14"],"threadId":52},{"location":{"logicalLocations":[{"fullyQualifiedName":"collections::list::add"}],"physicalLocation":{"artifactLocation":{"uri":"collections/list.h","uriBaseId":"SRCROOT"},"region":{"startColumn":15,"startLine":43}}},"module":"platform","parameters":["14"],"threadId":52},{"location":{"logicalLocations":[{"fullyQualifiedName":"main"}],"physicalLocation":{"artifactLocation":{"uri":"application/main.cpp","uriBaseId":"SRCROOT"},"region":{"startColumn":9,"startLine":28}}},"module":"application","threadId":52}],"message":{"text":"Call stack resulting from usage of uninitialized variable."}} |}]

let%expect_test "rule_metadata" =
  let json = read_all "data/rule_metadata.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let tool = Sarif_v_2_1_0_j.string_of_tool parsed_run.tool in
  let parsed_tool = Sarif_v_2_1_0_j.tool_of_string tool in
  let driver = Sarif_v_2_1_0_j.string_of_tool_component parsed_tool.driver in
  let parsed_driver = Sarif_v_2_1_0_j.tool_component_of_string driver in
  let rules = Sarif_v_2_1_0_j.string_of_reporting_descriptor @@ List.hd @@ Option.get parsed_driver.rules in
  print_endline rules;
  [%expect {| {"defaultConfiguration":{"level":"error"},"fullDescription":{"markdown":"Every JSON property whose value is defined by the schema to be a URI (with `\"format\": \"uri\"` or `\"format\": \"uri-reference\"`) must contain a valid URI.","text":"Every JSON property whose value is defined by the schema to be a URI (with \"format\": \"uri\" or \"format\": \"uri-reference\") must contain a valid URI."},"id":"TUT1001","messageStrings":{"default":{"markdown":"The URI `{0}` is invalid.","text":"The URI '{0}' is invalid."}},"name":"InvalidUri","shortDescription":{"markdown":"Properties defined with the `uri` or `uri-reference` format must contain valid URIs.","text":"Properties defined with the 'uri' or 'uri-reference' format must contain valid URIs."}} |}]

let%expect_test "suppresions" =
  let json = read_all "data/suppresions.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result = Sarif_v_2_1_0_j.string_of_result @@ List.nth (Option.get parsed_run.results) 1 in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let suppressions = Sarif_v_2_1_0_j.string_of_suppression @@ List.hd @@ Option.get parsed_result.suppressions in
  print_endline suppressions;
  [%expect {| {"kind":"inSource"} |}]

let%expect_test "taxonomies" =
  let json = read_all "data/taxonomies.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let taxonomies = Sarif_v_2_1_0_j.string_of_tool_component @@ List.hd @@ Option.get parsed_run.taxonomies in
  print_endline taxonomies;
  [%expect {| {"guid":"1A567403-868F-405E-92CF-771A9ECB03A1","name":"Requirement levels","shortDescription":{"text":"This taxonomy classifies rules according to whether their use is required or recommended by company policy."},"taxa":[{"id":"RQL1001","name":"Required","shortDescription":{"text":"Rules in this category are required by company policy. All violations must be fixed unless an exemption is granted."}},{"id":"RQL1002","name":"Recommended","shortDescription":{"text":"Rules in this category are recommended but not required by company policy. Violations should be fixed but an exemption is not required to suppress a result."}}]} |}]

let%expect_test "sarif_json_schema.version" =
  let sarif_json_schema =
    Sarif_v_2_1_0_v.create_sarif_json_schema
      ~version:`TwoDotOneDotZero
      ~runs:[]
      ()
  in
  let s = Sarif_v_2_1_0_j.string_of_sarif_json_schema sarif_json_schema in
  print_endline s;
  [%expect {| {"version":"2.1.0","runs":[]} |}]


let%expect_test "data/semgrep/test_sarif_output_rule_board/" =
  let json = read_all "data/semgrep/test_sarif_output_rule_board/results.sarif" in
  let parsed = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let s = Sarif_v_2_1_0_j.string_of_sarif_json_schema parsed in
  print_endline s;
  [%expect {|
{"version":"2.1.0","runs":[{"invocations":[{"executionSuccessful":true,"toolExecutionNotifications":[]}],"results":[{"fingerprints":{"matchBasedId/v1":"1fa894f43c4fd60b1b0c5e2e9a50311b67b77a7b09f7c45001277b41e41accd87cd8e2931d57e0bf41a0e5086501be1fea611473dd02e1625c49204145464dba_0"},"locations":[{"physicalLocation":{"artifactLocation":{"uri":"targets/basic/stupid.py","uriBaseId":"%SRCROOT%"},"region":{"endColumn":26,"endLine":3,"snippet":{"text":"    return a + b == a + b"},"startColumn":12,"startLine":3}}}],"message":{"text":"this rule comes from the rule board!"},"properties":{},"ruleId":"rules.rule-board-eqeq-five"},{"fingerprints":{"matchBasedId/v1":"79990521677dc96cec634491f9134e8528b49257440a27b8df47582e37668aaf5cb3343fe53b19476b12071b84f58db799c9f7f3d75b09dd3547f283b7036d38_0"},"locations":[{"physicalLocation":{"artifactLocation":{"uri":"targets/basic/stupid.py","uriBaseId":"%SRCROOT%"},"region":{"endColumn":11,"endLine":8,"snippet":{"text":"    x == x"},"startColumn":5,"startLine":8}}}],"message":{"text":"this rule comes from the rule board!"},"properties":{},"ruleId":"rules.rule-board-eqeq-five"},{"fingerprints":{"matchBasedId/v1":"79990521677dc96cec634491f9134e8528b49257440a27b8df47582e37668aaf5cb3343fe53b19476b12071b84f58db799c9f7f3d75b09dd3547f283b7036d38_1"},"locations":[{"physicalLocation":{"artifactLocation":{"uri":"targets/basic/stupid.py","uriBaseId":"%SRCROOT%"},"region":{"endColumn":18,"endLine":12,"snippet":{"text":"assertTrue(x == x)"},"startColumn":12,"startLine":12}}}],"message":{"text":"this rule comes from the rule board!"},"properties":{},"ruleId":"rules.rule-board-eqeq-five"}],"tool":{"driver":{"name":"Semgrep OSS","rules":[{"defaultConfiguration":{"level":"error"},"fullDescription":{"text":"this rule comes from the rule board!"},"help":{"markdown":"this rule comes from the rule board!","text":"this rule comes from the rule board!"},"id":"rules.rule-board-eqeq-five","name":"rules.rule-board-eqeq-five","properties":{"precision":"very-high","tags":["rule-board-block"]},"shortDescription":{"text":"Semgrep Finding: rules.rule-board-eqeq-five"}}],"semanticVersion":"placeholder"}}}],"$schema":"https://docs.oasis-open.org/sarif/sarif/v2.1.0/os/schemas/sarif-schema-2.1.0.json"}
|}]
