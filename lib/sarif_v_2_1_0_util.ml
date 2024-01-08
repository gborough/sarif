(** Validation functions used by atdgen validator *)

open Core
open Timedesc

open Sarif_v_2_1_0_t

let validate_iso8601_opt = function
  | None -> true
  | Some v -> match of_iso8601 v with
              | Ok _ -> true
              | Error _ -> false

let validate_mime_type x =
  let re = Re2.create_exn "[^/]+/.+" in Re2.matches re x

let validate_mime_type_opt = function
  | None -> true
  | Some v -> let re = Re2.create_exn "[^/]+/.+" in Re2.matches re v

let validate_int64_minimum_zero x = if (Int64.compare x (-1L)) > 0 then true else false

let validate_int64_minimum_zero_opt = function
  | None -> true
  | Some v -> if (Int64.compare v (-1L)) > 0 then true else false

let validate_int64_minimum_one x =  if (Int64.compare x (0L)) > 0 then true else false

let validate_int64_minimum_one_opt = function
  | None -> true
  | Some v -> if (Int64.compare v (0L)) > 0 then true else false

let validate_int64_minimum_minus_one x =
  if (Int64.compare x (-2L)) > 0 then true else false

let validate_guid x =
  let re = Re2.create_exn "^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$"
  in Re2.matches re x

let validate_guid_opt = function
  | None -> true
  | Some v -> let re = Re2.create_exn "^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$"
              in Re2.matches re v

let validate_dotted_quad_file_v x =
  let re = Re2.create_exn "[0-9]+(\\\\.[0-9]+){3}"
  in Re2.matches re x

let validate_dotted_quad_file_v_opt = function
  | None -> true
  | Some v -> let re = Re2.create_exn "[0-9]+(\\\\.[0-9]+){3}" in Re2.matches re v

let validate_language x =
  let re = Re2.create_exn "^[a-zA-Z]{2}(-[a-zA-Z]{2})?$"
  in Re2.matches re x

let validate_language_opt = function
  | None -> true
  | Some v -> let re = Re2.create_exn "^[a-zA-Z]{2}(-[a-zA-Z]{2})?$" in Re2.matches re v

let validate_unique = function
  | [] -> true
  | lst -> if List.contains_dup lst ~compare:Stdlib.compare then false else true

let validate_unique_opt = function
  | None -> true
  | Some v -> match v with
    | [] -> true
    | lst -> if List.contains_dup lst ~compare:Stdlib.compare then false else true

let validate_rank x =
  if (Int64.compare x (-2L)) > 0 &&  (Int64.compare x (101L)) < 0 then true else false

let validate_uri x =
  match Uri.of_string x |> Uri.Absolute_http.of_uri with
  | Ok _ -> true
  | Error _ -> false

let validate_uri_opt = function
  | None -> true
  | Some v -> match Uri.of_string v |> Uri.Absolute_http.of_uri with
                | Ok _ -> true
                | Error _ -> false

let validate_list_min_size_one x = if (Int.compare (List.length x) 1) > 0 then true else false

let validate_list_all_str_list (lst : string list option) pred =
  match lst with
  | None -> true
  | Some v -> List.for_all v ~f:pred

let validate_list_all_deprecated_guid_list (lst : reporting_descriptor_deprecated_guids_item list option) pred =
    match lst with
    | None -> true
    | Some v -> List.for_all v ~f:pred

(** Validator for type address *)
let validate_address (address : address) =
  validate_int64_minimum_minus_one address.absolute_address &&
  validate_int64_minimum_minus_one address.index &&
  validate_int64_minimum_minus_one address.parent_index

(** Validator for type artifact *)
let validate_artifact (artifact : artifact) =
  validate_iso8601_opt artifact.last_modified_time_utc &&
  validate_int64_minimum_minus_one artifact.length &&
  validate_mime_type_opt artifact.mime_type &&
  validate_int64_minimum_zero_opt artifact.offset &&
  validate_int64_minimum_minus_one artifact.parent_index &&
  validate_unique_opt artifact.roles

(** Validator for type artifact_location *)
let validate_artifact_location (artifact_location : artifact_location) =
  validate_int64_minimum_minus_one artifact_location.index &&
  validate_uri_opt artifact_location.uri

(** Validator for type artifact_mimetype *)
let validate_artifact_mimetype (artifact_mimetype : artifact_mimetype) =
  validate_mime_type artifact_mimetype

(** Validator for type attachment *)
let validate_attachment (attachment : attachment) =
  validate_unique_opt attachment.rectangles &&
  validate_unique_opt attachment.regions

(** Validator for type conversion *)
let validate_conversion (conversion : conversion) =
  validate_unique_opt conversion.analysis_tool_log_files

(** Validator for type external_properties *)
let validate_external_properties (external_properties : external_properties ) =
  validate_unique_opt external_properties.artifacts &&
  validate_unique_opt external_properties.extensions &&
  validate_unique_opt external_properties.graph &&
  validate_guid_opt external_properties.guid &&
  validate_unique_opt external_properties.logical_locations &&
  validate_unique_opt external_properties.policies &&
  validate_guid_opt external_properties.run_guid &&
  validate_unique_opt external_properties.taxonomies &&
  validate_unique_opt external_properties.thread_flow_locations &&
  validate_unique_opt external_properties.translations &&
  validate_unique_opt external_properties.web_requests &&
  validate_unique_opt external_properties.web_responses

(** Validator for type external_properties_guid *)
let validate_external_properties_guid (external_properties_guid : external_properties_guid) =
  validate_guid external_properties_guid

(** Validator for type edge_traversal *)
let validate_edge_traversal (edge_traversal : edge_traversal) =
  validate_int64_minimum_zero_opt edge_traversal.step_over_edge_count

(** Validator for type external_properties_run_guid *)
let validate_external_properties_run_guid (external_properties_run_guid : external_properties_run_guid) =
  validate_guid external_properties_run_guid

(** Validator for type external_property_file_references *)
let validate_external_property_file_references (external_property_file_references : external_property_file_references) =
  validate_unique_opt external_property_file_references.addresses &&
  validate_unique_opt external_property_file_references.artifacts &&
  validate_unique_opt external_property_file_references.extensions &&
  validate_unique_opt external_property_file_references.graphs &&
  validate_unique_opt external_property_file_references.invocations &&
  validate_unique_opt external_property_file_references.logical_locations &&
  validate_unique_opt external_property_file_references.policies &&
  validate_unique_opt external_property_file_references.results &&
  validate_unique_opt external_property_file_references.taxonomies &&
  validate_unique_opt external_property_file_references.thread_flow_locations &&
  validate_unique_opt external_property_file_references.translations &&
  validate_unique_opt external_property_file_references.web_requests &&
  validate_unique_opt external_property_file_references.web_responses

(** Validator for type external_property_file_reference *)
let validate_external_property_file_reference (external_property_file_reference : external_property_file_reference) =
  validate_guid_opt external_property_file_reference.guid &&
  validate_int64_minimum_minus_one external_property_file_reference.item_count

(** Validator for type external_property_file_reference_guid *)
let validate_external_property_file_reference_guid (external_property_file_reference_guid : external_property_file_reference_guid) =
  validate_guid external_property_file_reference_guid

(** Validator for type fix *)
let validate_fix (fix : fix) =
  validate_list_min_size_one fix.artifact_changes &&
  validate_unique fix.artifact_changes

(** Validator for type graph *)
let validate_graph (graph : graph) =
  validate_unique_opt graph.edges &&
  validate_unique_opt graph.nodes

(** Validator for type graph_traversal_variant0 *)
let validate_graph_traversal_variant0 (graph_traversal_variant0 : graph_traversal_variant0) =
  validate_unique_opt graph_traversal_variant0.edge_traversals &&
  validate_int64_minimum_minus_one graph_traversal_variant0.result_graph_index&&
  validate_int64_minimum_minus_one graph_traversal_variant0.run_graph_index

(** Validator for type graph_traversal_variant1 *)
let validate_graph_traversal_variant1 (graph_traversal_variant1 : graph_traversal_variant1) =
  validate_unique_opt graph_traversal_variant1.edge_traversals &&
  validate_int64_minimum_minus_one graph_traversal_variant1.result_graph_index &&
  validate_int64_minimum_minus_one graph_traversal_variant1.run_graph_index

(** Validator for type invocation *)
let validate_invocation (invocation : invocation) =
  validate_iso8601_opt invocation.end_time_utc &&
  validate_unique_opt invocation.notification_configuration_overrides &&
  validate_unique_opt invocation.response_files &&
  validate_unique_opt invocation.rule_configuration_overrides &&
  validate_iso8601_opt invocation.start_time_utc

(** Validator for type location *)
let validate_location (location : location) =
  validate_unique_opt location.annotations &&
  validate_int64_minimum_minus_one location.id &&
  validate_unique_opt location.logical_locations &&
  validate_unique_opt location.relationships

(** Validator for type location_relationship *)
let validate_location_relationship (location_relationship : location_relationship) =
  validate_unique_opt location_relationship.kinds &&
  validate_int64_minimum_zero location_relationship.target

(** Validator for type logical_location *)
let validate_logical_location (logical_location : logical_location) =
  validate_int64_minimum_minus_one logical_location.index &&
  validate_int64_minimum_minus_one logical_location.parent_index

(** Validator for type node *)
let validate_node (node : node) =
  validate_unique_opt node.children

(** Validator for type notification *)
let validate_notification (notification : notification) =
  validate_unique_opt notification.locations &&
  validate_iso8601_opt notification.time_utc

(** Validator for type property_bag *)
let validate_property_bag (property_bag : property_bag) =
  validate_unique property_bag

(** Validator for type reporting_descriptor *)
let validate_reporting_descriptor (reporting_descriptor : reporting_descriptor) =
  validate_unique_opt reporting_descriptor.deprecated_guids &&
  validate_list_all_deprecated_guid_list reporting_descriptor.deprecated_guids validate_guid &&
  validate_unique_opt reporting_descriptor.deprecated_ids &&
  validate_unique_opt reporting_descriptor.deprecated_names &&
  validate_guid_opt reporting_descriptor.guid &&
  validate_uri_opt reporting_descriptor.help_uri &&
  validate_unique_opt reporting_descriptor.relationships

(** Validator for type reporting_configuration *)
let validate_reporting_configuration (reporting_configuration : reporting_configuration) =
  validate_rank reporting_configuration.rank

(** Validator for type reporting_descriptor_deprecated_guids_item *)
let validate_reporting_descriptor_deprecated_guids_item (reporting_descriptor_deprecated_guids_item : reporting_descriptor_deprecated_guids_item) =
  validate_guid reporting_descriptor_deprecated_guids_item

(** Validator for type reporting_descriptor_guid *)
let validate_reporting_descriptor_guid (reporting_descriptor_guid : reporting_descriptor_guid) =
  validate_guid reporting_descriptor_guid

(** Validator for type reporting_descriptor_relationship *)
let validate_reporting_descriptor_relationship (reporting_descriptor_relationship : reporting_descriptor_relationship) =
  validate_unique_opt reporting_descriptor_relationship.kinds

(** Validator for type reporting_descriptor_reference *)
let validate_reporting_descriptor_reference (reporting_descriptor_reference : reporting_descriptor_reference) =
  validate_guid_opt reporting_descriptor_reference.guid &&
  validate_int64_minimum_minus_one reporting_descriptor_reference.index

(** Validator for type reporting_descriptor_reference_guid *)
let validate_reporting_descriptor_reference_guid (reporting_descriptor_reference_guid : reporting_descriptor_reference_guid) =
  validate_guid reporting_descriptor_reference_guid

(** Validator for type region *)
let validate_region (region : region) =
  validate_int64_minimum_zero_opt region.byte_length &&
  validate_int64_minimum_minus_one region.byte_offset &&
  validate_int64_minimum_zero_opt region.char_length &&
  validate_int64_minimum_minus_one region.char_offset &&
  validate_int64_minimum_one_opt region.end_line &&
  validate_int64_minimum_one_opt region.start_column &&
  validate_int64_minimum_one_opt region.start_line

(** Validator for type result *)
let validate_result (result : result) =
  validate_unique_opt result.attachments &&
  validate_guid_opt result.correlation_guid &&
  validate_unique_opt result.fixes &&
  validate_unique_opt result.graph_traversals &&
  validate_unique_opt result.graphs &&
  validate_guid_opt result.guid &&
  validate_uri_opt result.hosted_viewer_uri &&
  validate_int64_minimum_one_opt result.occurrence_count &&
  validate_rank result.rank &&
  validate_unique_opt result.related_locations &&
  validate_int64_minimum_minus_one result.rule_index &&
  validate_unique_opt result.stacks &&
  validate_unique_opt result.suppressions &&
  validate_unique_opt result.taxa &&
  validate_unique_opt result.work_item_uris &&
  validate_list_all_str_list result.work_item_uris validate_uri

(** Validator for type result_correlation_guid *)
let validate_result_correlation_guid (result_correlation_guid : result_correlation_guid) =
  validate_guid result_correlation_guid

(** Validator for type result_guid *)
let validate_result_guid (result_guid : result_guid) =
  validate_guid result_guid

(** Validator for type result_provenance *)
let validate_result_provenance (result_provenance : result_provenance) =
  validate_unique_opt result_provenance.conversion_sources &&
  validate_guid_opt result_provenance.first_detection_run_guid &&
  validate_iso8601_opt result_provenance.first_detection_time_utc &&
  validate_int64_minimum_minus_one result_provenance.invocation_index &&
  validate_guid_opt result_provenance.last_detection_run_guid &&
  validate_iso8601_opt result_provenance.last_detection_time_utc

(** Validator for type result_provenance_first_detection_run_guid *)
let validate_result_provenance_first_detection_run_guid (result_provenance_first_detection_run_guid : result_provenance_first_detection_run_guid) =
  validate_guid result_provenance_first_detection_run_guid

(** Validator for type result_provenance_last_detection_run_guid *)
let validate_result_provenance_last_detection_run_guid (result_provenance_last_detection_run_guid : result_provenance_last_detection_run_guid) =
  validate_guid result_provenance_last_detection_run_guid

(** Validator for type run *)
let validate_run (run : run) =
  validate_unique_opt run.artifacts &&
  validate_guid_opt run.baseline_guid &&
  validate_unique_opt run.graphs &&
  validate_language_opt run.language &&
  validate_unique_opt run.logical_locations &&
  validate_list_min_size_one run.newline_sequences &&
  validate_unique run.newline_sequences &&
  validate_unique_opt run.policies &&
  validate_unique_opt run.redaction_tokens &&
  validate_unique_opt run.run_aggregates &&
  validate_unique_opt run.taxonomies &&
  validate_unique_opt run.thread_flow_locations &&
  validate_unique_opt run.translations &&
  validate_unique_opt run.version_control_provenance &&
  validate_unique_opt run.web_requests &&
  validate_unique_opt run.web_responses

(** Validator for type run_automation_details *)
let validate_run_automation_details (run_automation_details : run_automation_details) =
  validate_guid_opt run_automation_details.correlation_guid &&
  validate_guid_opt run_automation_details.guid

(** Validator for type run_language *)
let validate_run_language (run_language : run_language) =
  validate_language run_language

(** Validator for type run_automation_details_correlation_guid *)
let validate_run_automation_details_correlation_guid (run_automation_details_correlation_guid : run_automation_details_correlation_guid) =
  validate_guid run_automation_details_correlation_guid

(** Validator for type run_automation_details_guid *)
let validate_run_automation_details_guid (run_automation_details_guid : run_automation_details_guid) =
  validate_guid run_automation_details_guid

(** Validator for type run_baseline_guid *)
let validate_run_baseline_guid (run_baseline_guid : run_baseline_guid) =
  validate_guid run_baseline_guid

(** Validator for type suppression *)
let validate_suppression (suppression : suppression) =
  validate_guid_opt suppression.guid

(** Validator for type suppression_guid *)
let validate_suppression_guid (suppression_guid : suppression_guid) =
  validate_guid suppression_guid

(** Validator for type sarif_json_schema *)
let validate_sarif_json_schema (sarif_json_schema : sarif_json_schema) =
  validate_unique_opt sarif_json_schema.inline_external_properties

(** Validator for type tool *)
let validate_tool (tool : tool) =
  validate_unique_opt tool.extensions

(** Validator for type tool_component *)
let validate_tool_component (tool_component : tool_component) =
  validate_unique_opt tool_component.contents &&
  validate_dotted_quad_file_v_opt tool_component.dotted_quad_file_version &&
  validate_uri_opt tool_component.download_uri &&
  validate_guid_opt tool_component.guid &&
  validate_uri_opt tool_component.information_uri &&
  validate_language_opt tool_component.language &&
  validate_unique_opt tool_component.notifications &&
  validate_unique_opt tool_component.rules &&
  validate_unique_opt tool_component.supported_taxonomies &&
  validate_unique_opt tool_component.taxa

(** Validator for type thread_flow_location *)
let validate_thread_flow_location (thread_flow_location : thread_flow_location) =
  validate_int64_minimum_minus_one thread_flow_location.execution_order &&
  validate_iso8601_opt thread_flow_location.execution_time_utc &&
  validate_int64_minimum_minus_one thread_flow_location.index &&
  validate_unique_opt thread_flow_location.kinds &&
  validate_int64_minimum_zero_opt thread_flow_location.nesting_level &&
  validate_unique_opt thread_flow_location.taxa

(** Validator for type translation_metadata *)
let validate_translation_metadata (translation_metadata : translation_metadata) =
  validate_uri_opt translation_metadata.download_uri &&
  validate_uri_opt translation_metadata.information_uri

(** Validator for type tool_component_reference *)
let validate_tool_component_reference (tool_component_reference : tool_component_reference) =
  validate_guid_opt tool_component_reference.guid &&
  validate_int64_minimum_minus_one tool_component_reference.index

(** Validator for type tool_component_reference_guid *)
let validate_tool_component_reference_guid (tool_component_reference_guid : tool_component_reference_guid) =
  validate_guid tool_component_reference_guid

(** Validator for type tool_component_dotted_quad_file_version *)
let validate_tool_component_dotted_quad_file_version (tool_component_dotted_quad_file_version : tool_component_dotted_quad_file_version) =
  validate_dotted_quad_file_v tool_component_dotted_quad_file_version

(** Validator for type tool_component_guid *)
let validate_tool_component_guid (tool_component_guid : tool_component_guid) =
  validate_guid tool_component_guid

(** Validator for type tool_component_language *)
let validate_tool_component_language (tool_component_language : tool_component_language) =
  validate_language tool_component_language

(** Validator for type version_control_details *)
let validate_version_control_details (version_control_details : version_control_details) =
  validate_iso8601_opt version_control_details.as_of_time_utc &&
  validate_uri version_control_details.repository_uri

(** Validator for type web_request *)
let validate_web_request (web_request : web_request) =
  validate_int64_minimum_minus_one web_request.index

(** Validator for type web_response *)
let validate_web_response (web_response : web_response) =
  validate_int64_minimum_minus_one web_response.index

