(* Auto-generated from "sarif_v_2_1_0.atd" *)
[@@@ocaml.warning "-27-32-33-35-39"]

(** The MIME type (RFC 2045) of the artifact. *)
type artifact_mimetype = Sarif_v_2_1_0_t.artifact_mimetype
  [@@deriving show,eq,ord]

(** ArtifactRolesItem *)
type artifact_roles_item = Sarif_v_2_1_0_t.artifact_roles_item
  [@@deriving show,eq,ord]

(**
  A stable, unique identifier for this external properties object, in the
  form of a GUID.
*)
type external_properties_guid = Sarif_v_2_1_0_t.external_properties_guid
  [@@deriving show,eq,ord]

(**
  A stable, unique identifier for the run associated with this external
  properties object, in the form of a GUID.
*)
type external_properties_run_guid =
  Sarif_v_2_1_0_t.external_properties_run_guid
  [@@deriving show,eq,ord]

type external_properties_version =
  Sarif_v_2_1_0_t.external_properties_version
  [@@deriving show,eq,ord]

type hm_str_str = Sarif_v_2_1_0_t.hm_str_str [@@deriving show,eq,ord]

type int64 = Sarif_v_2_1_0_t.int64 [@@deriving show,eq,ord]

(** A value specifying the severity level of the notification. *)
type notification_level = Sarif_v_2_1_0_t.notification_level
  [@@deriving show,eq,ord]

(** Key/value pairs that provide additional information about the object. *)
type property_bag = Sarif_v_2_1_0_t.property_bag
  [@@deriving show,eq,ord]

(**
  A physical or virtual address, or a range of addresses, in an 'addressable
  region' (memory or a binary file).
*)
type address = Sarif_v_2_1_0_t.address = {
  absolute_address: int64
    (**
      The address expressed as a byte offset from the start of the
      addressable region.
    *);
  fully_qualified_name: string option
    (**
      A human-readable fully qualified name that is associated with the
      address.
    *);
  index: int64
    (**
      The index within run.addresses of the cached object for this address.
    *);
  kind: string option
    (**
      An open-ended string that identifies the address kind. 'data',
      'function', 'header','instruction', 'module', 'page', 'section',
      'segment', 'stack', 'stackFrame', 'table' are well-known values.
    *);
  length: int64 option (** The number of bytes in this range of addresses. *);
  name: string option
    (** A name that is associated with the address, e.g., '.text'. *);
  offset_from_parent: int64 option
    (**
      The byte offset of this address from the absolute or relative address
      of the parent object.
    *);
  parent_index: int64
    (** The index within run.addresses of the parent object. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the address.
    *);
  relative_address: int64 option
    (**
      The address expressed as a byte offset from the absolute address of the
      top-most parent object.
    *)
}
  [@@deriving show,eq,ord]

(** A logical location of a construct that produced a result. *)
type logical_location = Sarif_v_2_1_0_t.logical_location = {
  decorated_name: string option
    (**
      The machine-readable name for the logical location, such as a mangled
      function name provided by a C++ compiler that encodes calling
      convention, return type and other details along with the function name.
    *);
  fully_qualified_name: string option
    (** The human-readable fully qualified name of the logical location. *);
  index: int64 (** The index within the logical locations array. *);
  kind: string option
    (**
      The type of construct this logical location component refers to. Should
      be one of 'function', 'member', 'module', 'namespace', 'parameter',
      'resource', 'returnType', 'type', 'variable', 'object', 'array',
      'property', 'value', 'element', 'text', 'attribute', 'comment',
      'declaration', 'dtd' or 'processingInstruction', if any of those
      accurately describe the construct.
    *);
  name: string option
    (**
      Identifies the construct in which the result occurred. For example,
      this property might contain the name of a class or a method.
    *);
  parent_index: int64
    (**
      Identifies the index of the immediate parent of the construct in which
      the result was detected. For example, this property might point to a
      logical location that represents the namespace that holds a type.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the logical
      location.
    *)
}
  [@@deriving show,eq,ord]

(** Encapsulates a message intended to be read by the end user. *)
type message = Sarif_v_2_1_0_t.message = {
  arguments: string list option
    (** An array of strings to substitute into the message string. *);
  id: string option (** The identifier for this message. *);
  markdown: string option (** A Markdown message string. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the message.
    *);
  text: string option (** A plain text message string. *)
}
  [@@deriving show,eq,ord]

(** Specifies the location of an artifact. *)
type artifact_location = Sarif_v_2_1_0_t.artifact_location = {
  description: message option
    (** A short description of the artifact location. *);
  index: int64
    (**
      The index within the run artifacts array of the artifact object
      associated with the artifact location.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the artifact
      location.
    *);
  uri: string option
    (** A string containing a valid relative or absolute URI. *);
  uri_base_id: string option
    (**
      A string which indirectly specifies the absolute URI with respect to
      which a relative URI in the "uri" property is interpreted.
    *)
}
  [@@deriving show,eq,ord]

(** Represents a directed edge in a graph. *)
type edge = Sarif_v_2_1_0_t.edge = {
  id: string
    (** A string that uniquely identifies the edge within its graph. *);
  label: message option (** A short description of the edge. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the edge.
    *);
  source_node_id: string
    (** Identifies the source node (the node at which the edge starts). *);
  target_node_id: string
    (** Identifies the target node (the node at which the edge ends). *)
}
  [@@deriving show,eq,ord]

(** Information about the relation of one location to another. *)
type location_relationship = Sarif_v_2_1_0_t.location_relationship = {
  description: message option
    (** A description of the location relationship. *);
  kinds: string list option
    (**
      A set of distinct strings that categorize the relationship. Well-known
      kinds include 'includes', 'isIncludedBy' and 'relevant'.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the location
      relationship.
    *);
  target: int64 (** A reference to the related location. *)
}
  [@@deriving show,eq,ord]

(**
  A message string or message format string rendered in multiple formats.
*)
type multiformat_message_string =
  Sarif_v_2_1_0_t.multiformat_message_string = {
  markdown: string option (** A Markdown message string or format string. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the message.
    *);
  text: string (** A plain text message string or format string. *)
}
  [@@deriving show,eq,ord]

(** Represents the contents of an artifact. *)
type artifact_content = Sarif_v_2_1_0_t.artifact_content = {
  binary: string option
    (**
      MIME Base64-encoded content from a binary artifact, or from a text
      artifact in its original encoding.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the artifact
      content.
    *);
  rendered: multiformat_message_string option
    (**
      An alternate rendered representation of the artifact (e.g., a
      decompiled representation of a binary region).
    *);
  text: string option (** UTF-8-encoded content from a text artifact. *)
}
  [@@deriving show,eq,ord]

type hm_str_mms = Sarif_v_2_1_0_t.hm_str_mms [@@deriving show,eq,ord]

(** Represents the traversal of a single edge during a graph traversal. *)
type edge_traversal = Sarif_v_2_1_0_t.edge_traversal = {
  edge_id: string (** Identifies the edge being traversed. *);
  final_state: hm_str_mms option
    (**
      The values of relevant expressions after the edge has been traversed.
    *);
  message: message option
    (** A message to display to the user as the edge is traversed. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the edge
      traversal.
    *);
  step_over_edge_count: int64 option
    (**
      The number of edge traversals necessary to return from a nested graph.
    *)
}
  [@@deriving show,eq,ord]

type graph_traversal_variant0 = Sarif_v_2_1_0_t.graph_traversal_variant0 = {
  description: message option (** A description of this graph traversal. *);
  edge_traversals: edge_traversal list option
    (** The sequences of edges traversed by this graph traversal. *);
  immutable_state: hm_str_mms option
    (**
      Values of relevant expressions at the start of the graph traversal that
      remain constant for the graph traversal.
    *);
  initial_state: hm_str_mms option
    (**
      Values of relevant expressions at the start of the graph traversal that
      may change during graph traversal.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the graph
      traversal.
    *);
  result_graph_index: int64
    (**
      The index within the result.graphs to be associated with the result.
    *);
  run_graph_index: int64
    (** The index within the run.graphs to be associated with the result. *)
}
  [@@deriving show,eq,ord]

type graph_traversal_variant1 = Sarif_v_2_1_0_t.graph_traversal_variant1 = {
  description: message option (** A description of this graph traversal. *);
  edge_traversals: edge_traversal list option
    (** The sequences of edges traversed by this graph traversal. *);
  immutable_state: hm_str_mms option
    (**
      Values of relevant expressions at the start of the graph traversal that
      remain constant for the graph traversal.
    *);
  initial_state: hm_str_mms option
    (**
      Values of relevant expressions at the start of the graph traversal that
      may change during graph traversal.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the graph
      traversal.
    *);
  result_graph_index: int64
    (**
      The index within the result.graphs to be associated with the result.
    *);
  run_graph_index: int64
    (** The index within the run.graphs to be associated with the result. *)
}
  [@@deriving show,eq,ord]

(** Represents a path through a graph. *)
type graph_traversal = Sarif_v_2_1_0_t.graph_traversal
  [@@deriving show,eq,ord]

(** An area within an image. *)
type rectangle = Sarif_v_2_1_0_t.rectangle = {
  bottom: float option;
  left: float option;
  message: message option (** A message relevant to the rectangle. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the
      rectangle.
    *);
  right: float option;
  top: float option
}
  [@@deriving show,eq,ord]

(** A region within an artifact where a result was detected. *)
type region = Sarif_v_2_1_0_t.region = {
  byte_length: int64 option (** The length of the region in bytes. *);
  byte_offset: int64
    (**
      The zero-based offset from the beginning of the artifact of the first
      byte in the region.
    *);
  char_length: int64 option (** The length of the region in characters. *);
  char_offset: int64
    (**
      The zero-based offset from the beginning of the artifact of the first
      character in the region.
    *);
  end_column: int64 option
    (**
      The column number of the character following the end of the region.
    *);
  end_line: int64 option
    (** The line number of the last character in the region. *);
  message: message option (** A message relevant to the region. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the region.
    *);
  snippet: artifact_content option
    (** The portion of the artifact contents within the specified region. *);
  source_language: string option
    (**
      Specifies the source language, if any, of the portion of the artifact
      specified by the region object.
    *);
  start_column: int64 option
    (** The column number of the first character in the region. *);
  start_line: int64 option
    (** The line number of the first character in the region. *)
}
  [@@deriving show,eq,ord]

(** An artifact relevant to a result. *)
type attachment = Sarif_v_2_1_0_t.attachment = {
  artifact_location: artifact_location (** The location of the attachment. *);
  description: message option
    (** A message describing the role played by the attachment. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the
      attachment.
    *);
  rectangles: rectangle list option
    (**
      An array of rectangles specifying areas of interest within the image.
    *);
  regions: region list option
    (** An array of regions of interest within the attachment. *)
}
  [@@deriving show,eq,ord]

(**
  A physical location relevant to a result. Specifies a reference to a
  programming artifact together with a range of bytes or characters within
  that artifact.
*)
type physical_location = Sarif_v_2_1_0_t.physical_location = {
  address: address option (** The address of the location. *);
  artifact_location: artifact_location option
    (** The location of the artifact. *);
  context_region: region option
    (**
      Specifies a portion of the artifact that encloses the region. Allows a
      viewer to display additional context around the region.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the physical
      location.
    *);
  region: region option (** Specifies a portion of the artifact. *)
}
  [@@deriving show,eq,ord]

(** A location within a programming artifact. *)
type location = Sarif_v_2_1_0_t.location = {
  annotations: region list option
    (** A set of regions relevant to the location. *);
  id: int64
    (**
      Value that distinguishes this location from all other locations within
      a single result object.
    *);
  logical_locations: logical_location list option
    (** The logical locations associated with the result. *);
  message: message option (** A message relevant to the location. *);
  physical_location: physical_location option
    (** Identifies the artifact and region. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the location.
    *);
  relationships: location_relationship list option
    (**
      An array of objects that describe relationships between this location
      and others.
    *)
}
  [@@deriving show,eq,ord]

(** The replacement of a single region of an artifact. *)
type replacement = Sarif_v_2_1_0_t.replacement = {
  deleted_region: region (** The region of the artifact to delete. *);
  inserted_content: artifact_content option
    (**
      The content to insert at the location specified by the 'deletedRegion'
      property.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the
      replacement.
    *)
}
  [@@deriving show,eq,ord]

(** A change to a single artifact. *)
type artifact_change = Sarif_v_2_1_0_t.artifact_change = {
  artifact_location: artifact_location
    (** The location of the artifact to change. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the change.
    *);
  replacements: replacement list
    (**
      An array of replacement objects, each of which represents the
      replacement of a single region in a single artifact specified by
      'artifactLocation'.
    *)
}
  [@@deriving show,eq,ord]

(**
  A proposed fix for the problem represented by a result object. A fix
  specifies a set of artifacts to modify. For each artifact, it specifies a
  set of bytes to remove, and provides a set of new bytes to replace them.
*)
type fix = Sarif_v_2_1_0_t.fix = {
  artifact_changes: artifact_change list
    (** One or more artifact changes that comprise a fix for a result. *);
  description: message option
    (**
      A message that describes the proposed fix, enabling viewers to present
      the proposed change to an end user.
    *);
  properties: property_bag option
    (** Key/value pairs that provide additional information about the fix. *)
}
  [@@deriving show,eq,ord]

(** Specifies the failure level for the report. *)
type reporting_configuration_level =
  Sarif_v_2_1_0_t.reporting_configuration_level
  [@@deriving show,eq,ord]

(**
  Information about a rule or notification that can be configured at runtime.
*)
type reporting_configuration = Sarif_v_2_1_0_t.reporting_configuration = {
  enabled: bool
    (** Specifies whether the report may be produced during the scan. *);
  level: reporting_configuration_level option
    (** Specifies the failure level for the report. *);
  parameters: property_bag option
    (** Contains configuration information specific to a report. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the reporting
      configuration.
    *);
  rank: int64
}
  [@@deriving show,eq,ord]

(** ReportingDescriptorDeprecatedGuidsItem *)
type reporting_descriptor_deprecated_guids_item =
  Sarif_v_2_1_0_t.reporting_descriptor_deprecated_guids_item
  [@@deriving show,eq,ord]

(**
  A unique identifier for the reporting descriptor in the form of a GUID.
*)
type reporting_descriptor_guid = Sarif_v_2_1_0_t.reporting_descriptor_guid
  [@@deriving show,eq,ord]

(** A guid that uniquely identifies the descriptor. *)
type reporting_descriptor_reference_guid =
  Sarif_v_2_1_0_t.reporting_descriptor_reference_guid
  [@@deriving show,eq,ord]

(** The state of a result relative to a baseline of a previous run. *)
type result_baseline_state = Sarif_v_2_1_0_t.result_baseline_state
  [@@deriving show,eq,ord]

(**
  A stable, unique identifier for the equivalence class of logically
  identical results to which this result belongs, in the form of a GUID.
*)
type result_correlation_guid = Sarif_v_2_1_0_t.result_correlation_guid
  [@@deriving show,eq,ord]

(** A stable, unique identifier for the result in the form of a GUID. *)
type result_guid = Sarif_v_2_1_0_t.result_guid
  [@@deriving show,eq,ord]

(** A value that categorizes results by evaluation state. *)
type result_kind = Sarif_v_2_1_0_t.result_kind
  [@@deriving show,eq,ord]

(** A value specifying the severity level of the result. *)
type result_level = Sarif_v_2_1_0_t.result_level
  [@@deriving show,eq,ord]

(**
  A GUID-valued string equal to the automationDetails.guid property of the
  run in which the result was first detected.
*)
type result_provenance_first_detection_run_guid =
  Sarif_v_2_1_0_t.result_provenance_first_detection_run_guid
  [@@deriving show,eq,ord]

(**
  A GUID-valued string equal to the automationDetails.guid property of the
  run in which the result was most recently detected.
*)
type result_provenance_last_detection_run_guid =
  Sarif_v_2_1_0_t.result_provenance_last_detection_run_guid
  [@@deriving show,eq,ord]

(** Contains information about how and when a result was detected. *)
type result_provenance = Sarif_v_2_1_0_t.result_provenance = {
  conversion_sources: physical_location list option
    (**
      An array of physicalLocation objects which specify the portions of an
      analysis tool's output that a converter transformed into the result.
    *);
  first_detection_run_guid: result_provenance_first_detection_run_guid option
    (**
      A GUID-valued string equal to the automationDetails.guid property of
      the run in which the result was first detected.
    *);
  first_detection_time_utc: string option
    (**
      The Coordinated Universal Time (UTC) date and time at which the result
      was first detected. See "Date/time properties" in the SARIF spec for
      the required format.
    *);
  invocation_index: int64
    (**
      The index within the run.invocations array of the invocation object
      which describes the tool invocation that detected the result.
    *);
  last_detection_run_guid: result_provenance_last_detection_run_guid option
    (**
      A GUID-valued string equal to the automationDetails.guid property of
      the run in which the result was most recently detected.
    *);
  last_detection_time_utc: string option
    (**
      The Coordinated Universal Time (UTC) date and time at which the result
      was most recently detected. See "Date/time properties" in the SARIF
      spec for the required format.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the result.
    *)
}
  [@@deriving show,eq,ord]

(** A function call within a stack trace. *)
type stack_frame = Sarif_v_2_1_0_t.stack_frame = {
  location: location option
    (** The location to which this stack frame refers. *);
  module_: string option
    (** The name of the module that contains the code of this stack frame. *);
  parameters: string list option
    (** The parameters of the call that is executing. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the stack
      frame.
    *);
  thread_id: int64 option (** The thread identifier of the stack frame. *)
}
  [@@deriving show,eq,ord]

(** A call stack that is relevant to a result. *)
type stack = Sarif_v_2_1_0_t.stack = {
  frames: stack_frame list
    (**
      An array of stack frames that represents a sequence of calls, rendered
      in reverse chronological order, that comprise the call stack.
    *);
  message: message option (** A message relevant to this call stack. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the stack.
    *)
}
  [@@deriving show,eq,ord]

(** A stable, unique identifier for the suprression in the form of a GUID. *)
type suppression_guid = Sarif_v_2_1_0_t.suppression_guid
  [@@deriving show,eq,ord]

(** A string that indicates where the suppression is persisted. *)
type suppression_kind = Sarif_v_2_1_0_t.suppression_kind
  [@@deriving show,eq,ord]

(** A string that indicates the review status of the suppression. *)
type suppression_status = Sarif_v_2_1_0_t.suppression_status
  [@@deriving show,eq,ord]

(** A suppression that is relevant to a result. *)
type suppression = Sarif_v_2_1_0_t.suppression = {
  guid: suppression_guid option
    (**
      A stable, unique identifier for the suprression in the form of a GUID.
    *);
  justification: string option
    (** A string representing the justification for the suppression. *);
  kind: suppression_kind
    (** A string that indicates where the suppression is persisted. *);
  location: location option
    (** Identifies the location associated with the suppression. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the
      suppression.
    *);
  status: suppression_status option
    (** A string that indicates the review status of the suppression. *)
}
  [@@deriving show,eq,ord]

(**
  Specifies the importance of this location in understanding the code flow in
  which it occurs. The order from most to least important is "essential",
  "important", "unimportant". Default: "important".
*)
type thread_flow_location_importance =
  Sarif_v_2_1_0_t.thread_flow_location_importance
  [@@deriving show,eq,ord]

(** ToolComponentContentsItem *)
type tool_component_contents_item =
  Sarif_v_2_1_0_t.tool_component_contents_item
  [@@deriving show,eq,ord]

(**
  The binary version of the tool component's primary executable file
  expressed as four non-negative integers separated by a period (for
  operating systems that express file versions in this way).
*)
type tool_component_dotted_quad_file_version =
  Sarif_v_2_1_0_t.tool_component_dotted_quad_file_version
  [@@deriving show,eq,ord]

(** A unique identifier for the tool component in the form of a GUID. *)
type tool_component_guid = Sarif_v_2_1_0_t.tool_component_guid
  [@@deriving show,eq,ord]

(**
  The language of the messages emitted into the log file during this run
  (expressed as an ISO 639-1 two-letter lowercase language code) and an
  optional region (expressed as an ISO 3166-1 two-letter uppercase subculture
  code associated with a country or region). The casing is recommended but
  not required (in order for this data to conform to RFC5646).
*)
type tool_component_language = Sarif_v_2_1_0_t.tool_component_language
  [@@deriving show,eq,ord]

(** The 'guid' property of the referenced toolComponent. *)
type tool_component_reference_guid =
  Sarif_v_2_1_0_t.tool_component_reference_guid
  [@@deriving show,eq,ord]

(**
  Identifies a particular toolComponent object, either the driver or an
  extension.
*)
type tool_component_reference = Sarif_v_2_1_0_t.tool_component_reference = {
  guid: tool_component_reference_guid option
    (** The 'guid' property of the referenced toolComponent. *);
  index: int64
    (** An index into the referenced toolComponent in tool.extensions. *);
  name: string option
    (** The 'name' property of the referenced toolComponent. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the
      toolComponentReference.
    *)
}
  [@@deriving show,eq,ord]

(** Information about how to locate a relevant reporting descriptor. *)
type reporting_descriptor_reference =
  Sarif_v_2_1_0_t.reporting_descriptor_reference = {
  guid: reporting_descriptor_reference_guid option
    (** A guid that uniquely identifies the descriptor. *);
  id: string option (** The id of the descriptor. *);
  index: int64
    (**
      The index into an array of descriptors in
      toolComponent.ruleDescriptors, toolComponent.notificationDescriptors,
      or toolComponent.taxonomyDescriptors, depending on context.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the reporting
      descriptor reference.
    *);
  tool_component: tool_component_reference option
    (**
      A reference used to locate the toolComponent associated with the
      descriptor.
    *)
}
  [@@deriving show,eq,ord]

(**
  Information about how a specific rule or notification was reconfigured at
  runtime.
*)
type configuration_override = Sarif_v_2_1_0_t.configuration_override = {
  configuration: reporting_configuration
    (**
      Specifies how the rule or notification was configured during the scan.
    *);
  descriptor: reporting_descriptor_reference
    (**
      A reference used to locate the descriptor whose configuration was
      overridden.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the
      configuration override.
    *)
}
  [@@deriving show,eq,ord]

(** Information about the relation of one reporting descriptor to another. *)
type reporting_descriptor_relationship =
  Sarif_v_2_1_0_t.reporting_descriptor_relationship = {
  description: message option
    (** A description of the reporting descriptor relationship. *);
  kinds: string list option
    (**
      A set of distinct strings that categorize the relationship. Well-known
      kinds include 'canPrecede', 'canFollow', 'willPrecede', 'willFollow',
      'superset', 'subset', 'equal', 'disjoint', 'relevant', and
      'incomparable'.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the reporting
      descriptor reference.
    *);
  target: reporting_descriptor_reference
    (** A reference to the related reporting descriptor. *)
}
  [@@deriving show,eq,ord]

(**
  Metadata that describes a specific report produced by the tool, as part of
  the analysis it provides or its runtime reporting.
*)
type reporting_descriptor = Sarif_v_2_1_0_t.reporting_descriptor = {
  default_configuration: reporting_configuration option
    (** Default reporting configuration information. *);
  deprecated_guids: reporting_descriptor_deprecated_guids_item list option
    (**
      An array of unique identifies in the form of a GUID by which this
      report was known in some previous version of the analysis tool.
    *);
  deprecated_ids: string list option
    (**
      An array of stable, opaque identifiers by which this report was known
      in some previous version of the analysis tool.
    *);
  deprecated_names: string list option
    (**
      An array of readable identifiers by which this report was known in some
      previous version of the analysis tool.
    *);
  full_description: multiformat_message_string option
    (**
      A description of the report. Should, as far as possible, provide
      details sufficient to enable resolution of any problem indicated by the
      result.
    *);
  guid: reporting_descriptor_guid option
    (**
      A unique identifier for the reporting descriptor in the form of a GUID.
    *);
  help: multiformat_message_string option
    (**
      Provides the primary documentation for the report, useful when there is
      no online documentation.
    *);
  help_uri: string option
    (** A URI where the primary documentation for the report can be found. *);
  id: string (** A stable, opaque identifier for the report. *);
  message_strings: hm_str_mms option
    (**
      A set of name/value pairs with arbitrary names. Each value is a
      multiformatMessageString object, which holds message strings in plain
      text and (optionally) Markdown format. The strings can include
      placeholders, which can be used to construct a message in combination
      with an arbitrary number of additional string arguments.
    *);
  name: string option
    (** A report identifier that is understandable to an end user. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the report.
    *);
  relationships: reporting_descriptor_relationship list option
    (**
      An array of objects that describe relationships between this reporting
      descriptor and others.
    *);
  short_description: multiformat_message_string option
    (**
      A concise description of the report. Should be a single sentence that
      is understandable when visible space is limited to a single line of
      text.
    *)
}
  [@@deriving show,eq,ord]

(** Provides additional metadata related to translation. *)
type translation_metadata = Sarif_v_2_1_0_t.translation_metadata = {
  download_uri: string option
    (**
      The absolute URI from which the translation metadata can be downloaded.
    *);
  full_description: multiformat_message_string option
    (** A comprehensive description of the translation metadata. *);
  full_name: string option
    (** The full name associated with the translation metadata. *);
  information_uri: string option
    (**
      The absolute URI from which information related to the translation
      metadata can be downloaded.
    *);
  name: string (** The name associated with the translation metadata. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the
      translation metadata.
    *);
  short_description: multiformat_message_string option
    (** A brief description of the translation metadata. *)
}
  [@@deriving show,eq,ord]

(**
  A component, such as a plug-in or the driver, of the analysis tool that was
  run.
*)
type tool_component = Sarif_v_2_1_0_t.tool_component = {
  associated_component: tool_component_reference option
    (**
      The component which is strongly associated with this component. For a
      translation, this refers to the component which has been translated.
      For an extension, this is the driver that provides the extension's
      plugin model.
    *);
  contents: tool_component_contents_item list option
    (** The kinds of data contained in this object. *);
  dotted_quad_file_version: tool_component_dotted_quad_file_version option
    (**
      The binary version of the tool component's primary executable file
      expressed as four non-negative integers separated by a period (for
      operating systems that express file versions in this way).
    *);
  download_uri: string option
    (** The absolute URI from which the tool component can be downloaded. *);
  full_description: multiformat_message_string option
    (** A comprehensive description of the tool component. *);
  full_name: string option
    (**
      The name of the tool component along with its version and any other
      useful identifying information, such as its locale.
    *);
  global_message_strings: hm_str_mms option
    (**
      A dictionary, each of whose keys is a resource identifier and each of
      whose values is a multiformatMessageString object, which holds message
      strings in plain text and (optionally) Markdown format. The strings can
      include placeholders, which can be used to construct a message in
      combination with an arbitrary number of additional string arguments.
    *);
  guid: tool_component_guid option
    (** A unique identifier for the tool component in the form of a GUID. *);
  information_uri: string option
    (**
      The absolute URI at which information about this version of the tool
      component can be found.
    *);
  is_comprehensive: bool
    (**
      Specifies whether this object contains a complete definition of the
      localizable and/or non-localizable data for this component, as opposed
      to including only data that is relevant to the results persisted to
      this log file.
    *);
  language: tool_component_language option
    (**
      The language of the messages emitted into the log file during this run
      (expressed as an ISO 639-1 two-letter lowercase language code) and an
      optional region (expressed as an ISO 3166-1 two-letter uppercase
      subculture code associated with a country or region). The casing is
      recommended but not required (in order for this data to conform to
      RFC5646).
    *);
  localized_data_semantic_version: string option
    (**
      The semantic version of the localized strings defined in this
      component; maintained by components that provide translations.
    *);
  locations: artifact_location list option
    (**
      An array of the artifactLocation objects associated with the tool
      component.
    *);
  minimum_required_localized_data_semantic_version: string option
    (**
      The minimum value of localizedDataSemanticVersion required in
      translations consumed by this component; used by components that
      consume translations.
    *);
  name: string (** The name of the tool component. *);
  notifications: reporting_descriptor list option
    (**
      An array of reportingDescriptor objects relevant to the notifications
      related to the configuration and runtime execution of the tool
      component.
    *);
  organization: string option
    (** The organization or company that produced the tool component. *);
  product: string option
    (** A product suite to which the tool component belongs. *);
  product_suite: string option
    (**
      A localizable string containing the name of the suite of products to
      which the tool component belongs.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the tool
      component.
    *);
  release_date_utc: string option
    (**
      A string specifying the UTC date (and optionally, the time) of the
      component's release.
    *);
  rules: reporting_descriptor list option
    (**
      An array of reportingDescriptor objects relevant to the analysis
      performed by the tool component.
    *);
  semantic_version: string option
    (**
      The tool component version in the format specified by Semantic
      Versioning 2.0.
    *);
  short_description: multiformat_message_string option
    (** A brief description of the tool component. *);
  supported_taxonomies: tool_component_reference list option
    (**
      An array of toolComponentReference objects to declare the taxonomies
      supported by the tool component.
    *);
  taxa: reporting_descriptor list option
    (**
      An array of reportingDescriptor objects relevant to the definitions of
      both standalone and tool-defined taxonomies.
    *);
  translation_metadata: translation_metadata option
    (**
      Translation metadata, required for a translation, not populated by
      other component types.
    *);
  version: string option
    (**
      The tool component version, in whatever format the component natively
      provides.
    *)
}
  [@@deriving show,eq,ord]

(** The analysis tool that was run. *)
type tool = Sarif_v_2_1_0_t.tool = {
  driver: tool_component (** The analysis tool that was run. *);
  extensions: tool_component list option
    (**
      Tool extensions that contributed to or reconfigured the analysis tool
      that was run.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the tool.
    *)
}
  [@@deriving show,eq,ord]

(** Describes an HTTP request. *)
type web_request = Sarif_v_2_1_0_t.web_request = {
  body: artifact_content option (** The body of the request. *);
  headers: hm_str_str option (** The request headers. *);
  index: int64
    (**
      The index within the run.webRequests array of the request object
      associated with this result.
    *);
  method_: string option
    (**
      The HTTP method. Well-known values are 'GET', 'PUT', 'POST', 'DELETE',
      'PATCH', 'HEAD', 'OPTIONS', 'TRACE', 'CONNECT'.
    *);
  parameters: hm_str_str option (** The request parameters. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the request.
    *);
  protocol: string option (** The request protocol. Example: 'http'. *);
  target: string option (** The target of the request. *);
  version: string option (** The request version. Example: '1.1'. *)
}
  [@@deriving show,eq,ord]

(** Describes the response to an HTTP request. *)
type web_response = Sarif_v_2_1_0_t.web_response = {
  body: artifact_content option (** The body of the request. *);
  headers: hm_str_str option (** The request headers. *);
  index: int64
    (**
      The index within the run.webRequests array of the request object
      associated with this result.
    *);
  no_response_received: bool
    (** Specifies whether a response was received from the server. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the request.
    *);
  protocol: string option (** The request protocol. Example: 'http'. *);
  reason_phrase: string option
    (** The response reason. Example: 'Not found'. *);
  status_code: string option (** The response status code. Example: 451. *);
  version: string option (** The request version. Example: '1.1'. *)
}
  [@@deriving show,eq,ord]

(**
  A location visited by an analysis tool while simulating or monitoring the
  execution of a program.
*)
type thread_flow_location = Sarif_v_2_1_0_t.thread_flow_location = {
  execution_order: int64
    (**
      An integer representing the temporal order in which execution reached
      this location.
    *);
  execution_time_utc: string option
    (**
      The Coordinated Universal Time (UTC) date and time at which this
      location was executed.
    *);
  importance: thread_flow_location_importance option
    (**
      Specifies the importance of this location in understanding the code
      flow in which it occurs. The order from most to least important is
      "essential", "important", "unimportant". Default: "important".
    *);
  index: int64 (** he index within the run threadFlowLocations array. *);
  kinds: string list option
    (**
      A set of distinct strings that categorize the thread flow location.
      Well-known kinds include 'acquire', 'release', 'enter', 'exit', 'call',
      'return', 'branch', 'implicit', 'false', 'true', 'caution', 'danger',
      'unknown', 'unreachable', 'taint', 'function', 'handler', 'lock',
      'memory', 'resource', 'scope' and 'value'.
    *);
  location: location option (** The code location. *);
  module_: string option
    (** The name of the module that contains the code that is executing. *);
  nesting_level: int64 option
    (**
      An integer representing a containment hierarchy within the thread flow.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the
      threadflow location.
    *);
  stack: stack option (** The call stack leading to this location. *);
  state: hm_str_mms option
    (**
      A dictionary, each of whose keys specifies a variable or expression,
      the associated value of which represents the variable or expression
      value. For an annotation of kind 'continuation', for example, this
      dictionary might hold the current assumed values of a set of global
      variables.
    *);
  taxa: reporting_descriptor_reference list option
    (**
      An array of references to rule or taxonomy reporting descriptors that
      are applicable to the thread flow location.
    *);
  web_request: web_request option
    (** A web request associated with this thread flow location. *);
  web_response: web_response option
    (** A web response associated with this thread flow location. *)
}
  [@@deriving show,eq,ord]

(**
  Describes a sequence of code locations that specify a path through a single
  thread of execution such as an operating system or fiber.
*)
type thread_flow = Sarif_v_2_1_0_t.thread_flow = {
  id: string option
    (**
      An string that uniquely identifies the threadFlow within the codeFlow
      in which it occurs.
    *);
  immutable_state: hm_str_mms option
    (**
      Values of relevant expressions at the start of the thread flow that
      remain constant.
    *);
  initial_state: hm_str_mms option
    (**
      Values of relevant expressions at the start of the thread flow that may
      change during thread flow execution.
    *);
  locations: thread_flow_location list
    (**
      A temporally ordered array of 'threadFlowLocation' objects, each of
      which describes a location visited by the tool while producing the
      result.
    *);
  message: message option (** A message relevant to the thread flow. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the thread
      flow.
    *)
}
  [@@deriving show,eq,ord]

(**
  A set of threadFlows which together describe a pattern of code execution
  relevant to detecting a result.
*)
type code_flow = Sarif_v_2_1_0_t.code_flow = {
  message: message option (** A message relevant to the code flow. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the code
      flow.
    *);
  thread_flows: thread_flow list
    (**
      An array of one or more unique threadFlow objects, each of which
      describes the progress of a program through a thread of execution.
    *)
}
  [@@deriving show,eq,ord]

(** Represents a node in a graph. *)
type node = Sarif_v_2_1_0_t.node = {
  children: node list option (** Array of child nodes. *);
  id: string
    (** A string that uniquely identifies the node within its graph. *);
  label: message option (** A short description of the node. *);
  location: location option (** A code location associated with the node. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the node.
    *)
}
  [@@deriving show,eq,ord]

(**
  Describes a runtime exception encountered during the execution of an
  analysis tool.
*)
type exception_ = Sarif_v_2_1_0_t.exception_ = {
  inner_exceptions: exception_ list option
    (**
      An array of exception objects each of which is considered a cause of
      this exception.
    *);
  kind: string option
    (**
      A string that identifies the kind of exception, for example, the fully
      qualified type name of an object that was thrown, or the symbolic name
      of a signal.
    *);
  message: string option (** A message that describes the exception. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the
      exception.
    *);
  stack: stack option
    (** The sequence of function calls leading to the exception. *)
}
  [@@deriving show,eq,ord]

(**
  A network of nodes and directed edges that describes some aspect of the
  structure of the code (for example, a call graph).
*)
type graph = Sarif_v_2_1_0_t.graph = {
  description: message option (** A description of the graph. *);
  edges: edge list option
    (** An array of edge objects representing the edges of the graph. *);
  nodes: node list option
    (** An array of node objects representing the nodes of the graph. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the graph.
    *)
}
  [@@deriving show,eq,ord]

(** A result produced by an analysis tool. *)
type result = Sarif_v_2_1_0_t.result = {
  analysis_target: artifact_location option
    (**
      Identifies the artifact that the analysis tool was instructed to scan.
      This need not be the same as the artifact where the result actually
      occurred.
    *);
  attachments: attachment list option
    (** A set of artifacts relevant to the result. *);
  baseline_state: result_baseline_state option
    (** The state of a result relative to a baseline of a previous run. *);
  code_flows: code_flow list option
    (** An array of 'codeFlow' objects relevant to the result. *);
  correlation_guid: result_correlation_guid option
    (**
      A stable, unique identifier for the equivalence class of logically
      identical results to which this result belongs, in the form of a GUID.
    *);
  fingerprints: hm_str_str option
    (**
      A set of strings each of which individually defines a stable, unique
      identity for the result.
    *);
  fixes: fix list option
    (**
      An array of 'fix' objects, each of which represents a proposed fix to
      the problem indicated by the result.
    *);
  graph_traversals: graph_traversal list option
    (** An array of one or more unique 'graphTraversal' objects. *);
  graphs: graph list option
    (**
      An array of zero or more unique graph objects associated with the
      result.
    *);
  guid: result_guid option
    (** A stable, unique identifier for the result in the form of a GUID. *);
  hosted_viewer_uri: string option
    (** An absolute URI at which the result can be viewed. *);
  kind: result_kind option
    (** A value that categorizes results by evaluation state. *);
  level: result_level option
    (** A value specifying the severity level of the result. *);
  locations: location list option
    (**
      The set of locations where the result was detected. Specify only one
      location unless the problem indicated by the result can only be
      corrected by making a change at every specified location.
    *);
  message: message
    (**
      A message that describes the result. The first sentence of the message
      only will be displayed when visible space is limited.
    *);
  occurrence_count: int64 option
    (**
      A positive integer specifying the number of times this logically unique
      result was observed in this run.
    *);
  partial_fingerprints: hm_str_str option
    (**
      A set of strings that contribute to the stable, unique identity of the
      result.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the result.
    *);
  provenance: result_provenance option
    (** Information about how and when the result was detected. *);
  rank: int64;
  related_locations: location list option
    (** A set of locations relevant to this result. *);
  rule: reporting_descriptor_reference option
    (**
      A reference used to locate the rule descriptor relevant to this result.
    *);
  rule_id: string option
    (**
      The stable, unique identifier of the rule, if any, to which this result
      is relevant.
    *);
  rule_index: int64
    (**
      The index within the tool component rules array of the rule object
      associated with this result.
    *);
  stacks: stack list option
    (** An array of 'stack' objects relevant to the result. *);
  suppressions: suppression list option
    (** A set of suppressions relevant to this result. *);
  taxa: reporting_descriptor_reference list option
    (**
      An array of references to taxonomy reporting descriptors that are
      applicable to the result.
    *);
  web_request: web_request option
    (** A web request associated with this result. *);
  web_response: web_response option
    (** A web response associated with this result. *);
  work_item_uris: string list option
    (** The URIs of the work items associated with this result. *)
}
  [@@deriving show,eq,ord]

(**
  Describes a condition relevant to the tool itself, as opposed to being
  relevant to a target being analyzed by the tool.
*)
type notification = Sarif_v_2_1_0_t.notification = {
  associated_rule: reporting_descriptor_reference option
    (**
      A reference used to locate the rule descriptor associated with this
      notification.
    *);
  descriptor: reporting_descriptor_reference option
    (**
      A reference used to locate the descriptor relevant to this
      notification.
    *);
  exception_: exception_ option
    (** The runtime exception, if any, relevant to this notification. *);
  level: notification_level option
    (** A value specifying the severity level of the notification. *);
  locations: location list option
    (** The locations relevant to this notification. *);
  message: message
    (** A message that describes the condition that was encountered. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the
      notification.
    *);
  thread_id: int64 option
    (** The thread identifier of the code that generated the notification. *);
  time_utc: string option
    (**
      The Coordinated Universal Time (UTC) date and time at which the
      analysis tool generated the notification.
    *)
}
  [@@deriving show,eq,ord]

(** The runtime environment of the analysis tool run. *)
type invocation = Sarif_v_2_1_0_t.invocation = {
  account: string option
    (** The account under which the invocation occurred. *);
  arguments: string option
    (**
      An array of strings, containing in order the command line arguments
      passed to the tool from the operating system.
    *);
  command_line: string option
    (** The command line used to invoke the tool. *);
  end_time_utc: string option
    (**
      The Coordinated Universal Time (UTC) date and time at which the
      invocation ended. See "Date/time properties" in the SARIF spec for the
      required format.
    *);
  environment_variables: hm_str_str option
    (**
      The environment variables associated with the analysis tool process,
      expressed as key/value pairs.
    *);
  executable_location: artifact_location option
    (**
      An absolute URI specifying the location of the executable that was
      invoked.
    *);
  execution_successful: bool
    (** Specifies whether the tool's execution completed successfully. *);
  exit_code: int64 option (** The process exit code. *);
  exit_code_description: string option
    (** The reason for the process exit. *);
  exit_signal_name: string option
    (** The name of the signal that caused the process to exit. *);
  exit_signal_number: int64 option
    (** The numeric value of the signal that caused the process to exit. *);
  notification_configuration_overrides: configuration_override list option
    (**
      An array of configurationOverride objects that describe notifications
      related runtime overrides.
    *);
  process_id: int64 option
    (** The id of the process in which the invocation occurred. *);
  process_start_failure_message: string option
    (**
      The reason given by the operating system that the process failed to
      start.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the
      invocation.
    *);
  response_files: artifact_location list option
    (**
      The locations of any response files specified on the tool's command
      line.
    *);
  rule_configuration_overrides: configuration_override list option
    (**
      An array of configurationOverride objects that describe rules related
      runtime overrides.
    *);
  start_time_utc: string option
    (**
      The Coordinated Universal Time (UTC) date and time at which the
      invocation started. See "Date/time properties" in the SARIF spec for
      the required format.
    *);
  stderr: artifact_location option
    (**
      A file containing the standard error stream from the process that was
      invoked.
    *);
  stdin: artifact_location option
    (**
      A file containing the standard input stream to the process that was
      invoked.
    *);
  stdout: artifact_location option
    (**
      A file containing the standard output stream from the process that was
      invoked.
    *);
  stdout_stderr: artifact_location option
    (**
      A file containing the interleaved standard output and standard error
      stream from the process that was invoked.
    *);
  tool_configuration_notifications: notification list option
    (**
      A list of conditions detected by the tool that are relevant to the
      tool's configuration.
    *);
  tool_execution_notifications: notification list option
    (**
      A list of runtime conditions detected by the tool during the analysis.
    *);
  working_directory: artifact_location option
    (** The working directory for the invocation. *)
}
  [@@deriving show,eq,ord]

(**
  Describes how a converter transformed the output of a static analysis tool
  from the analysis tool's native output format into the SARIF format.
*)
type conversion = Sarif_v_2_1_0_t.conversion = {
  analysis_tool_log_files: artifact_location list option
    (** The locations of the analysis tool's per-run log files. *);
  invocation: invocation option
    (**
      An invocation object that describes the invocation of the converter.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the
      conversion.
    *);
  tool: tool (** A tool object that describes the converter. *)
}
  [@@deriving show,eq,ord]

(**
  A single artifact. In some cases, this artifact might be nested within
  another artifact.
*)
type artifact = Sarif_v_2_1_0_t.artifact = {
  contents: artifact_content option (** The contents of the artifact. *);
  description: message option (** A short description of the artifact. *);
  encoding: string option
    (**
      Specifies the encoding for an artifact object that refers to a text
      file.
    *);
  hashes: hm_str_str option
    (**
      A dictionary, each of whose keys is the name of a hash function and
      each of whose values is the hashed value of the artifact produced by
      the specified hash function.
    *);
  last_modified_time_utc: string option
    (**
      The Coordinated Universal Time (UTC) date and time at which the
      artifact was most recently modified. See "Date/time properties" in the
      SARIF spec for the required format.
    *);
  length: int64 (** The length of the artifact in bytes. *);
  location: artifact_location option (** The location of the artifact. *);
  mime_type: artifact_mimetype option
    (** The MIME type (RFC 2045) of the artifact. *);
  offset: int64 option
    (**
      The offset in bytes of the artifact within its containing artifact.
    *);
  parent_index: int64
    (**
      Identifies the index of the immediate parent of the artifact, if this
      artifact is nested.
    *);
  properties: external_properties option
    (**
      Key/value pairs that provide additional information about the artifact.
    *);
  roles: artifact_roles_item list option
    (** The role or roles played by the artifact in the analysis. *);
  source_language: string option
    (**
      Specifies the source language for any artifact object that refers to a
      text file that contains source code.
    *)
}
  [@@deriving show,eq,ord]

(** The top-level element of an external property file. *)
and external_properties = Sarif_v_2_1_0_t.external_properties = {
  addresses: address list option
    (** Addresses that will be merged with a separate run. *);
  artifacts: artifact list option
    (**
      An array of artifact objects that will be merged with a separate run.
    *);
  conversion: conversion option
    (** A conversion object that will be merged with a separate run. *);
  driver: tool_component option
    (** The analysis tool object that will be merged with a separate run. *);
  extensions: tool_component list option
    (** Tool extensions that will be merged with a separate run. *);
  externalized_properties: property_bag option
    (**
      Key/value pairs that provide additional information that will be merged
      with a separate run.
    *);
  graph: graph list option
    (** An array of graph objects that will be merged with a separate run. *);
  guid: external_properties_guid option
    (**
      A stable, unique identifier for this external properties object, in the
      form of a GUID.
    *);
  invocations: invocation option
    (**
      Describes the invocation of the analysis tool that will be merged with
      a separate run.
    *);
  logical_locations: logical_location list option
    (**
      An array of logical locations such as namespaces, types or functions
      that will be merged with a separate run.
    *);
  policies: tool_component list option
    (** Tool policies that will be merged with a separate run. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the external
      properties.
    *);
  results: result option
    (**
      An array of result objects that will be merged with a separate run.
    *);
  run_guid: external_properties_run_guid option
    (**
      A stable, unique identifier for the run associated with this external
      properties object, in the form of a GUID.
    *);
  schema: string option
    (**
      The URI of the JSON schema corresponding to the version of the external
      property file format.
    *);
  taxonomies: tool_component list option
    (** Tool taxonomies that will be merged with a separate run. *);
  thread_flow_locations: thread_flow_location list option
    (**
      An array of threadFlowLocation objects that will be merged with a
      separate run.
    *);
  translations: tool_component list option
    (** Tool translations that will be merged with a separate run. *);
  version: external_properties_version option
    (** The SARIF format version of this external properties object. *);
  web_requests: web_request list option
    (** Requests that will be merged with a separate run. *);
  web_responses: web_response list option
    (** Responses that will be merged with a separate run. *)
}
  [@@deriving show,eq,ord]

(**
  Specifies the information necessary to retrieve a desired revision from a
  version control system.
*)
type version_control_details = Sarif_v_2_1_0_t.version_control_details = {
  as_of_time_utc: string option
    (**
      A Coordinated Universal Time (UTC) date and time that can be used to
      synchronize an enlistment to the state of the repository at that time.
    *);
  branch: string option (** The name of a branch containing the revision. *);
  mapped_to: artifact_location option
    (**
      The location in the local file system to which the root of the
      repository was mapped at the time of the analysis.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the version
      control details.
    *);
  repository_uri: string (** The absolute URI of the repository. *);
  revision_id: string option
    (**
      A string that uniquely and permanently identifies the revision within
      the repository.
    *);
  revision_tag: string option
    (** A tag that has been applied to the revision. *)
}
  [@@deriving show,eq,ord]

(** Defines locations of special significance to SARIF consumers. *)
type special_locations = Sarif_v_2_1_0_t.special_locations = {
  display_base: artifact_location option
    (**
      Provides a suggestion to SARIF consumers to display file paths relative
      to the specified location.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the special
      locations.
    *)
}
  [@@deriving show,eq,ord]

type sarif_version = Sarif_v_2_1_0_t.sarif_version [@@deriving show,eq,ord]

(**
  The language of the messages emitted into the log file during this run
  (expressed as an ISO 639-1 two-letter lowercase culture code) and an
  optional region (expressed as an ISO 3166-1 two-letter uppercase subculture
  code associated with a country or region). The casing is recommended but
  not required (in order for this data to conform to RFC5646).
*)
type run_language = Sarif_v_2_1_0_t.run_language
  [@@deriving show,eq,ord]

(** Specifies the unit in which the tool measures columns. *)
type run_column_kind = Sarif_v_2_1_0_t.run_column_kind
  [@@deriving show,eq,ord]

(**
  The 'guid' property of a previous SARIF 'run' that comprises the baseline
  that was used to compute result 'baselineState' properties for the run.
*)
type run_baseline_guid = Sarif_v_2_1_0_t.run_baseline_guid
  [@@deriving show,eq,ord]

(**
  A stable, unique identifier for this object's containing run object in the
  form of a GUID.
*)
type run_automation_details_guid =
  Sarif_v_2_1_0_t.run_automation_details_guid
  [@@deriving show,eq,ord]

(**
  A stable, unique identifier for the equivalence class of runs to which this
  object's containing run object belongs in the form of a GUID.
*)
type run_automation_details_correlation_guid =
  Sarif_v_2_1_0_t.run_automation_details_correlation_guid
  [@@deriving show,eq,ord]

(**
  Information that describes a run's identity and role within an engineering
  system process.
*)
type run_automation_details = Sarif_v_2_1_0_t.run_automation_details = {
  correlation_guid: run_automation_details_correlation_guid option
    (**
      A stable, unique identifier for the equivalence class of runs to which
      this object's containing run object belongs in the form of a GUID.
    *);
  description: message option
    (**
      A description of the identity and role played within the engineering
      system by this object's containing run object.
    *);
  guid: run_automation_details_guid option
    (**
      A stable, unique identifier for this object's containing run object in
      the form of a GUID.
    *);
  id: string option
    (**
      A hierarchical string that uniquely identifies this object's containing
      run object.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the run
      automation details.
    *)
}
  [@@deriving show,eq,ord]

type hm_str_al = Sarif_v_2_1_0_t.hm_str_al [@@deriving show,eq,ord]

(**
  A stable, unique identifier for the external property file in the form of a
  GUID.
*)
type external_property_file_reference_guid =
  Sarif_v_2_1_0_t.external_property_file_reference_guid
  [@@deriving show,eq,ord]

(**
  Contains information that enables a SARIF consumer to locate the external
  property file that contains the value of an externalized property
  associated with the run.
*)
type external_property_file_reference =
  Sarif_v_2_1_0_t.external_property_file_reference = {
  guid: external_property_file_reference_guid option
    (**
      A stable, unique identifier for the external property file in the form
      of a GUID.
    *);
  item_count: int64
    (**
      A non-negative integer specifying the number of items contained in the
      external property file.
    *);
  location: artifact_location option
    (** The location of the external property file. *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the external
      property file.
    *)
}
  [@@deriving show,eq,ord]

(**
  References to external property files that should be inlined with the
  content of a root log file.
*)
type external_property_file_references =
  Sarif_v_2_1_0_t.external_property_file_references = {
  addresses: external_property_file_reference list option
    (**
      An array of external property files containing run.addresses arrays to
      be merged with the root log file.
    *);
  artifacts: external_property_file_reference list option
    (**
      An array of external property files containing run.artifacts arrays to
      be merged with the root log file.
    *);
  conversion: external_property_file_reference option
    (**
      An external property file containing a run.conversion object to be
      merged with the root log file.
    *);
  driver: external_property_file_reference option
    (**
      An external property file containing a run.driver object to be merged
      with the root log file.
    *);
  extensions: external_property_file_reference list option
    (**
      An array of external property files containing run.extensions arrays to
      be merged with the root log file.
    *);
  externalized_properties: external_property_file_reference option
    (**
      An external property file containing a run.properties object to be
      merged with the root log file.
    *);
  graphs: external_property_file_reference list option
    (**
      An array of external property files containing a run.graphs object to
      be merged with the root log file.
    *);
  invocations: external_property_file_reference list option
    (**
      An array of external property files containing run.invocations arrays
      to be merged with the root log file.
    *);
  logical_locations: external_property_file_reference list option
    (**
      An array of external property files containing run.logicalLocations
      arrays to be merged with the root log file.
    *);
  policies: external_property_file_reference list option
    (**
      An array of external property files containing run.policies arrays to
      be merged with the root log file.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the external
      property files.
    *);
  results: external_property_file_reference list option
    (**
      An array of external property files containing run.results arrays to be
      merged with the root log file.
    *);
  taxonomies: external_property_file_reference list option
    (**
      An array of external property files containing run.taxonomies arrays to
      be merged with the root log file.
    *);
  thread_flow_locations: external_property_file_reference list option
    (**
      An array of external property files containing run.threadFlowLocations
      arrays to be merged with the root log file.
    *);
  translations: external_property_file_reference list option
    (**
      An array of external property files containing run.translations arrays
      to be merged with the root log file.
    *);
  web_requests: external_property_file_reference list option
    (**
      An array of external property files containing run.requests arrays to
      be merged with the root log file.
    *);
  web_responses: external_property_file_reference list option
    (**
      An array of external property files containing run.responses arrays to
      be merged with the root log file.
    *)
}
  [@@deriving show,eq,ord]

(**
  Describes a single run of an analysis tool, and contains the reported
  output of that run.
*)
type run = Sarif_v_2_1_0_t.run = {
  addresses: address list option
    (** Addresses associated with this run instance, if any. *);
  artifacts: artifact list option
    (** An array of artifact objects relevant to the run. *);
  automation_details: run_automation_details option
    (** Automation details that describe this run. *);
  baseline_guid: run_baseline_guid option
    (**
      The 'guid' property of a previous SARIF 'run' that comprises the
      baseline that was used to compute result 'baselineState' properties for
      the run.
    *);
  column_kind: run_column_kind option
    (** Specifies the unit in which the tool measures columns. *);
  conversion: conversion option
    (**
      A conversion object that describes how a converter transformed an
      analysis tool's native reporting format into the SARIF format.
    *);
  default_encoding: string option
    (**
      Specifies the default encoding for any artifact object that refers to a
      text file.
    *);
  default_source_language: string option
    (**
      Specifies the default source language for any artifact object that
      refers to a text file that contains source code.
    *);
  external_property_file_references: external_property_file_references option
    (**
      References to external property files that should be inlined with the
      content of a root log file.
    *);
  graphs: graph list option
    (**
      An array of zero or more unique graph objects associated with the run.
    *);
  invocations: invocation list option
    (** Describes the invocation of the analysis tool. *);
  language: run_language option
    (**
      The language of the messages emitted into the log file during this run
      (expressed as an ISO 639-1 two-letter lowercase culture code) and an
      optional region (expressed as an ISO 3166-1 two-letter uppercase
      subculture code associated with a country or region). The casing is
      recommended but not required (in order for this data to conform to
      RFC5646).
    *);
  logical_locations: logical_location list option
    (**
      An array of logical locations such as namespaces, types or functions.
    *);
  newline_sequences: string list
    (**
      An ordered list of character sequences that were treated as line breaks
      when computing region information for the run.
    *);
  original_uri_base_ids: hm_str_al option
    (**
      The artifact location specified by each uriBaseId symbol on the machine
      where the tool originally ran.
    *);
  policies: tool_component list option
    (**
      Contains configurations that may potentially override both
      reportingDescriptor.defaultConfiguration (the tool's default
      severities) and invocation.configurationOverrides (severities
      established at run-time from the command line).
    *);
  properties: property_bag option
    (** Key/value pairs that provide additional information about the run. *);
  redaction_tokens: string list option
    (**
      An array of strings used to replace sensitive information in a
      redaction-aware property.
    *);
  results: result list option
    (**
      The set of results contained in an SARIF log. The results array can be
      omitted when a run is solely exporting rules metadata. It must be
      present (but may be empty) if a log file represents an actual scan.
    *);
  run_aggregates: run_automation_details list option
    (**
      Automation details that describe the aggregate of runs to which this
      run belongs.
    *);
  special_locations: special_locations option
    (**
      A specialLocations object that defines locations of special
      significance to SARIF consumers.
    *);
  taxonomies: tool_component list option
    (**
      An array of toolComponent objects relevant to a taxonomy in which
      results are categorized.
    *);
  thread_flow_locations: thread_flow_location list option
    (** An array of threadFlowLocation objects cached at run level. *);
  tool: tool
    (**
      Information about the tool or tool pipeline that generated the results
      in this run. A run can only contain results produced by a single tool
      or tool pipeline. A run can aggregate results from multiple log files,
      as long as context around the tool run (tool command-line arguments and
      the like) is identical for all aggregated files.
    *);
  translations: tool_component list option
    (**
      Specifies the revision in version control of the artifacts that were
      scanned.
    *);
  version_control_provenance: version_control_details list option
    (**
      Specifies the revision in version control of the artifacts that were
      scanned.
    *);
  web_requests: web_request list option
    (** An array of request objects cached at run level. *);
  web_responses: web_response list option
    (** An array of response objects cached at run level. *)
}
  [@@deriving show,eq,ord]

(**
  Core type: Static Analysis Results Format (SARIF) Version 2.1.0 JSON
  Schema: a standard format for the output of static analysis tools.
*)
type sarif_json_schema = Sarif_v_2_1_0_t.sarif_json_schema = {
  version: sarif_version (** The SARIF format version of this log file. *);
  inline_external_properties: external_properties list option
    (**
      References to external property files that share data between runs.
    *);
  properties: property_bag option
    (**
      Key/value pairs that provide additional information about the log file.
    *);
  runs: run list (** The set of runs contained in this log file. *);
  schema: string option
    (** The URI of the JSON schema corresponding to the version. *)
}
  [@@deriving show,eq,ord]

val write_artifact_mimetype :
  Buffer.t -> artifact_mimetype -> unit
  (** Output a JSON value of type {!type:artifact_mimetype}. *)

val string_of_artifact_mimetype :
  ?len:int -> artifact_mimetype -> string
  (** Serialize a value of type {!type:artifact_mimetype}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_artifact_mimetype :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> artifact_mimetype
  (** Input JSON data of type {!type:artifact_mimetype}. *)

val artifact_mimetype_of_string :
  string -> artifact_mimetype
  (** Deserialize JSON data of type {!type:artifact_mimetype}. *)

val write_artifact_roles_item :
  Buffer.t -> artifact_roles_item -> unit
  (** Output a JSON value of type {!type:artifact_roles_item}. *)

val string_of_artifact_roles_item :
  ?len:int -> artifact_roles_item -> string
  (** Serialize a value of type {!type:artifact_roles_item}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_artifact_roles_item :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> artifact_roles_item
  (** Input JSON data of type {!type:artifact_roles_item}. *)

val artifact_roles_item_of_string :
  string -> artifact_roles_item
  (** Deserialize JSON data of type {!type:artifact_roles_item}. *)

val write_external_properties_guid :
  Buffer.t -> external_properties_guid -> unit
  (** Output a JSON value of type {!type:external_properties_guid}. *)

val string_of_external_properties_guid :
  ?len:int -> external_properties_guid -> string
  (** Serialize a value of type {!type:external_properties_guid}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_external_properties_guid :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> external_properties_guid
  (** Input JSON data of type {!type:external_properties_guid}. *)

val external_properties_guid_of_string :
  string -> external_properties_guid
  (** Deserialize JSON data of type {!type:external_properties_guid}. *)

val write_external_properties_run_guid :
  Buffer.t -> external_properties_run_guid -> unit
  (** Output a JSON value of type {!type:external_properties_run_guid}. *)

val string_of_external_properties_run_guid :
  ?len:int -> external_properties_run_guid -> string
  (** Serialize a value of type {!type:external_properties_run_guid}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_external_properties_run_guid :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> external_properties_run_guid
  (** Input JSON data of type {!type:external_properties_run_guid}. *)

val external_properties_run_guid_of_string :
  string -> external_properties_run_guid
  (** Deserialize JSON data of type {!type:external_properties_run_guid}. *)

val write_external_properties_version :
  Buffer.t -> external_properties_version -> unit
  (** Output a JSON value of type {!type:external_properties_version}. *)

val string_of_external_properties_version :
  ?len:int -> external_properties_version -> string
  (** Serialize a value of type {!type:external_properties_version}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_external_properties_version :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> external_properties_version
  (** Input JSON data of type {!type:external_properties_version}. *)

val external_properties_version_of_string :
  string -> external_properties_version
  (** Deserialize JSON data of type {!type:external_properties_version}. *)

val write_hm_str_str :
  Buffer.t -> hm_str_str -> unit
  (** Output a JSON value of type {!type:hm_str_str}. *)

val string_of_hm_str_str :
  ?len:int -> hm_str_str -> string
  (** Serialize a value of type {!type:hm_str_str}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_hm_str_str :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> hm_str_str
  (** Input JSON data of type {!type:hm_str_str}. *)

val hm_str_str_of_string :
  string -> hm_str_str
  (** Deserialize JSON data of type {!type:hm_str_str}. *)

val write_int64 :
  Buffer.t -> int64 -> unit
  (** Output a JSON value of type {!type:int64}. *)

val string_of_int64 :
  ?len:int -> int64 -> string
  (** Serialize a value of type {!type:int64}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_int64 :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> int64
  (** Input JSON data of type {!type:int64}. *)

val int64_of_string :
  string -> int64
  (** Deserialize JSON data of type {!type:int64}. *)

val write_notification_level :
  Buffer.t -> notification_level -> unit
  (** Output a JSON value of type {!type:notification_level}. *)

val string_of_notification_level :
  ?len:int -> notification_level -> string
  (** Serialize a value of type {!type:notification_level}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_notification_level :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> notification_level
  (** Input JSON data of type {!type:notification_level}. *)

val notification_level_of_string :
  string -> notification_level
  (** Deserialize JSON data of type {!type:notification_level}. *)

val write_property_bag :
  Buffer.t -> property_bag -> unit
  (** Output a JSON value of type {!type:property_bag}. *)

val string_of_property_bag :
  ?len:int -> property_bag -> string
  (** Serialize a value of type {!type:property_bag}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_property_bag :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> property_bag
  (** Input JSON data of type {!type:property_bag}. *)

val property_bag_of_string :
  string -> property_bag
  (** Deserialize JSON data of type {!type:property_bag}. *)

val write_address :
  Buffer.t -> address -> unit
  (** Output a JSON value of type {!type:address}. *)

val string_of_address :
  ?len:int -> address -> string
  (** Serialize a value of type {!type:address}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_address :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> address
  (** Input JSON data of type {!type:address}. *)

val address_of_string :
  string -> address
  (** Deserialize JSON data of type {!type:address}. *)

val write_logical_location :
  Buffer.t -> logical_location -> unit
  (** Output a JSON value of type {!type:logical_location}. *)

val string_of_logical_location :
  ?len:int -> logical_location -> string
  (** Serialize a value of type {!type:logical_location}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_logical_location :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> logical_location
  (** Input JSON data of type {!type:logical_location}. *)

val logical_location_of_string :
  string -> logical_location
  (** Deserialize JSON data of type {!type:logical_location}. *)

val write_message :
  Buffer.t -> message -> unit
  (** Output a JSON value of type {!type:message}. *)

val string_of_message :
  ?len:int -> message -> string
  (** Serialize a value of type {!type:message}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_message :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> message
  (** Input JSON data of type {!type:message}. *)

val message_of_string :
  string -> message
  (** Deserialize JSON data of type {!type:message}. *)

val write_artifact_location :
  Buffer.t -> artifact_location -> unit
  (** Output a JSON value of type {!type:artifact_location}. *)

val string_of_artifact_location :
  ?len:int -> artifact_location -> string
  (** Serialize a value of type {!type:artifact_location}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_artifact_location :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> artifact_location
  (** Input JSON data of type {!type:artifact_location}. *)

val artifact_location_of_string :
  string -> artifact_location
  (** Deserialize JSON data of type {!type:artifact_location}. *)

val write_edge :
  Buffer.t -> edge -> unit
  (** Output a JSON value of type {!type:edge}. *)

val string_of_edge :
  ?len:int -> edge -> string
  (** Serialize a value of type {!type:edge}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_edge :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> edge
  (** Input JSON data of type {!type:edge}. *)

val edge_of_string :
  string -> edge
  (** Deserialize JSON data of type {!type:edge}. *)

val write_location_relationship :
  Buffer.t -> location_relationship -> unit
  (** Output a JSON value of type {!type:location_relationship}. *)

val string_of_location_relationship :
  ?len:int -> location_relationship -> string
  (** Serialize a value of type {!type:location_relationship}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_location_relationship :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> location_relationship
  (** Input JSON data of type {!type:location_relationship}. *)

val location_relationship_of_string :
  string -> location_relationship
  (** Deserialize JSON data of type {!type:location_relationship}. *)

val write_multiformat_message_string :
  Buffer.t -> multiformat_message_string -> unit
  (** Output a JSON value of type {!type:multiformat_message_string}. *)

val string_of_multiformat_message_string :
  ?len:int -> multiformat_message_string -> string
  (** Serialize a value of type {!type:multiformat_message_string}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_multiformat_message_string :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> multiformat_message_string
  (** Input JSON data of type {!type:multiformat_message_string}. *)

val multiformat_message_string_of_string :
  string -> multiformat_message_string
  (** Deserialize JSON data of type {!type:multiformat_message_string}. *)

val write_artifact_content :
  Buffer.t -> artifact_content -> unit
  (** Output a JSON value of type {!type:artifact_content}. *)

val string_of_artifact_content :
  ?len:int -> artifact_content -> string
  (** Serialize a value of type {!type:artifact_content}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_artifact_content :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> artifact_content
  (** Input JSON data of type {!type:artifact_content}. *)

val artifact_content_of_string :
  string -> artifact_content
  (** Deserialize JSON data of type {!type:artifact_content}. *)

val write_hm_str_mms :
  Buffer.t -> hm_str_mms -> unit
  (** Output a JSON value of type {!type:hm_str_mms}. *)

val string_of_hm_str_mms :
  ?len:int -> hm_str_mms -> string
  (** Serialize a value of type {!type:hm_str_mms}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_hm_str_mms :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> hm_str_mms
  (** Input JSON data of type {!type:hm_str_mms}. *)

val hm_str_mms_of_string :
  string -> hm_str_mms
  (** Deserialize JSON data of type {!type:hm_str_mms}. *)

val write_edge_traversal :
  Buffer.t -> edge_traversal -> unit
  (** Output a JSON value of type {!type:edge_traversal}. *)

val string_of_edge_traversal :
  ?len:int -> edge_traversal -> string
  (** Serialize a value of type {!type:edge_traversal}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_edge_traversal :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> edge_traversal
  (** Input JSON data of type {!type:edge_traversal}. *)

val edge_traversal_of_string :
  string -> edge_traversal
  (** Deserialize JSON data of type {!type:edge_traversal}. *)

val write_graph_traversal_variant0 :
  Buffer.t -> graph_traversal_variant0 -> unit
  (** Output a JSON value of type {!type:graph_traversal_variant0}. *)

val string_of_graph_traversal_variant0 :
  ?len:int -> graph_traversal_variant0 -> string
  (** Serialize a value of type {!type:graph_traversal_variant0}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_graph_traversal_variant0 :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> graph_traversal_variant0
  (** Input JSON data of type {!type:graph_traversal_variant0}. *)

val graph_traversal_variant0_of_string :
  string -> graph_traversal_variant0
  (** Deserialize JSON data of type {!type:graph_traversal_variant0}. *)

val write_graph_traversal_variant1 :
  Buffer.t -> graph_traversal_variant1 -> unit
  (** Output a JSON value of type {!type:graph_traversal_variant1}. *)

val string_of_graph_traversal_variant1 :
  ?len:int -> graph_traversal_variant1 -> string
  (** Serialize a value of type {!type:graph_traversal_variant1}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_graph_traversal_variant1 :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> graph_traversal_variant1
  (** Input JSON data of type {!type:graph_traversal_variant1}. *)

val graph_traversal_variant1_of_string :
  string -> graph_traversal_variant1
  (** Deserialize JSON data of type {!type:graph_traversal_variant1}. *)

val write_graph_traversal :
  Buffer.t -> graph_traversal -> unit
  (** Output a JSON value of type {!type:graph_traversal}. *)

val string_of_graph_traversal :
  ?len:int -> graph_traversal -> string
  (** Serialize a value of type {!type:graph_traversal}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_graph_traversal :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> graph_traversal
  (** Input JSON data of type {!type:graph_traversal}. *)

val graph_traversal_of_string :
  string -> graph_traversal
  (** Deserialize JSON data of type {!type:graph_traversal}. *)

val write_rectangle :
  Buffer.t -> rectangle -> unit
  (** Output a JSON value of type {!type:rectangle}. *)

val string_of_rectangle :
  ?len:int -> rectangle -> string
  (** Serialize a value of type {!type:rectangle}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_rectangle :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> rectangle
  (** Input JSON data of type {!type:rectangle}. *)

val rectangle_of_string :
  string -> rectangle
  (** Deserialize JSON data of type {!type:rectangle}. *)

val write_region :
  Buffer.t -> region -> unit
  (** Output a JSON value of type {!type:region}. *)

val string_of_region :
  ?len:int -> region -> string
  (** Serialize a value of type {!type:region}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_region :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> region
  (** Input JSON data of type {!type:region}. *)

val region_of_string :
  string -> region
  (** Deserialize JSON data of type {!type:region}. *)

val write_attachment :
  Buffer.t -> attachment -> unit
  (** Output a JSON value of type {!type:attachment}. *)

val string_of_attachment :
  ?len:int -> attachment -> string
  (** Serialize a value of type {!type:attachment}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_attachment :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> attachment
  (** Input JSON data of type {!type:attachment}. *)

val attachment_of_string :
  string -> attachment
  (** Deserialize JSON data of type {!type:attachment}. *)

val write_physical_location :
  Buffer.t -> physical_location -> unit
  (** Output a JSON value of type {!type:physical_location}. *)

val string_of_physical_location :
  ?len:int -> physical_location -> string
  (** Serialize a value of type {!type:physical_location}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_physical_location :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> physical_location
  (** Input JSON data of type {!type:physical_location}. *)

val physical_location_of_string :
  string -> physical_location
  (** Deserialize JSON data of type {!type:physical_location}. *)

val write_location :
  Buffer.t -> location -> unit
  (** Output a JSON value of type {!type:location}. *)

val string_of_location :
  ?len:int -> location -> string
  (** Serialize a value of type {!type:location}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_location :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> location
  (** Input JSON data of type {!type:location}. *)

val location_of_string :
  string -> location
  (** Deserialize JSON data of type {!type:location}. *)

val write_replacement :
  Buffer.t -> replacement -> unit
  (** Output a JSON value of type {!type:replacement}. *)

val string_of_replacement :
  ?len:int -> replacement -> string
  (** Serialize a value of type {!type:replacement}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_replacement :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> replacement
  (** Input JSON data of type {!type:replacement}. *)

val replacement_of_string :
  string -> replacement
  (** Deserialize JSON data of type {!type:replacement}. *)

val write_artifact_change :
  Buffer.t -> artifact_change -> unit
  (** Output a JSON value of type {!type:artifact_change}. *)

val string_of_artifact_change :
  ?len:int -> artifact_change -> string
  (** Serialize a value of type {!type:artifact_change}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_artifact_change :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> artifact_change
  (** Input JSON data of type {!type:artifact_change}. *)

val artifact_change_of_string :
  string -> artifact_change
  (** Deserialize JSON data of type {!type:artifact_change}. *)

val write_fix :
  Buffer.t -> fix -> unit
  (** Output a JSON value of type {!type:fix}. *)

val string_of_fix :
  ?len:int -> fix -> string
  (** Serialize a value of type {!type:fix}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_fix :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> fix
  (** Input JSON data of type {!type:fix}. *)

val fix_of_string :
  string -> fix
  (** Deserialize JSON data of type {!type:fix}. *)

val write_reporting_configuration_level :
  Buffer.t -> reporting_configuration_level -> unit
  (** Output a JSON value of type {!type:reporting_configuration_level}. *)

val string_of_reporting_configuration_level :
  ?len:int -> reporting_configuration_level -> string
  (** Serialize a value of type {!type:reporting_configuration_level}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_reporting_configuration_level :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> reporting_configuration_level
  (** Input JSON data of type {!type:reporting_configuration_level}. *)

val reporting_configuration_level_of_string :
  string -> reporting_configuration_level
  (** Deserialize JSON data of type {!type:reporting_configuration_level}. *)

val write_reporting_configuration :
  Buffer.t -> reporting_configuration -> unit
  (** Output a JSON value of type {!type:reporting_configuration}. *)

val string_of_reporting_configuration :
  ?len:int -> reporting_configuration -> string
  (** Serialize a value of type {!type:reporting_configuration}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_reporting_configuration :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> reporting_configuration
  (** Input JSON data of type {!type:reporting_configuration}. *)

val reporting_configuration_of_string :
  string -> reporting_configuration
  (** Deserialize JSON data of type {!type:reporting_configuration}. *)

val write_reporting_descriptor_deprecated_guids_item :
  Buffer.t -> reporting_descriptor_deprecated_guids_item -> unit
  (** Output a JSON value of type {!type:reporting_descriptor_deprecated_guids_item}. *)

val string_of_reporting_descriptor_deprecated_guids_item :
  ?len:int -> reporting_descriptor_deprecated_guids_item -> string
  (** Serialize a value of type {!type:reporting_descriptor_deprecated_guids_item}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_reporting_descriptor_deprecated_guids_item :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> reporting_descriptor_deprecated_guids_item
  (** Input JSON data of type {!type:reporting_descriptor_deprecated_guids_item}. *)

val reporting_descriptor_deprecated_guids_item_of_string :
  string -> reporting_descriptor_deprecated_guids_item
  (** Deserialize JSON data of type {!type:reporting_descriptor_deprecated_guids_item}. *)

val write_reporting_descriptor_guid :
  Buffer.t -> reporting_descriptor_guid -> unit
  (** Output a JSON value of type {!type:reporting_descriptor_guid}. *)

val string_of_reporting_descriptor_guid :
  ?len:int -> reporting_descriptor_guid -> string
  (** Serialize a value of type {!type:reporting_descriptor_guid}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_reporting_descriptor_guid :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> reporting_descriptor_guid
  (** Input JSON data of type {!type:reporting_descriptor_guid}. *)

val reporting_descriptor_guid_of_string :
  string -> reporting_descriptor_guid
  (** Deserialize JSON data of type {!type:reporting_descriptor_guid}. *)

val write_reporting_descriptor_reference_guid :
  Buffer.t -> reporting_descriptor_reference_guid -> unit
  (** Output a JSON value of type {!type:reporting_descriptor_reference_guid}. *)

val string_of_reporting_descriptor_reference_guid :
  ?len:int -> reporting_descriptor_reference_guid -> string
  (** Serialize a value of type {!type:reporting_descriptor_reference_guid}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_reporting_descriptor_reference_guid :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> reporting_descriptor_reference_guid
  (** Input JSON data of type {!type:reporting_descriptor_reference_guid}. *)

val reporting_descriptor_reference_guid_of_string :
  string -> reporting_descriptor_reference_guid
  (** Deserialize JSON data of type {!type:reporting_descriptor_reference_guid}. *)

val write_result_baseline_state :
  Buffer.t -> result_baseline_state -> unit
  (** Output a JSON value of type {!type:result_baseline_state}. *)

val string_of_result_baseline_state :
  ?len:int -> result_baseline_state -> string
  (** Serialize a value of type {!type:result_baseline_state}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_result_baseline_state :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> result_baseline_state
  (** Input JSON data of type {!type:result_baseline_state}. *)

val result_baseline_state_of_string :
  string -> result_baseline_state
  (** Deserialize JSON data of type {!type:result_baseline_state}. *)

val write_result_correlation_guid :
  Buffer.t -> result_correlation_guid -> unit
  (** Output a JSON value of type {!type:result_correlation_guid}. *)

val string_of_result_correlation_guid :
  ?len:int -> result_correlation_guid -> string
  (** Serialize a value of type {!type:result_correlation_guid}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_result_correlation_guid :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> result_correlation_guid
  (** Input JSON data of type {!type:result_correlation_guid}. *)

val result_correlation_guid_of_string :
  string -> result_correlation_guid
  (** Deserialize JSON data of type {!type:result_correlation_guid}. *)

val write_result_guid :
  Buffer.t -> result_guid -> unit
  (** Output a JSON value of type {!type:result_guid}. *)

val string_of_result_guid :
  ?len:int -> result_guid -> string
  (** Serialize a value of type {!type:result_guid}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_result_guid :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> result_guid
  (** Input JSON data of type {!type:result_guid}. *)

val result_guid_of_string :
  string -> result_guid
  (** Deserialize JSON data of type {!type:result_guid}. *)

val write_result_kind :
  Buffer.t -> result_kind -> unit
  (** Output a JSON value of type {!type:result_kind}. *)

val string_of_result_kind :
  ?len:int -> result_kind -> string
  (** Serialize a value of type {!type:result_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_result_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> result_kind
  (** Input JSON data of type {!type:result_kind}. *)

val result_kind_of_string :
  string -> result_kind
  (** Deserialize JSON data of type {!type:result_kind}. *)

val write_result_level :
  Buffer.t -> result_level -> unit
  (** Output a JSON value of type {!type:result_level}. *)

val string_of_result_level :
  ?len:int -> result_level -> string
  (** Serialize a value of type {!type:result_level}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_result_level :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> result_level
  (** Input JSON data of type {!type:result_level}. *)

val result_level_of_string :
  string -> result_level
  (** Deserialize JSON data of type {!type:result_level}. *)

val write_result_provenance_first_detection_run_guid :
  Buffer.t -> result_provenance_first_detection_run_guid -> unit
  (** Output a JSON value of type {!type:result_provenance_first_detection_run_guid}. *)

val string_of_result_provenance_first_detection_run_guid :
  ?len:int -> result_provenance_first_detection_run_guid -> string
  (** Serialize a value of type {!type:result_provenance_first_detection_run_guid}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_result_provenance_first_detection_run_guid :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> result_provenance_first_detection_run_guid
  (** Input JSON data of type {!type:result_provenance_first_detection_run_guid}. *)

val result_provenance_first_detection_run_guid_of_string :
  string -> result_provenance_first_detection_run_guid
  (** Deserialize JSON data of type {!type:result_provenance_first_detection_run_guid}. *)

val write_result_provenance_last_detection_run_guid :
  Buffer.t -> result_provenance_last_detection_run_guid -> unit
  (** Output a JSON value of type {!type:result_provenance_last_detection_run_guid}. *)

val string_of_result_provenance_last_detection_run_guid :
  ?len:int -> result_provenance_last_detection_run_guid -> string
  (** Serialize a value of type {!type:result_provenance_last_detection_run_guid}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_result_provenance_last_detection_run_guid :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> result_provenance_last_detection_run_guid
  (** Input JSON data of type {!type:result_provenance_last_detection_run_guid}. *)

val result_provenance_last_detection_run_guid_of_string :
  string -> result_provenance_last_detection_run_guid
  (** Deserialize JSON data of type {!type:result_provenance_last_detection_run_guid}. *)

val write_result_provenance :
  Buffer.t -> result_provenance -> unit
  (** Output a JSON value of type {!type:result_provenance}. *)

val string_of_result_provenance :
  ?len:int -> result_provenance -> string
  (** Serialize a value of type {!type:result_provenance}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_result_provenance :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> result_provenance
  (** Input JSON data of type {!type:result_provenance}. *)

val result_provenance_of_string :
  string -> result_provenance
  (** Deserialize JSON data of type {!type:result_provenance}. *)

val write_stack_frame :
  Buffer.t -> stack_frame -> unit
  (** Output a JSON value of type {!type:stack_frame}. *)

val string_of_stack_frame :
  ?len:int -> stack_frame -> string
  (** Serialize a value of type {!type:stack_frame}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_stack_frame :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> stack_frame
  (** Input JSON data of type {!type:stack_frame}. *)

val stack_frame_of_string :
  string -> stack_frame
  (** Deserialize JSON data of type {!type:stack_frame}. *)

val write_stack :
  Buffer.t -> stack -> unit
  (** Output a JSON value of type {!type:stack}. *)

val string_of_stack :
  ?len:int -> stack -> string
  (** Serialize a value of type {!type:stack}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_stack :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> stack
  (** Input JSON data of type {!type:stack}. *)

val stack_of_string :
  string -> stack
  (** Deserialize JSON data of type {!type:stack}. *)

val write_suppression_guid :
  Buffer.t -> suppression_guid -> unit
  (** Output a JSON value of type {!type:suppression_guid}. *)

val string_of_suppression_guid :
  ?len:int -> suppression_guid -> string
  (** Serialize a value of type {!type:suppression_guid}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_suppression_guid :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> suppression_guid
  (** Input JSON data of type {!type:suppression_guid}. *)

val suppression_guid_of_string :
  string -> suppression_guid
  (** Deserialize JSON data of type {!type:suppression_guid}. *)

val write_suppression_kind :
  Buffer.t -> suppression_kind -> unit
  (** Output a JSON value of type {!type:suppression_kind}. *)

val string_of_suppression_kind :
  ?len:int -> suppression_kind -> string
  (** Serialize a value of type {!type:suppression_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_suppression_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> suppression_kind
  (** Input JSON data of type {!type:suppression_kind}. *)

val suppression_kind_of_string :
  string -> suppression_kind
  (** Deserialize JSON data of type {!type:suppression_kind}. *)

val write_suppression_status :
  Buffer.t -> suppression_status -> unit
  (** Output a JSON value of type {!type:suppression_status}. *)

val string_of_suppression_status :
  ?len:int -> suppression_status -> string
  (** Serialize a value of type {!type:suppression_status}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_suppression_status :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> suppression_status
  (** Input JSON data of type {!type:suppression_status}. *)

val suppression_status_of_string :
  string -> suppression_status
  (** Deserialize JSON data of type {!type:suppression_status}. *)

val write_suppression :
  Buffer.t -> suppression -> unit
  (** Output a JSON value of type {!type:suppression}. *)

val string_of_suppression :
  ?len:int -> suppression -> string
  (** Serialize a value of type {!type:suppression}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_suppression :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> suppression
  (** Input JSON data of type {!type:suppression}. *)

val suppression_of_string :
  string -> suppression
  (** Deserialize JSON data of type {!type:suppression}. *)

val write_thread_flow_location_importance :
  Buffer.t -> thread_flow_location_importance -> unit
  (** Output a JSON value of type {!type:thread_flow_location_importance}. *)

val string_of_thread_flow_location_importance :
  ?len:int -> thread_flow_location_importance -> string
  (** Serialize a value of type {!type:thread_flow_location_importance}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_thread_flow_location_importance :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> thread_flow_location_importance
  (** Input JSON data of type {!type:thread_flow_location_importance}. *)

val thread_flow_location_importance_of_string :
  string -> thread_flow_location_importance
  (** Deserialize JSON data of type {!type:thread_flow_location_importance}. *)

val write_tool_component_contents_item :
  Buffer.t -> tool_component_contents_item -> unit
  (** Output a JSON value of type {!type:tool_component_contents_item}. *)

val string_of_tool_component_contents_item :
  ?len:int -> tool_component_contents_item -> string
  (** Serialize a value of type {!type:tool_component_contents_item}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_tool_component_contents_item :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> tool_component_contents_item
  (** Input JSON data of type {!type:tool_component_contents_item}. *)

val tool_component_contents_item_of_string :
  string -> tool_component_contents_item
  (** Deserialize JSON data of type {!type:tool_component_contents_item}. *)

val write_tool_component_dotted_quad_file_version :
  Buffer.t -> tool_component_dotted_quad_file_version -> unit
  (** Output a JSON value of type {!type:tool_component_dotted_quad_file_version}. *)

val string_of_tool_component_dotted_quad_file_version :
  ?len:int -> tool_component_dotted_quad_file_version -> string
  (** Serialize a value of type {!type:tool_component_dotted_quad_file_version}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_tool_component_dotted_quad_file_version :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> tool_component_dotted_quad_file_version
  (** Input JSON data of type {!type:tool_component_dotted_quad_file_version}. *)

val tool_component_dotted_quad_file_version_of_string :
  string -> tool_component_dotted_quad_file_version
  (** Deserialize JSON data of type {!type:tool_component_dotted_quad_file_version}. *)

val write_tool_component_guid :
  Buffer.t -> tool_component_guid -> unit
  (** Output a JSON value of type {!type:tool_component_guid}. *)

val string_of_tool_component_guid :
  ?len:int -> tool_component_guid -> string
  (** Serialize a value of type {!type:tool_component_guid}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_tool_component_guid :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> tool_component_guid
  (** Input JSON data of type {!type:tool_component_guid}. *)

val tool_component_guid_of_string :
  string -> tool_component_guid
  (** Deserialize JSON data of type {!type:tool_component_guid}. *)

val write_tool_component_language :
  Buffer.t -> tool_component_language -> unit
  (** Output a JSON value of type {!type:tool_component_language}. *)

val string_of_tool_component_language :
  ?len:int -> tool_component_language -> string
  (** Serialize a value of type {!type:tool_component_language}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_tool_component_language :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> tool_component_language
  (** Input JSON data of type {!type:tool_component_language}. *)

val tool_component_language_of_string :
  string -> tool_component_language
  (** Deserialize JSON data of type {!type:tool_component_language}. *)

val write_tool_component_reference_guid :
  Buffer.t -> tool_component_reference_guid -> unit
  (** Output a JSON value of type {!type:tool_component_reference_guid}. *)

val string_of_tool_component_reference_guid :
  ?len:int -> tool_component_reference_guid -> string
  (** Serialize a value of type {!type:tool_component_reference_guid}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_tool_component_reference_guid :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> tool_component_reference_guid
  (** Input JSON data of type {!type:tool_component_reference_guid}. *)

val tool_component_reference_guid_of_string :
  string -> tool_component_reference_guid
  (** Deserialize JSON data of type {!type:tool_component_reference_guid}. *)

val write_tool_component_reference :
  Buffer.t -> tool_component_reference -> unit
  (** Output a JSON value of type {!type:tool_component_reference}. *)

val string_of_tool_component_reference :
  ?len:int -> tool_component_reference -> string
  (** Serialize a value of type {!type:tool_component_reference}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_tool_component_reference :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> tool_component_reference
  (** Input JSON data of type {!type:tool_component_reference}. *)

val tool_component_reference_of_string :
  string -> tool_component_reference
  (** Deserialize JSON data of type {!type:tool_component_reference}. *)

val write_reporting_descriptor_reference :
  Buffer.t -> reporting_descriptor_reference -> unit
  (** Output a JSON value of type {!type:reporting_descriptor_reference}. *)

val string_of_reporting_descriptor_reference :
  ?len:int -> reporting_descriptor_reference -> string
  (** Serialize a value of type {!type:reporting_descriptor_reference}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_reporting_descriptor_reference :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> reporting_descriptor_reference
  (** Input JSON data of type {!type:reporting_descriptor_reference}. *)

val reporting_descriptor_reference_of_string :
  string -> reporting_descriptor_reference
  (** Deserialize JSON data of type {!type:reporting_descriptor_reference}. *)

val write_configuration_override :
  Buffer.t -> configuration_override -> unit
  (** Output a JSON value of type {!type:configuration_override}. *)

val string_of_configuration_override :
  ?len:int -> configuration_override -> string
  (** Serialize a value of type {!type:configuration_override}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_configuration_override :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> configuration_override
  (** Input JSON data of type {!type:configuration_override}. *)

val configuration_override_of_string :
  string -> configuration_override
  (** Deserialize JSON data of type {!type:configuration_override}. *)

val write_reporting_descriptor_relationship :
  Buffer.t -> reporting_descriptor_relationship -> unit
  (** Output a JSON value of type {!type:reporting_descriptor_relationship}. *)

val string_of_reporting_descriptor_relationship :
  ?len:int -> reporting_descriptor_relationship -> string
  (** Serialize a value of type {!type:reporting_descriptor_relationship}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_reporting_descriptor_relationship :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> reporting_descriptor_relationship
  (** Input JSON data of type {!type:reporting_descriptor_relationship}. *)

val reporting_descriptor_relationship_of_string :
  string -> reporting_descriptor_relationship
  (** Deserialize JSON data of type {!type:reporting_descriptor_relationship}. *)

val write_reporting_descriptor :
  Buffer.t -> reporting_descriptor -> unit
  (** Output a JSON value of type {!type:reporting_descriptor}. *)

val string_of_reporting_descriptor :
  ?len:int -> reporting_descriptor -> string
  (** Serialize a value of type {!type:reporting_descriptor}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_reporting_descriptor :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> reporting_descriptor
  (** Input JSON data of type {!type:reporting_descriptor}. *)

val reporting_descriptor_of_string :
  string -> reporting_descriptor
  (** Deserialize JSON data of type {!type:reporting_descriptor}. *)

val write_translation_metadata :
  Buffer.t -> translation_metadata -> unit
  (** Output a JSON value of type {!type:translation_metadata}. *)

val string_of_translation_metadata :
  ?len:int -> translation_metadata -> string
  (** Serialize a value of type {!type:translation_metadata}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_translation_metadata :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> translation_metadata
  (** Input JSON data of type {!type:translation_metadata}. *)

val translation_metadata_of_string :
  string -> translation_metadata
  (** Deserialize JSON data of type {!type:translation_metadata}. *)

val write_tool_component :
  Buffer.t -> tool_component -> unit
  (** Output a JSON value of type {!type:tool_component}. *)

val string_of_tool_component :
  ?len:int -> tool_component -> string
  (** Serialize a value of type {!type:tool_component}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_tool_component :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> tool_component
  (** Input JSON data of type {!type:tool_component}. *)

val tool_component_of_string :
  string -> tool_component
  (** Deserialize JSON data of type {!type:tool_component}. *)

val write_tool :
  Buffer.t -> tool -> unit
  (** Output a JSON value of type {!type:tool}. *)

val string_of_tool :
  ?len:int -> tool -> string
  (** Serialize a value of type {!type:tool}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_tool :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> tool
  (** Input JSON data of type {!type:tool}. *)

val tool_of_string :
  string -> tool
  (** Deserialize JSON data of type {!type:tool}. *)

val write_web_request :
  Buffer.t -> web_request -> unit
  (** Output a JSON value of type {!type:web_request}. *)

val string_of_web_request :
  ?len:int -> web_request -> string
  (** Serialize a value of type {!type:web_request}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_web_request :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> web_request
  (** Input JSON data of type {!type:web_request}. *)

val web_request_of_string :
  string -> web_request
  (** Deserialize JSON data of type {!type:web_request}. *)

val write_web_response :
  Buffer.t -> web_response -> unit
  (** Output a JSON value of type {!type:web_response}. *)

val string_of_web_response :
  ?len:int -> web_response -> string
  (** Serialize a value of type {!type:web_response}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_web_response :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> web_response
  (** Input JSON data of type {!type:web_response}. *)

val web_response_of_string :
  string -> web_response
  (** Deserialize JSON data of type {!type:web_response}. *)

val write_thread_flow_location :
  Buffer.t -> thread_flow_location -> unit
  (** Output a JSON value of type {!type:thread_flow_location}. *)

val string_of_thread_flow_location :
  ?len:int -> thread_flow_location -> string
  (** Serialize a value of type {!type:thread_flow_location}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_thread_flow_location :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> thread_flow_location
  (** Input JSON data of type {!type:thread_flow_location}. *)

val thread_flow_location_of_string :
  string -> thread_flow_location
  (** Deserialize JSON data of type {!type:thread_flow_location}. *)

val write_thread_flow :
  Buffer.t -> thread_flow -> unit
  (** Output a JSON value of type {!type:thread_flow}. *)

val string_of_thread_flow :
  ?len:int -> thread_flow -> string
  (** Serialize a value of type {!type:thread_flow}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_thread_flow :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> thread_flow
  (** Input JSON data of type {!type:thread_flow}. *)

val thread_flow_of_string :
  string -> thread_flow
  (** Deserialize JSON data of type {!type:thread_flow}. *)

val write_code_flow :
  Buffer.t -> code_flow -> unit
  (** Output a JSON value of type {!type:code_flow}. *)

val string_of_code_flow :
  ?len:int -> code_flow -> string
  (** Serialize a value of type {!type:code_flow}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_code_flow :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> code_flow
  (** Input JSON data of type {!type:code_flow}. *)

val code_flow_of_string :
  string -> code_flow
  (** Deserialize JSON data of type {!type:code_flow}. *)

val write_node :
  Buffer.t -> node -> unit
  (** Output a JSON value of type {!type:node}. *)

val string_of_node :
  ?len:int -> node -> string
  (** Serialize a value of type {!type:node}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_node :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> node
  (** Input JSON data of type {!type:node}. *)

val node_of_string :
  string -> node
  (** Deserialize JSON data of type {!type:node}. *)

val write_exception_ :
  Buffer.t -> exception_ -> unit
  (** Output a JSON value of type {!type:exception_}. *)

val string_of_exception_ :
  ?len:int -> exception_ -> string
  (** Serialize a value of type {!type:exception_}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_exception_ :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> exception_
  (** Input JSON data of type {!type:exception_}. *)

val exception__of_string :
  string -> exception_
  (** Deserialize JSON data of type {!type:exception_}. *)

val write_graph :
  Buffer.t -> graph -> unit
  (** Output a JSON value of type {!type:graph}. *)

val string_of_graph :
  ?len:int -> graph -> string
  (** Serialize a value of type {!type:graph}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_graph :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> graph
  (** Input JSON data of type {!type:graph}. *)

val graph_of_string :
  string -> graph
  (** Deserialize JSON data of type {!type:graph}. *)

val write_result :
  Buffer.t -> result -> unit
  (** Output a JSON value of type {!type:result}. *)

val string_of_result :
  ?len:int -> result -> string
  (** Serialize a value of type {!type:result}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_result :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> result
  (** Input JSON data of type {!type:result}. *)

val result_of_string :
  string -> result
  (** Deserialize JSON data of type {!type:result}. *)

val write_notification :
  Buffer.t -> notification -> unit
  (** Output a JSON value of type {!type:notification}. *)

val string_of_notification :
  ?len:int -> notification -> string
  (** Serialize a value of type {!type:notification}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_notification :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> notification
  (** Input JSON data of type {!type:notification}. *)

val notification_of_string :
  string -> notification
  (** Deserialize JSON data of type {!type:notification}. *)

val write_invocation :
  Buffer.t -> invocation -> unit
  (** Output a JSON value of type {!type:invocation}. *)

val string_of_invocation :
  ?len:int -> invocation -> string
  (** Serialize a value of type {!type:invocation}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_invocation :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> invocation
  (** Input JSON data of type {!type:invocation}. *)

val invocation_of_string :
  string -> invocation
  (** Deserialize JSON data of type {!type:invocation}. *)

val write_conversion :
  Buffer.t -> conversion -> unit
  (** Output a JSON value of type {!type:conversion}. *)

val string_of_conversion :
  ?len:int -> conversion -> string
  (** Serialize a value of type {!type:conversion}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_conversion :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> conversion
  (** Input JSON data of type {!type:conversion}. *)

val conversion_of_string :
  string -> conversion
  (** Deserialize JSON data of type {!type:conversion}. *)

val write_artifact :
  Buffer.t -> artifact -> unit
  (** Output a JSON value of type {!type:artifact}. *)

val string_of_artifact :
  ?len:int -> artifact -> string
  (** Serialize a value of type {!type:artifact}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_artifact :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> artifact
  (** Input JSON data of type {!type:artifact}. *)

val artifact_of_string :
  string -> artifact
  (** Deserialize JSON data of type {!type:artifact}. *)

val write_external_properties :
  Buffer.t -> external_properties -> unit
  (** Output a JSON value of type {!type:external_properties}. *)

val string_of_external_properties :
  ?len:int -> external_properties -> string
  (** Serialize a value of type {!type:external_properties}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_external_properties :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> external_properties
  (** Input JSON data of type {!type:external_properties}. *)

val external_properties_of_string :
  string -> external_properties
  (** Deserialize JSON data of type {!type:external_properties}. *)

val write_version_control_details :
  Buffer.t -> version_control_details -> unit
  (** Output a JSON value of type {!type:version_control_details}. *)

val string_of_version_control_details :
  ?len:int -> version_control_details -> string
  (** Serialize a value of type {!type:version_control_details}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_version_control_details :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> version_control_details
  (** Input JSON data of type {!type:version_control_details}. *)

val version_control_details_of_string :
  string -> version_control_details
  (** Deserialize JSON data of type {!type:version_control_details}. *)

val write_special_locations :
  Buffer.t -> special_locations -> unit
  (** Output a JSON value of type {!type:special_locations}. *)

val string_of_special_locations :
  ?len:int -> special_locations -> string
  (** Serialize a value of type {!type:special_locations}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_special_locations :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> special_locations
  (** Input JSON data of type {!type:special_locations}. *)

val special_locations_of_string :
  string -> special_locations
  (** Deserialize JSON data of type {!type:special_locations}. *)

val write_sarif_version :
  Buffer.t -> sarif_version -> unit
  (** Output a JSON value of type {!type:sarif_version}. *)

val string_of_sarif_version :
  ?len:int -> sarif_version -> string
  (** Serialize a value of type {!type:sarif_version}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_sarif_version :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> sarif_version
  (** Input JSON data of type {!type:sarif_version}. *)

val sarif_version_of_string :
  string -> sarif_version
  (** Deserialize JSON data of type {!type:sarif_version}. *)

val write_run_language :
  Buffer.t -> run_language -> unit
  (** Output a JSON value of type {!type:run_language}. *)

val string_of_run_language :
  ?len:int -> run_language -> string
  (** Serialize a value of type {!type:run_language}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_run_language :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> run_language
  (** Input JSON data of type {!type:run_language}. *)

val run_language_of_string :
  string -> run_language
  (** Deserialize JSON data of type {!type:run_language}. *)

val write_run_column_kind :
  Buffer.t -> run_column_kind -> unit
  (** Output a JSON value of type {!type:run_column_kind}. *)

val string_of_run_column_kind :
  ?len:int -> run_column_kind -> string
  (** Serialize a value of type {!type:run_column_kind}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_run_column_kind :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> run_column_kind
  (** Input JSON data of type {!type:run_column_kind}. *)

val run_column_kind_of_string :
  string -> run_column_kind
  (** Deserialize JSON data of type {!type:run_column_kind}. *)

val write_run_baseline_guid :
  Buffer.t -> run_baseline_guid -> unit
  (** Output a JSON value of type {!type:run_baseline_guid}. *)

val string_of_run_baseline_guid :
  ?len:int -> run_baseline_guid -> string
  (** Serialize a value of type {!type:run_baseline_guid}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_run_baseline_guid :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> run_baseline_guid
  (** Input JSON data of type {!type:run_baseline_guid}. *)

val run_baseline_guid_of_string :
  string -> run_baseline_guid
  (** Deserialize JSON data of type {!type:run_baseline_guid}. *)

val write_run_automation_details_guid :
  Buffer.t -> run_automation_details_guid -> unit
  (** Output a JSON value of type {!type:run_automation_details_guid}. *)

val string_of_run_automation_details_guid :
  ?len:int -> run_automation_details_guid -> string
  (** Serialize a value of type {!type:run_automation_details_guid}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_run_automation_details_guid :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> run_automation_details_guid
  (** Input JSON data of type {!type:run_automation_details_guid}. *)

val run_automation_details_guid_of_string :
  string -> run_automation_details_guid
  (** Deserialize JSON data of type {!type:run_automation_details_guid}. *)

val write_run_automation_details_correlation_guid :
  Buffer.t -> run_automation_details_correlation_guid -> unit
  (** Output a JSON value of type {!type:run_automation_details_correlation_guid}. *)

val string_of_run_automation_details_correlation_guid :
  ?len:int -> run_automation_details_correlation_guid -> string
  (** Serialize a value of type {!type:run_automation_details_correlation_guid}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_run_automation_details_correlation_guid :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> run_automation_details_correlation_guid
  (** Input JSON data of type {!type:run_automation_details_correlation_guid}. *)

val run_automation_details_correlation_guid_of_string :
  string -> run_automation_details_correlation_guid
  (** Deserialize JSON data of type {!type:run_automation_details_correlation_guid}. *)

val write_run_automation_details :
  Buffer.t -> run_automation_details -> unit
  (** Output a JSON value of type {!type:run_automation_details}. *)

val string_of_run_automation_details :
  ?len:int -> run_automation_details -> string
  (** Serialize a value of type {!type:run_automation_details}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_run_automation_details :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> run_automation_details
  (** Input JSON data of type {!type:run_automation_details}. *)

val run_automation_details_of_string :
  string -> run_automation_details
  (** Deserialize JSON data of type {!type:run_automation_details}. *)

val write_hm_str_al :
  Buffer.t -> hm_str_al -> unit
  (** Output a JSON value of type {!type:hm_str_al}. *)

val string_of_hm_str_al :
  ?len:int -> hm_str_al -> string
  (** Serialize a value of type {!type:hm_str_al}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_hm_str_al :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> hm_str_al
  (** Input JSON data of type {!type:hm_str_al}. *)

val hm_str_al_of_string :
  string -> hm_str_al
  (** Deserialize JSON data of type {!type:hm_str_al}. *)

val write_external_property_file_reference_guid :
  Buffer.t -> external_property_file_reference_guid -> unit
  (** Output a JSON value of type {!type:external_property_file_reference_guid}. *)

val string_of_external_property_file_reference_guid :
  ?len:int -> external_property_file_reference_guid -> string
  (** Serialize a value of type {!type:external_property_file_reference_guid}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_external_property_file_reference_guid :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> external_property_file_reference_guid
  (** Input JSON data of type {!type:external_property_file_reference_guid}. *)

val external_property_file_reference_guid_of_string :
  string -> external_property_file_reference_guid
  (** Deserialize JSON data of type {!type:external_property_file_reference_guid}. *)

val write_external_property_file_reference :
  Buffer.t -> external_property_file_reference -> unit
  (** Output a JSON value of type {!type:external_property_file_reference}. *)

val string_of_external_property_file_reference :
  ?len:int -> external_property_file_reference -> string
  (** Serialize a value of type {!type:external_property_file_reference}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_external_property_file_reference :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> external_property_file_reference
  (** Input JSON data of type {!type:external_property_file_reference}. *)

val external_property_file_reference_of_string :
  string -> external_property_file_reference
  (** Deserialize JSON data of type {!type:external_property_file_reference}. *)

val write_external_property_file_references :
  Buffer.t -> external_property_file_references -> unit
  (** Output a JSON value of type {!type:external_property_file_references}. *)

val string_of_external_property_file_references :
  ?len:int -> external_property_file_references -> string
  (** Serialize a value of type {!type:external_property_file_references}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_external_property_file_references :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> external_property_file_references
  (** Input JSON data of type {!type:external_property_file_references}. *)

val external_property_file_references_of_string :
  string -> external_property_file_references
  (** Deserialize JSON data of type {!type:external_property_file_references}. *)

val write_run :
  Buffer.t -> run -> unit
  (** Output a JSON value of type {!type:run}. *)

val string_of_run :
  ?len:int -> run -> string
  (** Serialize a value of type {!type:run}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_run :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> run
  (** Input JSON data of type {!type:run}. *)

val run_of_string :
  string -> run
  (** Deserialize JSON data of type {!type:run}. *)

val write_sarif_json_schema :
  Buffer.t -> sarif_json_schema -> unit
  (** Output a JSON value of type {!type:sarif_json_schema}. *)

val string_of_sarif_json_schema :
  ?len:int -> sarif_json_schema -> string
  (** Serialize a value of type {!type:sarif_json_schema}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_sarif_json_schema :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> sarif_json_schema
  (** Input JSON data of type {!type:sarif_json_schema}. *)

val sarif_json_schema_of_string :
  string -> sarif_json_schema
  (** Deserialize JSON data of type {!type:sarif_json_schema}. *)

