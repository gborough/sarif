open Sarif

let read_all file =
  let ic = open_in_bin file in
  let s = really_input_string ic (in_channel_length ic) in
  close_in ic;
  s
;;

let%expect_test "code_flows" =
  let json = read_all "data/code_flows.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result =
    Sarif_v_2_1_0_j.string_of_result @@ List.hd @@ Option.get parsed_run.results
  in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let code_flows =
    Sarif_v_2_1_0_j.string_of_code_flow @@ List.hd @@ Option.get parsed_result.code_flows
  in
  print_endline code_flows;
  [%expect
    {| {"message":{"text":"Path from declaration to usage."},"threadFlows":[{"locations":[{"importance":"essential","location":{"logicalLocations":[{"fullyQualifiedName":"collections::list::add"}],"message":{"text":"Variable 'ptr' declared."},"physicalLocation":{"artifactLocation":{"uri":"collections/list.h"},"region":{"snippet":{"text":"int* ptr;"},"startColumn":8,"startLine":15}}}},{"importance":"unimportant","location":{"logicalLocations":[{"fullyQualifiedName":"collections::list::add"}],"physicalLocation":{"artifactLocation":{"uri":"collections/list.h"},"region":{"snippet":{"text":"offset = 0;"},"startColumn":8,"startLine":18}}}},{"importance":"essential","location":{"logicalLocations":[{"fullyQualifiedName":"collections::list::add"}],"message":{"text":"Uninitialized variable 'ptr' passed to method 'add_core'."},"physicalLocation":{"artifactLocation":{"uri":"collections/list.h"},"region":{"snippet":{"text":"add_core(ptr, offset, val)"},"startColumn":8,"startLine":25}}}}]}]} |}]
;;

let%expect_test "context_region" =
  let json = read_all "data/context_region.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result =
    Sarif_v_2_1_0_j.string_of_result @@ List.hd @@ Option.get parsed_run.results
  in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let location =
    Sarif_v_2_1_0_j.string_of_location @@ List.hd @@ Option.get parsed_result.locations
  in
  let parsed_location = Sarif_v_2_1_0_j.location_of_string location in
  let physical_location =
    Sarif_v_2_1_0_j.string_of_physical_location
    @@ Option.get parsed_location.physical_location
  in
  let parsed_physical_location =
    Sarif_v_2_1_0_j.physical_location_of_string physical_location
  in
  let context_region =
    Sarif_v_2_1_0_j.string_of_region @@ Option.get parsed_physical_location.context_region
  in
  print_endline context_region;
  [%expect
    {| {"endColumn":28,"snippet":{"text":"/// This is a BAD word."},"startColumn":5,"startLine":4} |}]
;;

let%expect_test "default_rule_configuration" =
  let json = read_all "data/default_rule_configuration.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let tool = Sarif_v_2_1_0_j.string_of_tool parsed_run.tool in
  let parsed_tool = Sarif_v_2_1_0_j.tool_of_string tool in
  let driver = Sarif_v_2_1_0_j.string_of_tool_component parsed_tool.driver in
  let parsed_driver = Sarif_v_2_1_0_j.tool_component_of_string driver in
  let rules =
    Sarif_v_2_1_0_j.string_of_reporting_descriptor
    @@ List.hd
    @@ Option.get parsed_driver.rules
  in
  print_endline rules;
  [%expect {| {"defaultConfiguration":{"level":"error"},"id":"TUT0001"} |}]
;;

let%expect_test "embedded_binary_content" =
  let json = read_all "data/embedded_binary_content.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result =
    Sarif_v_2_1_0_j.string_of_result @@ List.hd @@ Option.get parsed_run.results
  in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let location =
    Sarif_v_2_1_0_j.string_of_location @@ List.hd @@ Option.get parsed_result.locations
  in
  print_endline location;
  [%expect
    {| {"physicalLocation":{"artifactLocation":{"index":0,"uri":"data.bin"},"region":{"byteLength":2,"byteOffset":2}}} |}]
;;

let%expect_test "embedded_text_content" =
  let json = read_all "data/embedded_text_content.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let artifacts =
    Sarif_v_2_1_0_j.string_of_artifact @@ List.hd @@ Option.get parsed_run.artifacts
  in
  print_endline artifacts;
  [%expect
    {| {"contents":{"text":"Hello,\r\nworld"},"encoding":"UTF-8","location":{"uri":"explicit.txt"}} |}]
;;

let%expect_test "notifications" =
  let json = read_all "data/notifications.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let tool = Sarif_v_2_1_0_j.string_of_tool parsed_run.tool in
  let parsed_tool = Sarif_v_2_1_0_j.tool_of_string tool in
  let driver = Sarif_v_2_1_0_j.string_of_tool_component parsed_tool.driver in
  let parsed_driver = Sarif_v_2_1_0_j.tool_component_of_string driver in
  let notifications =
    Sarif_v_2_1_0_j.string_of_reporting_descriptor
    @@ List.hd
    @@ Option.get parsed_driver.notifications
  in
  print_endline notifications;
  [%expect
    {| {"defaultConfiguration":{"level":"warning"},"id":"TUTN9001","messageStrings":{"disabled":{"text":"'{0}' cannot be disabled because this rule does not exist."},"enabled":{"text":"'{0}' cannot be enabled because this rule does not exist."}},"name":"unknown-rule","shortDescription":{"text":"This notification is triggered when the user supplies a command line argument to enable or disable a rule that does not exist."}} |}]
;;

let%expect_test "original_uri_base_ids" =
  let json = read_all "data/original_uri_base_ids.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let original_uri_base_ids =
    Sarif_v_2_1_0_j.string_of_hm_str_al @@ Option.get parsed_run.original_uri_base_ids
  in
  print_endline original_uri_base_ids;
  [%expect
    {| {"REPOROOT":{"description":{"text":"The directory into which the repo was cloned."},"properties":{"comment":"The SARIF producer has chosen not to specify a URI for REPOROOT. See §3.14.14, NOTE 1, for an explanation."}},"SRCROOT":{"description":{"text":"The r."},"properties":{"comment":"SRCROOT is expressed relative to REPOROOT."},"uri":"src/","uriBaseId":"REPOROOT"},"LOGSROOT":{"description":{"text":"Destination for tool logs."},"properties":{"comment":"An originalUriBaseId that resolves directly to an absolute URI."},"uri":"file:///C:/logs/"}} |}]
;;

let%expect_test "regional_variants" =
  let json = read_all "data/regional_variants.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result =
    Sarif_v_2_1_0_j.string_of_result @@ List.hd @@ Option.get parsed_run.results
  in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let location =
    Sarif_v_2_1_0_j.string_of_location @@ List.hd @@ Option.get parsed_result.locations
  in
  print_endline location;
  [%expect
    {| {"physicalLocation":{"artifactLocation":{"index":0,"uri":"TextFile.txt"},"region":{"endColumn":4,"endLine":1,"startColumn":2,"startLine":1}}} |}]
;;

let%expect_test "result_stacks" =
  let json = read_all "data/result_stacks.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result =
    Sarif_v_2_1_0_j.string_of_result @@ List.hd @@ Option.get parsed_run.results
  in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let stacks =
    Sarif_v_2_1_0_j.string_of_stack @@ List.hd @@ Option.get parsed_result.stacks
  in
  print_endline stacks;
  [%expect
    {| {"frames":[{"location":{"logicalLocations":[{"fullyQualifiedName":"collections::list::add_core"}],"message":{"text":"Exception thrown."},"physicalLocation":{"artifactLocation":{"uri":"collections/list.h","uriBaseId":"SRCROOT"},"region":{"startColumn":15,"startLine":110}}},"module":"platform","parameters":["null","0","14"],"threadId":52},{"location":{"logicalLocations":[{"fullyQualifiedName":"collections::list::add"}],"physicalLocation":{"artifactLocation":{"uri":"collections/list.h","uriBaseId":"SRCROOT"},"region":{"startColumn":15,"startLine":43}}},"module":"platform","parameters":["14"],"threadId":52},{"location":{"logicalLocations":[{"fullyQualifiedName":"main"}],"physicalLocation":{"artifactLocation":{"uri":"application/main.cpp","uriBaseId":"SRCROOT"},"region":{"startColumn":9,"startLine":28}}},"module":"application","threadId":52}],"message":{"text":"Call stack resulting from usage of uninitialized variable."}} |}]
;;

let%expect_test "rule_metadata" =
  let json = read_all "data/rule_metadata.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let tool = Sarif_v_2_1_0_j.string_of_tool parsed_run.tool in
  let parsed_tool = Sarif_v_2_1_0_j.tool_of_string tool in
  let driver = Sarif_v_2_1_0_j.string_of_tool_component parsed_tool.driver in
  let parsed_driver = Sarif_v_2_1_0_j.tool_component_of_string driver in
  let rules =
    Sarif_v_2_1_0_j.string_of_reporting_descriptor
    @@ List.hd
    @@ Option.get parsed_driver.rules
  in
  print_endline rules;
  [%expect
    {| {"defaultConfiguration":{"level":"error"},"fullDescription":{"markdown":"Every JSON property whose value is defined by the schema to be a URI (with `\"format\": \"uri\"` or `\"format\": \"uri-reference\"`) must contain a valid URI.","text":"Every JSON property whose value is defined by the schema to be a URI (with \"format\": \"uri\" or \"format\": \"uri-reference\") must contain a valid URI."},"id":"TUT1001","messageStrings":{"default":{"markdown":"The URI `{0}` is invalid.","text":"The URI '{0}' is invalid."}},"name":"InvalidUri","shortDescription":{"markdown":"Properties defined with the `uri` or `uri-reference` format must contain valid URIs.","text":"Properties defined with the 'uri' or 'uri-reference' format must contain valid URIs."}} |}]
;;

let%expect_test "suppresions" =
  let json = read_all "data/suppresions.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let result =
    Sarif_v_2_1_0_j.string_of_result @@ List.nth (Option.get parsed_run.results) 1
  in
  let parsed_result = Sarif_v_2_1_0_j.result_of_string result in
  let suppressions =
    Sarif_v_2_1_0_j.string_of_suppression
    @@ List.hd
    @@ Option.get parsed_result.suppressions
  in
  print_endline suppressions;
  [%expect {| {"kind":"inSource"} |}]
;;

let%expect_test "taxonomies" =
  let json = read_all "data/taxonomies.json" in
  let parsed_all = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let run = Sarif_v_2_1_0_j.string_of_run @@ List.hd @@ parsed_all.runs in
  let parsed_run = Sarif_v_2_1_0_j.run_of_string run in
  let taxonomies =
    Sarif_v_2_1_0_j.string_of_tool_component
    @@ List.hd
    @@ Option.get parsed_run.taxonomies
  in
  print_endline taxonomies;
  [%expect
    {| {"guid":"1A567403-868F-405E-92CF-771A9ECB03A1","name":"Requirement levels","shortDescription":{"text":"This taxonomy classifies rules according to whether their use is required or recommended by company policy."},"taxa":[{"id":"RQL1001","name":"Required","shortDescription":{"text":"Rules in this category are required by company policy. All violations must be fixed unless an exemption is granted."}},{"id":"RQL1002","name":"Recommended","shortDescription":{"text":"Rules in this category are recommended but not required by company policy. Violations should be fixed but an exemption is not required to suppress a result."}}]} |}]
;;

let%expect_test "sarif_json_schema.version" =
  let sarif_json_schema =
    Sarif_v_2_1_0_v.create_sarif_json_schema ~version:`TwoDotOneDotZero ~runs:[] ()
  in
  let s = Sarif_v_2_1_0_j.string_of_sarif_json_schema sarif_json_schema in
  print_endline s;
  [%expect {| {"version":"2.1.0","runs":[]} |}]
;;

let parse_print_roundtrip file =
  let json = read_all file in
  let parsed = Sarif_v_2_1_0_j.sarif_json_schema_of_string json in
  let s = Sarif_v_2_1_0_j.string_of_sarif_json_schema parsed in
  print_endline s
;;

let%expect_test "data/semgrep/test_sarif_output_rule_board/" =
  parse_print_roundtrip "data/semgrep/test_sarif_output_rule_board/results.sarif";
  [%expect
    {|
{"version":"2.1.0","runs":[{"invocations":[{"executionSuccessful":true,"toolExecutionNotifications":[]}],"results":[{"fingerprints":{"matchBasedId/v1":"1fa894f43c4fd60b1b0c5e2e9a50311b67b77a7b09f7c45001277b41e41accd87cd8e2931d57e0bf41a0e5086501be1fea611473dd02e1625c49204145464dba_0"},"locations":[{"physicalLocation":{"artifactLocation":{"uri":"targets/basic/stupid.py","uriBaseId":"%SRCROOT%"},"region":{"endColumn":26,"endLine":3,"snippet":{"text":"    return a + b == a + b"},"startColumn":12,"startLine":3}}}],"message":{"text":"this rule comes from the rule board!"},"properties":{},"ruleId":"rules.rule-board-eqeq-five"},{"fingerprints":{"matchBasedId/v1":"79990521677dc96cec634491f9134e8528b49257440a27b8df47582e37668aaf5cb3343fe53b19476b12071b84f58db799c9f7f3d75b09dd3547f283b7036d38_0"},"locations":[{"physicalLocation":{"artifactLocation":{"uri":"targets/basic/stupid.py","uriBaseId":"%SRCROOT%"},"region":{"endColumn":11,"endLine":8,"snippet":{"text":"    x == x"},"startColumn":5,"startLine":8}}}],"message":{"text":"this rule comes from the rule board!"},"properties":{},"ruleId":"rules.rule-board-eqeq-five"},{"fingerprints":{"matchBasedId/v1":"79990521677dc96cec634491f9134e8528b49257440a27b8df47582e37668aaf5cb3343fe53b19476b12071b84f58db799c9f7f3d75b09dd3547f283b7036d38_1"},"locations":[{"physicalLocation":{"artifactLocation":{"uri":"targets/basic/stupid.py","uriBaseId":"%SRCROOT%"},"region":{"endColumn":18,"endLine":12,"snippet":{"text":"assertTrue(x == x)"},"startColumn":12,"startLine":12}}}],"message":{"text":"this rule comes from the rule board!"},"properties":{},"ruleId":"rules.rule-board-eqeq-five"}],"tool":{"driver":{"name":"Semgrep OSS","rules":[{"defaultConfiguration":{"level":"error"},"fullDescription":{"text":"this rule comes from the rule board!"},"help":{"markdown":"this rule comes from the rule board!","text":"this rule comes from the rule board!"},"id":"rules.rule-board-eqeq-five","name":"rules.rule-board-eqeq-five","properties":{"precision":"very-high","tags":["rule-board-block"]},"shortDescription":{"text":"Semgrep Finding: rules.rule-board-eqeq-five"}}],"semanticVersion":"placeholder"}}}],"$schema":"https://docs.oasis-open.org/sarif/sarif/v2.1.0/os/schemas/sarif-schema-2.1.0.json"}
|}]
;;

let%expect_test "data/semgrep/test_sarif_output_include_nosemgrep/results.sarif" =
  parse_print_roundtrip "data/semgrep/test_sarif_output_include_nosemgrep/results.sarif";
  [%expect
    {|
{"version":"2.1.0","runs":[{"invocations":[{"executionSuccessful":true,"toolExecutionNotifications":[]}],"results":[{"fingerprints":{"matchBasedId/v1":"1ccfdeae9247f2f32c35443f3bf87d4fd67e4d58b25adfcdb7dd5fc74079c09713a2e45e39f1f46e12361f98aa492bfba2a4983d4e9f409c02dfcff1ba254f20_0"},"locations":[{"physicalLocation":{"artifactLocation":{"uri":"targets/basic/regex-nosemgrep.txt","uriBaseId":"%SRCROOT%"},"region":{"endColumn":30,"endLine":1,"snippet":{"text":"aws_account_id = 123456789012  # nosemgrep"},"startColumn":1,"startLine":1}}}],"message":{"text":"AWS Account ID detected"},"properties":{},"ruleId":"rules.detected-aws-account-id","suppressions":[{"kind":"inSource"}]},{"fingerprints":{"matchBasedId/v1":"1ccfdeae9247f2f32c35443f3bf87d4fd67e4d58b25adfcdb7dd5fc74079c09713a2e45e39f1f46e12361f98aa492bfba2a4983d4e9f409c02dfcff1ba254f20_1"},"locations":[{"physicalLocation":{"artifactLocation":{"uri":"targets/basic/regex-nosemgrep.txt","uriBaseId":"%SRCROOT%"},"region":{"endColumn":28,"endLine":3,"snippet":{"text":"aws_account_id:123456789012"},"startColumn":1,"startLine":3}}}],"message":{"text":"AWS Account ID detected"},"properties":{},"ruleId":"rules.detected-aws-account-id"}],"tool":{"driver":{"name":"Semgrep OSS","rules":[{"defaultConfiguration":{"level":"error"},"fullDescription":{"text":"AWS Account ID detected"},"help":{"markdown":"AWS Account ID detected","text":"AWS Account ID detected"},"id":"rules.detected-aws-account-id","name":"rules.detected-aws-account-id","properties":{"precision":"very-high","tags":[]},"shortDescription":{"text":"Semgrep Finding: rules.detected-aws-account-id"}}],"semanticVersion":"placeholder"}}}],"$schema":"https://docs.oasis-open.org/sarif/sarif/v2.1.0/os/schemas/sarif-schema-2.1.0.json"}
|}]
;;

let%expect_test "data/semgrep/test_sarif_output_when_errors/results.sarif" =
  parse_print_roundtrip "data/semgrep/test_sarif_output_when_errors/results.sarif";
  [%expect
    {|
{"version":"2.1.0","runs":[{"invocations":[{"executionSuccessful":true,"toolExecutionNotifications":[{"descriptor":{"id":"SemgrepError"},"level":"error","message":{"text":"File not found: targets/basic/inexistent.py"}}]}],"results":[],"tool":{"driver":{"name":"Semgrep OSS","rules":[],"semanticVersion":"placeholder"}}}],"$schema":"https://docs.oasis-open.org/sarif/sarif/v2.1.0/os/schemas/sarif-schema-2.1.0.json"}
|}]
;;

let%expect_test "data/semgrep/test_sarif_output_with_autofix/results.sarif" =
  parse_print_roundtrip "data/semgrep/test_sarif_output_with_autofix/results.sarif";
  [%expect
    {|
{"version":"2.1.0","runs":[{"invocations":[{"executionSuccessful":true,"toolExecutionNotifications":[]}],"results":[{"fingerprints":{"matchBasedId/v1":"4a33397409b7b2d0e677e2e515c526be5568d00a2bf740196e13536ad2b2dfa554167db90394ec8e9779a89eb3ca6e98d86d690f9cc9625fca1fc18be633b1ac_0"},"fixes":[{"artifactChanges":[{"artifactLocation":{"uri":"targets/autofix/autofix.py"},"replacements":[{"deletedRegion":{"endColumn":12,"endLine":5,"startColumn":3,"startLine":5},"insertedContent":{"text":"  inputs.get(x) = 1"}}]}],"description":{"text":"Use `.get()` method to avoid a KeyNotFound error\n Autofix: Semgrep rule suggested fix"}}],"locations":[{"physicalLocation":{"artifactLocation":{"uri":"targets/autofix/autofix.py","uriBaseId":"%SRCROOT%"},"region":{"endColumn":12,"endLine":5,"snippet":{"text":"  inputs[x] = 1"},"startColumn":3,"startLine":5}}}],"message":{"text":"Use `.get()` method to avoid a KeyNotFound error"},"properties":{},"ruleId":"rules.autofix.use-dict-get"},{"fingerprints":{"matchBasedId/v1":"592b33f0145ca2899616e587fca10aed02dc2cb1261f5e39597f7b66464e2c89cacb4a318c010006c6126e6a0de0a764a2b281dbad87315460dbbbd9a44cd412_0"},"fixes":[{"artifactChanges":[{"artifactLocation":{"uri":"targets/autofix/autofix.py"},"replacements":[{"deletedRegion":{"endColumn":19,"endLine":6,"startColumn":6,"startLine":6},"insertedContent":{"text":"  if inputs.get((x + 1)) == True:"}}]}],"description":{"text":"Use `.get()` method to avoid a KeyNotFound error\n Autofix: Semgrep rule suggested fix"}}],"locations":[{"physicalLocation":{"artifactLocation":{"uri":"targets/autofix/autofix.py","uriBaseId":"%SRCROOT%"},"region":{"endColumn":19,"endLine":6,"snippet":{"text":"  if inputs[x + 1] == True:"},"startColumn":6,"startLine":6}}}],"message":{"text":"Use `.get()` method to avoid a KeyNotFound error"},"properties":{},"ruleId":"rules.autofix.use-dict-get"}],"tool":{"driver":{"name":"Semgrep OSS","rules":[{"defaultConfiguration":{"level":"error"},"fullDescription":{"text":"Use `.get()` method to avoid a KeyNotFound error"},"help":{"markdown":"Use `.get()` method to avoid a KeyNotFound error","text":"Use `.get()` method to avoid a KeyNotFound error"},"id":"rules.autofix.use-dict-get","name":"rules.autofix.use-dict-get","properties":{"precision":"very-high","tags":[]},"shortDescription":{"text":"Semgrep Finding: rules.autofix.use-dict-get"}}],"semanticVersion":"placeholder"}}}],"$schema":"https://docs.oasis-open.org/sarif/sarif/v2.1.0/os/schemas/sarif-schema-2.1.0.json"}
|}]
;;

let%expect_test "data/semgrep/test_sarif_output_with_dataflow_traces/results.sarif" =
  parse_print_roundtrip
    "data/semgrep/test_sarif_output_with_dataflow_traces/results.sarif";
  [%expect
    {|
{"version":"2.1.0","runs":[{"invocations":[{"executionSuccessful":true,"toolExecutionNotifications":[]}],"results":[{"codeFlows":[{"message":{"text":"Untrusted dataflow from targets/taint/taint.py:3 to targets/taint/taint.py:9"},"threadFlows":[{"locations":[{"location":{"message":{"text":"Source: 'source1()' @ 'targets/taint/taint.py:3'"},"physicalLocation":{"artifactLocation":{"uri":"targets/taint/taint.py"},"region":{"endColumn":18,"endLine":3,"message":{"text":"Source: 'source1()' @ 'targets/taint/taint.py:3'"},"snippet":{"text":"source1()"},"startColumn":9,"startLine":3}}},"nestingLevel":0},{"location":{"message":{"text":"Propagator : 'a' @ 'targets/taint/taint.py:3'"},"physicalLocation":{"artifactLocation":{"uri":"targets/taint/taint.py"},"region":{"endColumn":6,"endLine":3,"message":{"text":"Propagator : 'a' @ 'targets/taint/taint.py:3'"},"snippet":{"text":"a"},"startColumn":5,"startLine":3}}},"nestingLevel":0},{"location":{"message":{"text":"Propagator : 'b' @ 'targets/taint/taint.py:8'"},"physicalLocation":{"artifactLocation":{"uri":"targets/taint/taint.py"},"region":{"endColumn":10,"endLine":8,"message":{"text":"Propagator : 'b' @ 'targets/taint/taint.py:8'"},"snippet":{"text":"b"},"startColumn":9,"startLine":8}}},"nestingLevel":0},{"location":{"message":{"text":"Sink: 'sink1(b)' @ 'targets/taint/taint.py:9'"},"physicalLocation":{"artifactLocation":{"uri":"targets/taint/taint.py"},"region":{"endColumn":13,"endLine":9,"message":{"text":"Sink: 'sink1(b)' @ 'targets/taint/taint.py:9'"},"snippet":{"text":"    sink1(b)"},"startColumn":5,"startLine":9}}},"nestingLevel":1}]}]}],"fingerprints":{"matchBasedId/v1":"b7d9e6f63610bc461ccd05b612b609b516a1ba6c6fb63268160f62de8bb894cd8c2ef9e389681db5d538050af75010b0219f21d41f67488da439ca426798dbde_0"},"locations":[{"physicalLocation":{"artifactLocation":{"uri":"targets/taint/taint.py","uriBaseId":"%SRCROOT%"},"region":{"endColumn":13,"endLine":9,"snippet":{"text":"    sink1(b)"},"startColumn":5,"startLine":9}}}],"message":{"text":"A user input source() went into a dangerous sink()"},"properties":{},"ruleId":"rules.classic"}],"tool":{"driver":{"name":"Semgrep OSS","rules":[{"defaultConfiguration":{"level":"warning"},"fullDescription":{"text":"A user input source() went into a dangerous sink()"},"help":{"markdown":"A user input source() went into a dangerous sink()","text":"A user input source() went into a dangerous sink()"},"id":"rules.classic","name":"rules.classic","properties":{"precision":"very-high","tags":[]},"shortDescription":{"text":"Semgrep Finding: rules.classic"}}],"semanticVersion":"placeholder"}}}],"$schema":"https://docs.oasis-open.org/sarif/sarif/v2.1.0/os/schemas/sarif-schema-2.1.0.json"}
|}]
;;

let%expect_test "data/semgrep/test_sarif_output_with_nosemgrep_and_error/results.sarif" =
  parse_print_roundtrip
    "data/semgrep/test_sarif_output_with_nosemgrep_and_error/results.sarif";
  [%expect
    {|
{"version":"2.1.0","runs":[{"invocations":[{"executionSuccessful":true,"toolExecutionNotifications":[]}],"results":[{"fingerprints":{"matchBasedId/v1":"4a1a7f92c1f9d4d48ea96c4353e75c3b1e0bcb51e3c5a84d9edbaa810f7a1814f5fbf4a4cd1f88de224f007c4c3fb666a9fa61d669d739c2d78215ec73d02e7c_0"},"locations":[{"physicalLocation":{"artifactLocation":{"uri":"targets/nosemgrep/eqeq-nosemgrep.py","uriBaseId":"%SRCROOT%"},"region":{"endColumn":26,"endLine":2,"snippet":{"text":"    return a + b == a + b  # nosemgrep: rules.eqeq-is-bad"},"startColumn":12,"startLine":2}}}],"message":{"text":"useless comparison operation `a + b == a + b` or `a + b != a + b`"},"properties":{},"ruleId":"rules.eqeq-is-bad","suppressions":[{"kind":"inSource"}]}],"tool":{"driver":{"name":"Semgrep OSS","rules":[{"defaultConfiguration":{"level":"error"},"fullDescription":{"text":"possibly useless comparison but in eq function"},"help":{"markdown":"possibly useless comparison but in eq function","text":"possibly useless comparison but in eq function"},"id":"rules.assert-eqeq-is-ok","name":"rules.assert-eqeq-is-ok","properties":{"precision":"very-high","tags":[]},"shortDescription":{"text":"Semgrep Finding: rules.assert-eqeq-is-ok"}},{"defaultConfiguration":{"level":"error"},"fullDescription":{"text":"useless comparison operation `$X == $X` or `$X != $X`"},"help":{"markdown":"useless comparison operation `$X == $X` or `$X != $X`\n\n<b>References:</b>\n - [Semgrep Rule](https://semgrep.dev/r/eqeq-bad)\n","text":"useless comparison operation `$X == $X` or `$X != $X`"},"helpUri":"https://semgrep.dev/r/eqeq-bad","id":"rules.eqeq-is-bad","name":"rules.eqeq-is-bad","properties":{"precision":"very-high","tags":[]},"shortDescription":{"text":"Semgrep Finding: rules.eqeq-is-bad"}},{"defaultConfiguration":{"level":"error"},"fullDescription":{"text":"useless comparison"},"help":{"markdown":"useless comparison","text":"useless comparison"},"id":"rules.javascript-basic-eqeq-bad","name":"rules.javascript-basic-eqeq-bad","properties":{"precision":"very-high","tags":[]},"shortDescription":{"text":"Semgrep Finding: rules.javascript-basic-eqeq-bad"}},{"defaultConfiguration":{"level":"error"},"fullDescription":{"text":"this function is only available on Python 3.7+"},"help":{"markdown":"this function is only available on Python 3.7+","text":"this function is only available on Python 3.7+"},"id":"rules.python37-compatability-os-module","name":"rules.python37-compatability-os-module","properties":{"precision":"very-high","tags":[]},"shortDescription":{"text":"Semgrep Finding: rules.python37-compatability-os-module"}}],"semanticVersion":"placeholder"}}}],"$schema":"https://docs.oasis-open.org/sarif/sarif/v2.1.0/os/schemas/sarif-schema-2.1.0.json"}
|}]
;;

let%expect_test "data/semgrep/test_sarif_output_with_source/results.sarif" =
  parse_print_roundtrip "data/semgrep/test_sarif_output_with_source/results.sarif";
  [%expect
    {|
{"version":"2.1.0","runs":[{"invocations":[{"executionSuccessful":true,"toolExecutionNotifications":[]}],"results":[{"fingerprints":{"matchBasedId/v1":"62b4a09c4569768898c43c09fa0a5b95b7e93257ef3a0911a5c379b6265b4d49fa4aecd5782461632e9aef4779af02d7cad4405b9a5318a0e5ffe9a5bd8daeae_0"},"locations":[{"physicalLocation":{"artifactLocation":{"uri":"targets/basic/stupid.py","uriBaseId":"%SRCROOT%"},"region":{"endColumn":26,"endLine":3,"snippet":{"text":"    return a + b == a + b"},"startColumn":12,"startLine":3}}}],"message":{"text":"useless comparison operation `a + b == a + b` or `a + b != a + b`; possible bug?"},"properties":{},"ruleId":"rules.eqeq-is-bad"},{"fingerprints":{"matchBasedId/v1":"33c7ad418bcb7f83d9dcec68b2a8aa78ace93efbc20a12297ea7e15594ce23f5bca80b0958952b14dad3e874370c9ca7f991d2e1414adc33d243f133b1ff2811_0"},"locations":[{"physicalLocation":{"artifactLocation":{"uri":"targets/basic/stupid.js","uriBaseId":"%SRCROOT%"},"region":{"endColumn":19,"endLine":3,"snippet":{"text":"console.log(x == x)"},"startColumn":13,"startLine":3}}}],"message":{"text":"useless comparison"},"properties":{},"ruleId":"rules.javascript-basic-eqeq-bad"}],"tool":{"driver":{"name":"Semgrep OSS","rules":[{"defaultConfiguration":{"level":"error"},"fullDescription":{"text":"possibly useless comparison but in eq function"},"help":{"markdown":"possibly useless comparison but in eq function\n\n<b>References:</b>\n - [Semgrep Rule](https://semgrep.dev/foo/bar/assert)\n","text":"possibly useless comparison but in eq function"},"helpUri":"https://semgrep.dev/foo/bar/assert","id":"rules.assert-eqeq-is-ok","name":"rules.assert-eqeq-is-ok","properties":{"precision":"very-high","tags":[]},"shortDescription":{"text":"Semgrep Finding: rules.assert-eqeq-is-ok"}},{"defaultConfiguration":{"level":"error"},"fullDescription":{"text":"useless comparison operation `$X == $X` or `$X != $X`; possible bug?"},"help":{"markdown":"useless comparison operation `$X == $X` or `$X != $X`; possible bug?\n\n<b>References:</b>\n - [Semgrep Rule](https://semgrep.dev/foo/bar/bad)\n","text":"useless comparison operation `$X == $X` or `$X != $X`; possible bug?"},"helpUri":"https://semgrep.dev/foo/bar/bad","id":"rules.eqeq-is-bad","name":"rules.eqeq-is-bad","properties":{"precision":"very-high","tags":[]},"shortDescription":{"text":"Semgrep Finding: rules.eqeq-is-bad"}},{"defaultConfiguration":{"level":"error"},"fullDescription":{"text":"useless comparison"},"help":{"markdown":"useless comparison\n\n<b>References:</b>\n - [Semgrep Rule](https://semgrep.dev/foo/bar/js)\n - [https://google.com](https://google.com)\n","text":"useless comparison"},"helpUri":"https://semgrep.dev/foo/bar/js","id":"rules.javascript-basic-eqeq-bad","name":"rules.javascript-basic-eqeq-bad","properties":{"precision":"very-high","tags":[]},"shortDescription":{"text":"Semgrep Finding: rules.javascript-basic-eqeq-bad"}},{"defaultConfiguration":{"level":"error"},"fullDescription":{"text":"this function is only available on Python 3.7+"},"help":{"markdown":"this function is only available on Python 3.7+\n\n<b>References:</b>\n - [Semgrep Rule](https://semgrep.dev/foo/bar/compat)\n","text":"this function is only available on Python 3.7+"},"helpUri":"https://semgrep.dev/foo/bar/compat","id":"rules.python37-compatability-os-module","name":"rules.python37-compatability-os-module","properties":{"precision":"very-high","tags":[]},"shortDescription":{"text":"Semgrep Finding: rules.python37-compatability-os-module"}}],"semanticVersion":"placeholder"}}}],"$schema":"https://docs.oasis-open.org/sarif/sarif/v2.1.0/os/schemas/sarif-schema-2.1.0.json"}
|}]
;;

let%expect_test "data/semgrep/test_sarif_output_with_source_edit/results.sarif" =
  parse_print_roundtrip "data/semgrep/test_sarif_output_with_source_edit/results.sarif";
  [%expect
    {|
{"version":"2.1.0","runs":[{"invocations":[{"executionSuccessful":true,"toolExecutionNotifications":[]}],"results":[{"fingerprints":{"matchBasedId/v1":"62b4a09c4569768898c43c09fa0a5b95b7e93257ef3a0911a5c379b6265b4d49fa4aecd5782461632e9aef4779af02d7cad4405b9a5318a0e5ffe9a5bd8daeae_0"},"locations":[{"physicalLocation":{"artifactLocation":{"uri":"targets/basic/stupid.py","uriBaseId":"%SRCROOT%"},"region":{"endColumn":26,"endLine":3,"snippet":{"text":"    return a + b == a + b"},"startColumn":12,"startLine":3}}}],"message":{"text":"useless comparison operation `a + b == a + b` or `a + b != a + b`; possible bug?"},"properties":{},"ruleId":"rules.eqeq-is-bad"},{"fingerprints":{"matchBasedId/v1":"33c7ad418bcb7f83d9dcec68b2a8aa78ace93efbc20a12297ea7e15594ce23f5bca80b0958952b14dad3e874370c9ca7f991d2e1414adc33d243f133b1ff2811_0"},"locations":[{"physicalLocation":{"artifactLocation":{"uri":"targets/basic/stupid.js","uriBaseId":"%SRCROOT%"},"region":{"endColumn":19,"endLine":3,"snippet":{"text":"console.log(x == x)"},"startColumn":13,"startLine":3}}}],"message":{"text":"useless comparison"},"properties":{},"ruleId":"rules.javascript-basic-eqeq-bad"}],"tool":{"driver":{"name":"Semgrep OSS","rules":[{"defaultConfiguration":{"level":"error"},"fullDescription":{"text":"possibly useless comparison but in eq function"},"help":{"markdown":"some help text","text":"some help text"},"id":"rules.assert-eqeq-is-ok","name":"rules.assert-eqeq-is-ok","properties":{"precision":"very-high","tags":["security","sometag"]},"shortDescription":{"text":"some short description"}},{"defaultConfiguration":{"level":"error"},"fullDescription":{"text":"useless comparison operation `$X == $X` or `$X != $X`; possible bug?"},"help":{"markdown":"some help text","text":"some help text"},"id":"rules.eqeq-is-bad","name":"rules.eqeq-is-bad","properties":{"precision":"very-high","tags":["security","sometag"]},"shortDescription":{"text":"some short description"}},{"defaultConfiguration":{"level":"error"},"fullDescription":{"text":"useless comparison"},"help":{"markdown":"some help text","text":"some help text"},"id":"rules.javascript-basic-eqeq-bad","name":"rules.javascript-basic-eqeq-bad","properties":{"precision":"very-high","tags":["cwe te","security","sometag"]},"shortDescription":{"text":"some short description"}},{"defaultConfiguration":{"level":"error"},"fullDescription":{"text":"this function is only available on Python 3.7+"},"help":{"markdown":"some help text","text":"some help text"},"id":"rules.python37-compatability-os-module","name":"rules.python37-compatability-os-module","properties":{"precision":"very-high","tags":["security","sometag"]},"shortDescription":{"text":"some short description"}}],"semanticVersion":"placeholder"}}}],"$schema":"https://docs.oasis-open.org/sarif/sarif/v2.1.0/os/schemas/sarif-schema-2.1.0.json"}
|}]
;;
