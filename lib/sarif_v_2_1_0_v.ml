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

let validate__float_option = (
  fun _ _ -> None
)
let validate__string_list = (
  fun _ _ -> None
)
let validate__string_list_option = (
  fun _ _ -> None
)
let validate__string_option = (
  fun _ _ -> None
)
let validate__x_c3c9756 = (
  fun _ _ -> None
)
let validate_artifact_mimetype = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_artifact_mimetype" in
    if (Sarif_v_2_1_0_util.validate_artifact_mimetype) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate__artifact_mimetype_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_artifact_mimetype
  )
)
let validate_artifact_roles_item = (
  fun _ _ -> None
)
let validate__artifact_roles_item_list = (
  fun _ _ -> None
)
let validate__artifact_roles_item_list_option = (
  fun _ _ -> None
)
let validate_external_properties_guid = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_external_properties_guid" in
    if (Sarif_v_2_1_0_util.validate_external_properties_guid) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate__external_properties_guid_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_external_properties_guid
  )
)
let validate_external_properties_run_guid = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_external_properties_run_guid" in
    if (Sarif_v_2_1_0_util.validate_external_properties_run_guid) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate__external_properties_run_guid_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_external_properties_run_guid
  )
)
let validate_external_properties_version = (
  fun _ _ -> None
)
let validate__external_properties_version_option = (
  fun _ _ -> None
)
let validate_hm_str_str = (
  validate__x_c3c9756
)
let validate__hm_str_str_option = (
  fun _ _ -> None
)
let validate_int64 = (
  (fun _ _ -> None)
)
let validate__int64_option = (
  fun _ _ -> None
)
let validate_notification_level = (
  fun _ _ -> None
)
let validate__notification_level_option = (
  fun _ _ -> None
)
let validate_property_bag = (
  ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_property_bag" in
    if (Sarif_v_2_1_0_util.validate_property_bag) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) )
)
let validate__property_bag_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_property_bag
  )
)
let validate_address : _ -> address -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_address" in
    if (Sarif_v_2_1_0_util.validate_address) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        (
          validate__property_bag_option
        ) (`Field "properties" :: path) x.properties
)
let validate__address_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_address
  )
)
let validate__address_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__address_list
  )
)
let validate__address_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_address
  )
)
let validate_logical_location : _ -> logical_location -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_logical_location" in
    if (Sarif_v_2_1_0_util.validate_logical_location) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        (
          validate__property_bag_option
        ) (`Field "properties" :: path) x.properties
)
let validate__logical_location_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_logical_location
  )
)
let validate__logical_location_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__logical_location_list
  )
)
let validate_message : _ -> message -> _ = (
  fun path x ->
    (
      validate__property_bag_option
    ) (`Field "properties" :: path) x.properties
)
let validate__message_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_message
  )
)
let validate_artifact_location : _ -> artifact_location -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_artifact_location" in
    if (Sarif_v_2_1_0_util.validate_artifact_location) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__message_option
          ) (`Field "description" :: path) x.description
        with
          | Some _ as err -> err
          | None ->
            (
              validate__property_bag_option
            ) (`Field "properties" :: path) x.properties
)
let validate__artifact_location_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_artifact_location
  )
)
let validate__artifact_location_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__artifact_location_list
  )
)
let validate__artifact_location_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_artifact_location
  )
)
let validate_edge : _ -> edge -> _ = (
  fun path x ->
    match
      (
        validate__message_option
      ) (`Field "label" :: path) x.label
    with
      | Some _ as err -> err
      | None ->
        (
          validate__property_bag_option
        ) (`Field "properties" :: path) x.properties
)
let validate__edge_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_edge
  )
)
let validate__edge_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__edge_list
  )
)
let validate_location_relationship : _ -> location_relationship -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_location_relationship" in
    if (Sarif_v_2_1_0_util.validate_location_relationship) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__message_option
          ) (`Field "description" :: path) x.description
        with
          | Some _ as err -> err
          | None ->
            (
              validate__property_bag_option
            ) (`Field "properties" :: path) x.properties
)
let validate__location_relationship_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_location_relationship
  )
)
let validate__location_relationship_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__location_relationship_list
  )
)
let validate_multiformat_message_string : _ -> multiformat_message_string -> _ = (
  fun path x ->
    (
      validate__property_bag_option
    ) (`Field "properties" :: path) x.properties
)
let validate__multiformat_message_string_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_multiformat_message_string
  )
)
let validate__x_a05fe6a = (
  Atdgen_runtime.Ov_run.validate_list (
    fun path x ->
      (let _, x = x in
      (
        validate_multiformat_message_string
      ) (`Index 1 :: path) x
      )
  )
)
let validate_artifact_content : _ -> artifact_content -> _ = (
  fun path x ->
    match
      (
        validate__property_bag_option
      ) (`Field "properties" :: path) x.properties
    with
      | Some _ as err -> err
      | None ->
        (
          validate__multiformat_message_string_option
        ) (`Field "rendered" :: path) x.rendered
)
let validate__artifact_content_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_artifact_content
  )
)
let validate_hm_str_mms = (
  validate__x_a05fe6a
)
let validate__hm_str_mms_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_hm_str_mms
  )
)
let validate_edge_traversal : _ -> edge_traversal -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_edge_traversal" in
    if (Sarif_v_2_1_0_util.validate_edge_traversal) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__hm_str_mms_option
          ) (`Field "final_state" :: path) x.final_state
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__message_option
              ) (`Field "message" :: path) x.message
            with
              | Some _ as err -> err
              | None ->
                (
                  validate__property_bag_option
                ) (`Field "properties" :: path) x.properties
)
let validate__edge_traversal_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_edge_traversal
  )
)
let validate__edge_traversal_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__edge_traversal_list
  )
)
let validate_graph_traversal_variant0 : _ -> graph_traversal_variant0 -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_graph_traversal_variant0" in
    if (Sarif_v_2_1_0_util.validate_graph_traversal_variant0) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__message_option
          ) (`Field "description" :: path) x.description
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__edge_traversal_list_option
              ) (`Field "edge_traversals" :: path) x.edge_traversals
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__hm_str_mms_option
                  ) (`Field "immutable_state" :: path) x.immutable_state
                with
                  | Some _ as err -> err
                  | None ->
                    match
                      (
                        validate__hm_str_mms_option
                      ) (`Field "initial_state" :: path) x.initial_state
                    with
                      | Some _ as err -> err
                      | None ->
                        (
                          validate__property_bag_option
                        ) (`Field "properties" :: path) x.properties
)
let validate_graph_traversal_variant1 : _ -> graph_traversal_variant1 -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_graph_traversal_variant1" in
    if (Sarif_v_2_1_0_util.validate_graph_traversal_variant1) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__message_option
          ) (`Field "description" :: path) x.description
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__edge_traversal_list_option
              ) (`Field "edge_traversals" :: path) x.edge_traversals
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__hm_str_mms_option
                  ) (`Field "immutable_state" :: path) x.immutable_state
                with
                  | Some _ as err -> err
                  | None ->
                    match
                      (
                        validate__hm_str_mms_option
                      ) (`Field "initial_state" :: path) x.initial_state
                    with
                      | Some _ as err -> err
                      | None ->
                        (
                          validate__property_bag_option
                        ) (`Field "properties" :: path) x.properties
)
let validate_graph_traversal = (
  fun path x ->
    match x with
      | `Variant0 x ->
        (
          validate_graph_traversal_variant0
        ) path x
      | `Variant1 x ->
        (
          validate_graph_traversal_variant1
        ) path x
)
let validate__graph_traversal_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_graph_traversal
  )
)
let validate__graph_traversal_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__graph_traversal_list
  )
)
let validate_rectangle : _ -> rectangle -> _ = (
  fun path x ->
    match
      (
        validate__message_option
      ) (`Field "message" :: path) x.message
    with
      | Some _ as err -> err
      | None ->
        (
          validate__property_bag_option
        ) (`Field "properties" :: path) x.properties
)
let validate__rectangle_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_rectangle
  )
)
let validate__rectangle_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__rectangle_list
  )
)
let validate_region : _ -> region -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_region" in
    if (Sarif_v_2_1_0_util.validate_region) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__message_option
          ) (`Field "message" :: path) x.message
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__property_bag_option
              ) (`Field "properties" :: path) x.properties
            with
              | Some _ as err -> err
              | None ->
                (
                  validate__artifact_content_option
                ) (`Field "snippet" :: path) x.snippet
)
let validate__region_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_region
  )
)
let validate__region_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__region_list
  )
)
let validate__region_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_region
  )
)
let validate_attachment : _ -> attachment -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_attachment" in
    if (Sarif_v_2_1_0_util.validate_attachment) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate_artifact_location
          ) (`Field "artifact_location" :: path) x.artifact_location
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__message_option
              ) (`Field "description" :: path) x.description
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__property_bag_option
                  ) (`Field "properties" :: path) x.properties
                with
                  | Some _ as err -> err
                  | None ->
                    match
                      (
                        validate__rectangle_list_option
                      ) (`Field "rectangles" :: path) x.rectangles
                    with
                      | Some _ as err -> err
                      | None ->
                        (
                          validate__region_list_option
                        ) (`Field "regions" :: path) x.regions
)
let validate__attachment_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_attachment
  )
)
let validate__attachment_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__attachment_list
  )
)
let validate_physical_location : _ -> physical_location -> _ = (
  fun path x ->
    match
      (
        validate__address_option
      ) (`Field "address" :: path) x.address
    with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__artifact_location_option
          ) (`Field "artifact_location" :: path) x.artifact_location
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__region_option
              ) (`Field "context_region" :: path) x.context_region
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__property_bag_option
                  ) (`Field "properties" :: path) x.properties
                with
                  | Some _ as err -> err
                  | None ->
                    (
                      validate__region_option
                    ) (`Field "region" :: path) x.region
)
let validate__physical_location_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_physical_location
  )
)
let validate__physical_location_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__physical_location_list
  )
)
let validate__physical_location_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_physical_location
  )
)
let validate_location : _ -> location -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_location" in
    if (Sarif_v_2_1_0_util.validate_location) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__region_list_option
          ) (`Field "annotations" :: path) x.annotations
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__logical_location_list_option
              ) (`Field "logical_locations" :: path) x.logical_locations
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__message_option
                  ) (`Field "message" :: path) x.message
                with
                  | Some _ as err -> err
                  | None ->
                    match
                      (
                        validate__physical_location_option
                      ) (`Field "physical_location" :: path) x.physical_location
                    with
                      | Some _ as err -> err
                      | None ->
                        match
                          (
                            validate__property_bag_option
                          ) (`Field "properties" :: path) x.properties
                        with
                          | Some _ as err -> err
                          | None ->
                            (
                              validate__location_relationship_list_option
                            ) (`Field "relationships" :: path) x.relationships
)
let validate__location_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_location
  )
)
let validate__location_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__location_list
  )
)
let validate__location_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_location
  )
)
let validate_replacement : _ -> replacement -> _ = (
  fun path x ->
    match
      (
        validate_region
      ) (`Field "deleted_region" :: path) x.deleted_region
    with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__artifact_content_option
          ) (`Field "inserted_content" :: path) x.inserted_content
        with
          | Some _ as err -> err
          | None ->
            (
              validate__property_bag_option
            ) (`Field "properties" :: path) x.properties
)
let validate__replacement_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_replacement
  )
)
let validate_artifact_change : _ -> artifact_change -> _ = (
  fun path x ->
    match
      (
        validate_artifact_location
      ) (`Field "artifact_location" :: path) x.artifact_location
    with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__property_bag_option
          ) (`Field "properties" :: path) x.properties
        with
          | Some _ as err -> err
          | None ->
            (
              validate__replacement_list
            ) (`Field "replacements" :: path) x.replacements
)
let validate__artifact_change_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_artifact_change
  )
)
let validate_fix : _ -> fix -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_fix" in
    if (Sarif_v_2_1_0_util.validate_fix) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__artifact_change_list
          ) (`Field "artifact_changes" :: path) x.artifact_changes
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__message_option
              ) (`Field "description" :: path) x.description
            with
              | Some _ as err -> err
              | None ->
                (
                  validate__property_bag_option
                ) (`Field "properties" :: path) x.properties
)
let validate__fix_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_fix
  )
)
let validate__fix_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__fix_list
  )
)
let validate_reporting_configuration_level = (
  fun _ _ -> None
)
let validate__reporting_configuration_level_option = (
  fun _ _ -> None
)
let validate_reporting_configuration : _ -> reporting_configuration -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_reporting_configuration" in
    if (Sarif_v_2_1_0_util.validate_reporting_configuration) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__property_bag_option
          ) (`Field "parameters" :: path) x.parameters
        with
          | Some _ as err -> err
          | None ->
            (
              validate__property_bag_option
            ) (`Field "properties" :: path) x.properties
)
let validate__reporting_configuration_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_reporting_configuration
  )
)
let validate_reporting_descriptor_deprecated_guids_item = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_reporting_descriptor_deprecated_guids_item" in
    if (Sarif_v_2_1_0_util.validate_reporting_descriptor_deprecated_guids_item) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate__list_2041d89 = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_reporting_descriptor_deprecated_guids_item
  )
)
let validate__option_aa202c3 = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__list_2041d89
  )
)
let validate_reporting_descriptor_guid = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_reporting_descriptor_guid" in
    if (Sarif_v_2_1_0_util.validate_reporting_descriptor_guid) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate__reporting_descriptor_guid_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_reporting_descriptor_guid
  )
)
let validate_reporting_descriptor_reference_guid = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_reporting_descriptor_reference_guid" in
    if (Sarif_v_2_1_0_util.validate_reporting_descriptor_reference_guid) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate__reporting_descriptor_reference_guid_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_reporting_descriptor_reference_guid
  )
)
let validate_result_baseline_state = (
  fun _ _ -> None
)
let validate__result_baseline_state_option = (
  fun _ _ -> None
)
let validate_result_correlation_guid = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_result_correlation_guid" in
    if (Sarif_v_2_1_0_util.validate_result_correlation_guid) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate__result_correlation_guid_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_result_correlation_guid
  )
)
let validate_result_guid = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_result_guid" in
    if (Sarif_v_2_1_0_util.validate_result_guid) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate__result_guid_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_result_guid
  )
)
let validate_result_kind = (
  fun _ _ -> None
)
let validate__result_kind_option = (
  fun _ _ -> None
)
let validate_result_level = (
  fun _ _ -> None
)
let validate__result_level_option = (
  fun _ _ -> None
)
let validate_result_provenance_first_detection_run_guid = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_result_provenance_first_detection_run_guid" in
    if (Sarif_v_2_1_0_util.validate_result_provenance_first_detection_run_guid) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate__option_60f83e5 = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_result_provenance_first_detection_run_guid
  )
)
let validate_result_provenance_last_detection_run_guid = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_result_provenance_last_detection_run_guid" in
    if (Sarif_v_2_1_0_util.validate_result_provenance_last_detection_run_guid) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate__option_0fcda76 = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_result_provenance_last_detection_run_guid
  )
)
let validate_result_provenance : _ -> result_provenance -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_result_provenance" in
    if (Sarif_v_2_1_0_util.validate_result_provenance) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__physical_location_list_option
          ) (`Field "conversion_sources" :: path) x.conversion_sources
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__option_60f83e5
              ) (`Field "first_detection_run_guid" :: path) x.first_detection_run_guid
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__option_0fcda76
                  ) (`Field "last_detection_run_guid" :: path) x.last_detection_run_guid
                with
                  | Some _ as err -> err
                  | None ->
                    (
                      validate__property_bag_option
                    ) (`Field "properties" :: path) x.properties
)
let validate__result_provenance_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_result_provenance
  )
)
let validate_stack_frame : _ -> stack_frame -> _ = (
  fun path x ->
    match
      (
        validate__location_option
      ) (`Field "location" :: path) x.location
    with
      | Some _ as err -> err
      | None ->
        (
          validate__property_bag_option
        ) (`Field "properties" :: path) x.properties
)
let validate__stack_frame_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_stack_frame
  )
)
let validate_stack : _ -> stack -> _ = (
  fun path x ->
    match
      (
        validate__stack_frame_list
      ) (`Field "frames" :: path) x.frames
    with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__message_option
          ) (`Field "message" :: path) x.message
        with
          | Some _ as err -> err
          | None ->
            (
              validate__property_bag_option
            ) (`Field "properties" :: path) x.properties
)
let validate__stack_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_stack
  )
)
let validate__stack_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__stack_list
  )
)
let validate__stack_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_stack
  )
)
let validate_suppression_guid = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_suppression_guid" in
    if (Sarif_v_2_1_0_util.validate_suppression_guid) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate__suppression_guid_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_suppression_guid
  )
)
let validate_suppression_kind = (
  fun _ _ -> None
)
let validate_suppression_status = (
  fun _ _ -> None
)
let validate__suppression_status_option = (
  fun _ _ -> None
)
let validate_suppression : _ -> suppression -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_suppression" in
    if (Sarif_v_2_1_0_util.validate_suppression) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__suppression_guid_option
          ) (`Field "guid" :: path) x.guid
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__location_option
              ) (`Field "location" :: path) x.location
            with
              | Some _ as err -> err
              | None ->
                (
                  validate__property_bag_option
                ) (`Field "properties" :: path) x.properties
)
let validate__suppression_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_suppression
  )
)
let validate__suppression_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__suppression_list
  )
)
let validate_thread_flow_location_importance = (
  fun _ _ -> None
)
let validate__thread_flow_location_importance_option = (
  fun _ _ -> None
)
let validate_tool_component_contents_item = (
  fun _ _ -> None
)
let validate__tool_component_contents_item_list = (
  fun _ _ -> None
)
let validate__option_0ba29ed = (
  fun _ _ -> None
)
let validate_tool_component_dotted_quad_file_version = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_tool_component_dotted_quad_file_version" in
    if (Sarif_v_2_1_0_util.validate_tool_component_dotted_quad_file_version) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate__option_d07cfb1 = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_tool_component_dotted_quad_file_version
  )
)
let validate_tool_component_guid = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_tool_component_guid" in
    if (Sarif_v_2_1_0_util.validate_tool_component_guid) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate__tool_component_guid_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_tool_component_guid
  )
)
let validate_tool_component_language = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_tool_component_language" in
    if (Sarif_v_2_1_0_util.validate_tool_component_language) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate__tool_component_language_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_tool_component_language
  )
)
let validate_tool_component_reference_guid = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_tool_component_reference_guid" in
    if (Sarif_v_2_1_0_util.validate_tool_component_reference_guid) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate__tool_component_reference_guid_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_tool_component_reference_guid
  )
)
let validate_tool_component_reference : _ -> tool_component_reference -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_tool_component_reference" in
    if (Sarif_v_2_1_0_util.validate_tool_component_reference) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__tool_component_reference_guid_option
          ) (`Field "guid" :: path) x.guid
        with
          | Some _ as err -> err
          | None ->
            (
              validate__property_bag_option
            ) (`Field "properties" :: path) x.properties
)
let validate__tool_component_reference_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_tool_component_reference
  )
)
let validate__tool_component_reference_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__tool_component_reference_list
  )
)
let validate__tool_component_reference_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_tool_component_reference
  )
)
let validate_reporting_descriptor_reference : _ -> reporting_descriptor_reference -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_reporting_descriptor_reference" in
    if (Sarif_v_2_1_0_util.validate_reporting_descriptor_reference) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__reporting_descriptor_reference_guid_option
          ) (`Field "guid" :: path) x.guid
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__property_bag_option
              ) (`Field "properties" :: path) x.properties
            with
              | Some _ as err -> err
              | None ->
                (
                  validate__tool_component_reference_option
                ) (`Field "tool_component" :: path) x.tool_component
)
let validate__reporting_descriptor_reference_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_reporting_descriptor_reference
  )
)
let validate__reporting_descriptor_reference_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__reporting_descriptor_reference_list
  )
)
let validate__reporting_descriptor_reference_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_reporting_descriptor_reference
  )
)
let validate_configuration_override : _ -> configuration_override -> _ = (
  fun path x ->
    match
      (
        validate_reporting_configuration
      ) (`Field "configuration" :: path) x.configuration
    with
      | Some _ as err -> err
      | None ->
        match
          (
            validate_reporting_descriptor_reference
          ) (`Field "descriptor" :: path) x.descriptor
        with
          | Some _ as err -> err
          | None ->
            (
              validate__property_bag_option
            ) (`Field "properties" :: path) x.properties
)
let validate__configuration_override_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_configuration_override
  )
)
let validate__configuration_override_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__configuration_override_list
  )
)
let validate_reporting_descriptor_relationship : _ -> reporting_descriptor_relationship -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_reporting_descriptor_relationship" in
    if (Sarif_v_2_1_0_util.validate_reporting_descriptor_relationship) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__message_option
          ) (`Field "description" :: path) x.description
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__property_bag_option
              ) (`Field "properties" :: path) x.properties
            with
              | Some _ as err -> err
              | None ->
                (
                  validate_reporting_descriptor_reference
                ) (`Field "target" :: path) x.target
)
let validate__reporting_descriptor_relationship_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_reporting_descriptor_relationship
  )
)
let validate__reporting_descriptor_relationship_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__reporting_descriptor_relationship_list
  )
)
let validate_reporting_descriptor : _ -> reporting_descriptor -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_reporting_descriptor" in
    if (Sarif_v_2_1_0_util.validate_reporting_descriptor) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__reporting_configuration_option
          ) (`Field "default_configuration" :: path) x.default_configuration
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__option_aa202c3
              ) (`Field "deprecated_guids" :: path) x.deprecated_guids
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__multiformat_message_string_option
                  ) (`Field "full_description" :: path) x.full_description
                with
                  | Some _ as err -> err
                  | None ->
                    match
                      (
                        validate__reporting_descriptor_guid_option
                      ) (`Field "guid" :: path) x.guid
                    with
                      | Some _ as err -> err
                      | None ->
                        match
                          (
                            validate__multiformat_message_string_option
                          ) (`Field "help" :: path) x.help
                        with
                          | Some _ as err -> err
                          | None ->
                            match
                              (
                                validate__hm_str_mms_option
                              ) (`Field "message_strings" :: path) x.message_strings
                            with
                              | Some _ as err -> err
                              | None ->
                                match
                                  (
                                    validate__property_bag_option
                                  ) (`Field "properties" :: path) x.properties
                                with
                                  | Some _ as err -> err
                                  | None ->
                                    match
                                      (
                                        validate__reporting_descriptor_relationship_list_option
                                      ) (`Field "relationships" :: path) x.relationships
                                    with
                                      | Some _ as err -> err
                                      | None ->
                                        (
                                          validate__multiformat_message_string_option
                                        ) (`Field "short_description" :: path) x.short_description
)
let validate__reporting_descriptor_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_reporting_descriptor
  )
)
let validate__reporting_descriptor_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__reporting_descriptor_list
  )
)
let validate_translation_metadata : _ -> translation_metadata -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_translation_metadata" in
    if (Sarif_v_2_1_0_util.validate_translation_metadata) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__multiformat_message_string_option
          ) (`Field "full_description" :: path) x.full_description
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__property_bag_option
              ) (`Field "properties" :: path) x.properties
            with
              | Some _ as err -> err
              | None ->
                (
                  validate__multiformat_message_string_option
                ) (`Field "short_description" :: path) x.short_description
)
let validate__translation_metadata_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_translation_metadata
  )
)
let validate_tool_component : _ -> tool_component -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_tool_component" in
    if (Sarif_v_2_1_0_util.validate_tool_component) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__tool_component_reference_option
          ) (`Field "associated_component" :: path) x.associated_component
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__option_d07cfb1
              ) (`Field "dotted_quad_file_version" :: path) x.dotted_quad_file_version
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__multiformat_message_string_option
                  ) (`Field "full_description" :: path) x.full_description
                with
                  | Some _ as err -> err
                  | None ->
                    match
                      (
                        validate__hm_str_mms_option
                      ) (`Field "global_message_strings" :: path) x.global_message_strings
                    with
                      | Some _ as err -> err
                      | None ->
                        match
                          (
                            validate__tool_component_guid_option
                          ) (`Field "guid" :: path) x.guid
                        with
                          | Some _ as err -> err
                          | None ->
                            match
                              (
                                validate__tool_component_language_option
                              ) (`Field "language" :: path) x.language
                            with
                              | Some _ as err -> err
                              | None ->
                                match
                                  (
                                    validate__artifact_location_list_option
                                  ) (`Field "locations" :: path) x.locations
                                with
                                  | Some _ as err -> err
                                  | None ->
                                    match
                                      (
                                        validate__reporting_descriptor_list_option
                                      ) (`Field "notifications" :: path) x.notifications
                                    with
                                      | Some _ as err -> err
                                      | None ->
                                        match
                                          (
                                            validate__property_bag_option
                                          ) (`Field "properties" :: path) x.properties
                                        with
                                          | Some _ as err -> err
                                          | None ->
                                            match
                                              (
                                                validate__reporting_descriptor_list_option
                                              ) (`Field "rules" :: path) x.rules
                                            with
                                              | Some _ as err -> err
                                              | None ->
                                                match
                                                  (
                                                    validate__multiformat_message_string_option
                                                  ) (`Field "short_description" :: path) x.short_description
                                                with
                                                  | Some _ as err -> err
                                                  | None ->
                                                    match
                                                      (
                                                        validate__tool_component_reference_list_option
                                                      ) (`Field "supported_taxonomies" :: path) x.supported_taxonomies
                                                    with
                                                      | Some _ as err -> err
                                                      | None ->
                                                        match
                                                          (
                                                            validate__reporting_descriptor_list_option
                                                          ) (`Field "taxa" :: path) x.taxa
                                                        with
                                                          | Some _ as err -> err
                                                          | None ->
                                                            (
                                                              validate__translation_metadata_option
                                                            ) (`Field "translation_metadata" :: path) x.translation_metadata
)
let validate__tool_component_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_tool_component
  )
)
let validate__tool_component_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__tool_component_list
  )
)
let validate__tool_component_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_tool_component
  )
)
let validate_tool : _ -> tool -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_tool" in
    if (Sarif_v_2_1_0_util.validate_tool) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate_tool_component
          ) (`Field "driver" :: path) x.driver
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__tool_component_list_option
              ) (`Field "extensions" :: path) x.extensions
            with
              | Some _ as err -> err
              | None ->
                (
                  validate__property_bag_option
                ) (`Field "properties" :: path) x.properties
)
let validate_web_request : _ -> web_request -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_web_request" in
    if (Sarif_v_2_1_0_util.validate_web_request) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__artifact_content_option
          ) (`Field "body" :: path) x.body
        with
          | Some _ as err -> err
          | None ->
            (
              validate__property_bag_option
            ) (`Field "properties" :: path) x.properties
)
let validate__web_request_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_web_request
  )
)
let validate__web_request_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__web_request_list
  )
)
let validate__web_request_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_web_request
  )
)
let validate_web_response : _ -> web_response -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_web_response" in
    if (Sarif_v_2_1_0_util.validate_web_response) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__artifact_content_option
          ) (`Field "body" :: path) x.body
        with
          | Some _ as err -> err
          | None ->
            (
              validate__property_bag_option
            ) (`Field "properties" :: path) x.properties
)
let validate__web_response_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_web_response
  )
)
let validate__web_response_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__web_response_list
  )
)
let validate__web_response_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_web_response
  )
)
let validate_thread_flow_location : _ -> thread_flow_location -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_thread_flow_location" in
    if (Sarif_v_2_1_0_util.validate_thread_flow_location) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__location_option
          ) (`Field "location" :: path) x.location
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__property_bag_option
              ) (`Field "properties" :: path) x.properties
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__stack_option
                  ) (`Field "stack" :: path) x.stack
                with
                  | Some _ as err -> err
                  | None ->
                    match
                      (
                        validate__hm_str_mms_option
                      ) (`Field "state" :: path) x.state
                    with
                      | Some _ as err -> err
                      | None ->
                        match
                          (
                            validate__reporting_descriptor_reference_list_option
                          ) (`Field "taxa" :: path) x.taxa
                        with
                          | Some _ as err -> err
                          | None ->
                            match
                              (
                                validate__web_request_option
                              ) (`Field "web_request" :: path) x.web_request
                            with
                              | Some _ as err -> err
                              | None ->
                                (
                                  validate__web_response_option
                                ) (`Field "web_response" :: path) x.web_response
)
let validate__thread_flow_location_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_thread_flow_location
  )
)
let validate__thread_flow_location_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__thread_flow_location_list
  )
)
let validate_thread_flow : _ -> thread_flow -> _ = (
  fun path x ->
    match
      (
        validate__hm_str_mms_option
      ) (`Field "immutable_state" :: path) x.immutable_state
    with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__hm_str_mms_option
          ) (`Field "initial_state" :: path) x.initial_state
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__thread_flow_location_list
              ) (`Field "locations" :: path) x.locations
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__message_option
                  ) (`Field "message" :: path) x.message
                with
                  | Some _ as err -> err
                  | None ->
                    (
                      validate__property_bag_option
                    ) (`Field "properties" :: path) x.properties
)
let validate__thread_flow_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_thread_flow
  )
)
let validate_code_flow : _ -> code_flow -> _ = (
  fun path x ->
    match
      (
        validate__message_option
      ) (`Field "message" :: path) x.message
    with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__property_bag_option
          ) (`Field "properties" :: path) x.properties
        with
          | Some _ as err -> err
          | None ->
            (
              validate__thread_flow_list
            ) (`Field "thread_flows" :: path) x.thread_flows
)
let validate__code_flow_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_code_flow
  )
)
let validate__code_flow_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__code_flow_list
  )
)
let rec validate__node_list path x = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_node
  )
) path x
and validate__node_list_option path x = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__node_list
  )
) path x
and validate_node : _ -> node -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_node" in
    if (Sarif_v_2_1_0_util.validate_node) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__node_list_option
          ) (`Field "children" :: path) x.children
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__message_option
              ) (`Field "label" :: path) x.label
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__location_option
                  ) (`Field "location" :: path) x.location
                with
                  | Some _ as err -> err
                  | None ->
                    (
                      validate__property_bag_option
                    ) (`Field "properties" :: path) x.properties
)
let rec validate__exception_list path x = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_exception_
  )
) path x
and validate__exception_list_option path x = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__exception_list
  )
) path x
and validate_exception_ : _ -> exception_ -> _ = (
  fun path x ->
    match
      (
        validate__exception_list_option
      ) (`Field "inner_exceptions" :: path) x.inner_exceptions
    with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__property_bag_option
          ) (`Field "properties" :: path) x.properties
        with
          | Some _ as err -> err
          | None ->
            (
              validate__stack_option
            ) (`Field "stack" :: path) x.stack
)
let validate_graph : _ -> graph -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_graph" in
    if (Sarif_v_2_1_0_util.validate_graph) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__message_option
          ) (`Field "description" :: path) x.description
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__edge_list_option
              ) (`Field "edges" :: path) x.edges
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__node_list_option
                  ) (`Field "nodes" :: path) x.nodes
                with
                  | Some _ as err -> err
                  | None ->
                    (
                      validate__property_bag_option
                    ) (`Field "properties" :: path) x.properties
)
let validate__graph_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_graph
  )
)
let validate__graph_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__graph_list
  )
)
let validate_result : _ -> result -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_result" in
    if (Sarif_v_2_1_0_util.validate_result) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__artifact_location_option
          ) (`Field "analysis_target" :: path) x.analysis_target
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__attachment_list_option
              ) (`Field "attachments" :: path) x.attachments
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__code_flow_list_option
                  ) (`Field "code_flows" :: path) x.code_flows
                with
                  | Some _ as err -> err
                  | None ->
                    match
                      (
                        validate__result_correlation_guid_option
                      ) (`Field "correlation_guid" :: path) x.correlation_guid
                    with
                      | Some _ as err -> err
                      | None ->
                        match
                          (
                            validate__fix_list_option
                          ) (`Field "fixes" :: path) x.fixes
                        with
                          | Some _ as err -> err
                          | None ->
                            match
                              (
                                validate__graph_traversal_list_option
                              ) (`Field "graph_traversals" :: path) x.graph_traversals
                            with
                              | Some _ as err -> err
                              | None ->
                                match
                                  (
                                    validate__graph_list_option
                                  ) (`Field "graphs" :: path) x.graphs
                                with
                                  | Some _ as err -> err
                                  | None ->
                                    match
                                      (
                                        validate__result_guid_option
                                      ) (`Field "guid" :: path) x.guid
                                    with
                                      | Some _ as err -> err
                                      | None ->
                                        match
                                          (
                                            validate__location_list_option
                                          ) (`Field "locations" :: path) x.locations
                                        with
                                          | Some _ as err -> err
                                          | None ->
                                            match
                                              (
                                                validate_message
                                              ) (`Field "message" :: path) x.message
                                            with
                                              | Some _ as err -> err
                                              | None ->
                                                match
                                                  (
                                                    validate__property_bag_option
                                                  ) (`Field "properties" :: path) x.properties
                                                with
                                                  | Some _ as err -> err
                                                  | None ->
                                                    match
                                                      (
                                                        validate__result_provenance_option
                                                      ) (`Field "provenance" :: path) x.provenance
                                                    with
                                                      | Some _ as err -> err
                                                      | None ->
                                                        match
                                                          (
                                                            validate__location_list_option
                                                          ) (`Field "related_locations" :: path) x.related_locations
                                                        with
                                                          | Some _ as err -> err
                                                          | None ->
                                                            match
                                                              (
                                                                validate__reporting_descriptor_reference_option
                                                              ) (`Field "rule" :: path) x.rule
                                                            with
                                                              | Some _ as err -> err
                                                              | None ->
                                                                match
                                                                  (
                                                                    validate__stack_list_option
                                                                  ) (`Field "stacks" :: path) x.stacks
                                                                with
                                                                  | Some _ as err -> err
                                                                  | None ->
                                                                    match
                                                                      (
                                                                        validate__suppression_list_option
                                                                      ) (`Field "suppressions" :: path) x.suppressions
                                                                    with
                                                                      | Some _ as err -> err
                                                                      | None ->
                                                                        match
                                                                          (
                                                                            validate__reporting_descriptor_reference_list_option
                                                                          ) (`Field "taxa" :: path) x.taxa
                                                                        with
                                                                          | Some _ as err -> err
                                                                          | None ->
                                                                            match
                                                                              (
                                                                                validate__web_request_option
                                                                              ) (`Field "web_request" :: path) x.web_request
                                                                            with
                                                                              | Some _ as err -> err
                                                                              | None ->
                                                                                (
                                                                                  validate__web_response_option
                                                                                ) (`Field "web_response" :: path) x.web_response
)
let validate__exception_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_exception_
  )
)
let validate_notification : _ -> notification -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_notification" in
    if (Sarif_v_2_1_0_util.validate_notification) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__reporting_descriptor_reference_option
          ) (`Field "associated_rule" :: path) x.associated_rule
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__reporting_descriptor_reference_option
              ) (`Field "descriptor" :: path) x.descriptor
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__exception_option
                  ) (`Field "exception_" :: path) x.exception_
                with
                  | Some _ as err -> err
                  | None ->
                    match
                      (
                        validate__location_list_option
                      ) (`Field "locations" :: path) x.locations
                    with
                      | Some _ as err -> err
                      | None ->
                        match
                          (
                            validate_message
                          ) (`Field "message" :: path) x.message
                        with
                          | Some _ as err -> err
                          | None ->
                            (
                              validate__property_bag_option
                            ) (`Field "properties" :: path) x.properties
)
let validate__notification_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_notification
  )
)
let validate__notification_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__notification_list
  )
)
let validate_invocation : _ -> invocation -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_invocation" in
    if (Sarif_v_2_1_0_util.validate_invocation) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__artifact_location_option
          ) (`Field "executable_location" :: path) x.executable_location
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__configuration_override_list_option
              ) (`Field "notification_configuration_overrides" :: path) x.notification_configuration_overrides
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__property_bag_option
                  ) (`Field "properties" :: path) x.properties
                with
                  | Some _ as err -> err
                  | None ->
                    match
                      (
                        validate__artifact_location_list_option
                      ) (`Field "response_files" :: path) x.response_files
                    with
                      | Some _ as err -> err
                      | None ->
                        match
                          (
                            validate__configuration_override_list_option
                          ) (`Field "rule_configuration_overrides" :: path) x.rule_configuration_overrides
                        with
                          | Some _ as err -> err
                          | None ->
                            match
                              (
                                validate__artifact_location_option
                              ) (`Field "stderr" :: path) x.stderr
                            with
                              | Some _ as err -> err
                              | None ->
                                match
                                  (
                                    validate__artifact_location_option
                                  ) (`Field "stdin" :: path) x.stdin
                                with
                                  | Some _ as err -> err
                                  | None ->
                                    match
                                      (
                                        validate__artifact_location_option
                                      ) (`Field "stdout" :: path) x.stdout
                                    with
                                      | Some _ as err -> err
                                      | None ->
                                        match
                                          (
                                            validate__artifact_location_option
                                          ) (`Field "stdout_stderr" :: path) x.stdout_stderr
                                        with
                                          | Some _ as err -> err
                                          | None ->
                                            match
                                              (
                                                validate__notification_list_option
                                              ) (`Field "tool_configuration_notifications" :: path) x.tool_configuration_notifications
                                            with
                                              | Some _ as err -> err
                                              | None ->
                                                match
                                                  (
                                                    validate__notification_list_option
                                                  ) (`Field "tool_execution_notifications" :: path) x.tool_execution_notifications
                                                with
                                                  | Some _ as err -> err
                                                  | None ->
                                                    (
                                                      validate__artifact_location_option
                                                    ) (`Field "working_directory" :: path) x.working_directory
)
let validate__invocation_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_invocation
  )
)
let validate_conversion : _ -> conversion -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_conversion" in
    if (Sarif_v_2_1_0_util.validate_conversion) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__artifact_location_list_option
          ) (`Field "analysis_tool_log_files" :: path) x.analysis_tool_log_files
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__invocation_option
              ) (`Field "invocation" :: path) x.invocation
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__property_bag_option
                  ) (`Field "properties" :: path) x.properties
                with
                  | Some _ as err -> err
                  | None ->
                    (
                      validate_tool
                    ) (`Field "tool" :: path) x.tool
)
let validate__result_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_result
  )
)
let validate__conversion_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_conversion
  )
)
let rec validate__artifact_list path x = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_artifact
  )
) path x
and validate__artifact_list_option path x = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__artifact_list
  )
) path x
and validate__external_properties_option path x = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_external_properties
  )
) path x
and validate_artifact : _ -> artifact -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_artifact" in
    if (Sarif_v_2_1_0_util.validate_artifact) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__artifact_content_option
          ) (`Field "contents" :: path) x.contents
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__message_option
              ) (`Field "description" :: path) x.description
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__artifact_location_option
                  ) (`Field "location" :: path) x.location
                with
                  | Some _ as err -> err
                  | None ->
                    match
                      (
                        validate__artifact_mimetype_option
                      ) (`Field "mime_type" :: path) x.mime_type
                    with
                      | Some _ as err -> err
                      | None ->
                        (
                          validate__external_properties_option
                        ) (`Field "properties" :: path) x.properties
)
and validate_external_properties : _ -> external_properties -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_external_properties" in
    if (Sarif_v_2_1_0_util.validate_external_properties) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__address_list_option
          ) (`Field "addresses" :: path) x.addresses
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__artifact_list_option
              ) (`Field "artifacts" :: path) x.artifacts
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__conversion_option
                  ) (`Field "conversion" :: path) x.conversion
                with
                  | Some _ as err -> err
                  | None ->
                    match
                      (
                        validate__tool_component_option
                      ) (`Field "driver" :: path) x.driver
                    with
                      | Some _ as err -> err
                      | None ->
                        match
                          (
                            validate__tool_component_list_option
                          ) (`Field "extensions" :: path) x.extensions
                        with
                          | Some _ as err -> err
                          | None ->
                            match
                              (
                                validate__property_bag_option
                              ) (`Field "externalized_properties" :: path) x.externalized_properties
                            with
                              | Some _ as err -> err
                              | None ->
                                match
                                  (
                                    validate__graph_list_option
                                  ) (`Field "graph" :: path) x.graph
                                with
                                  | Some _ as err -> err
                                  | None ->
                                    match
                                      (
                                        validate__external_properties_guid_option
                                      ) (`Field "guid" :: path) x.guid
                                    with
                                      | Some _ as err -> err
                                      | None ->
                                        match
                                          (
                                            validate__invocation_option
                                          ) (`Field "invocations" :: path) x.invocations
                                        with
                                          | Some _ as err -> err
                                          | None ->
                                            match
                                              (
                                                validate__logical_location_list_option
                                              ) (`Field "logical_locations" :: path) x.logical_locations
                                            with
                                              | Some _ as err -> err
                                              | None ->
                                                match
                                                  (
                                                    validate__tool_component_list_option
                                                  ) (`Field "policies" :: path) x.policies
                                                with
                                                  | Some _ as err -> err
                                                  | None ->
                                                    match
                                                      (
                                                        validate__property_bag_option
                                                      ) (`Field "properties" :: path) x.properties
                                                    with
                                                      | Some _ as err -> err
                                                      | None ->
                                                        match
                                                          (
                                                            validate__result_option
                                                          ) (`Field "results" :: path) x.results
                                                        with
                                                          | Some _ as err -> err
                                                          | None ->
                                                            match
                                                              (
                                                                validate__external_properties_run_guid_option
                                                              ) (`Field "run_guid" :: path) x.run_guid
                                                            with
                                                              | Some _ as err -> err
                                                              | None ->
                                                                match
                                                                  (
                                                                    validate__tool_component_list_option
                                                                  ) (`Field "taxonomies" :: path) x.taxonomies
                                                                with
                                                                  | Some _ as err -> err
                                                                  | None ->
                                                                    match
                                                                      (
                                                                        validate__thread_flow_location_list_option
                                                                      ) (`Field "thread_flow_locations" :: path) x.thread_flow_locations
                                                                    with
                                                                      | Some _ as err -> err
                                                                      | None ->
                                                                        match
                                                                          (
                                                                            validate__tool_component_list_option
                                                                          ) (`Field "translations" :: path) x.translations
                                                                        with
                                                                          | Some _ as err -> err
                                                                          | None ->
                                                                            match
                                                                              (
                                                                                validate__web_request_list_option
                                                                              ) (`Field "web_requests" :: path) x.web_requests
                                                                            with
                                                                              | Some _ as err -> err
                                                                              | None ->
                                                                                (
                                                                                  validate__web_response_list_option
                                                                                ) (`Field "web_responses" :: path) x.web_responses
)
let validate_version_control_details : _ -> version_control_details -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_version_control_details" in
    if (Sarif_v_2_1_0_util.validate_version_control_details) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__artifact_location_option
          ) (`Field "mapped_to" :: path) x.mapped_to
        with
          | Some _ as err -> err
          | None ->
            (
              validate__property_bag_option
            ) (`Field "properties" :: path) x.properties
)
let validate_special_locations : _ -> special_locations -> _ = (
  fun path x ->
    match
      (
        validate__artifact_location_option
      ) (`Field "display_base" :: path) x.display_base
    with
      | Some _ as err -> err
      | None ->
        (
          validate__property_bag_option
        ) (`Field "properties" :: path) x.properties
)
let validate_sarif_version = (
  fun _ _ -> None
)
let validate_run_language = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_run_language" in
    if (Sarif_v_2_1_0_util.validate_run_language) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate_run_column_kind = (
  fun _ _ -> None
)
let validate_run_baseline_guid = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_run_baseline_guid" in
    if (Sarif_v_2_1_0_util.validate_run_baseline_guid) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate_run_automation_details_guid = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_run_automation_details_guid" in
    if (Sarif_v_2_1_0_util.validate_run_automation_details_guid) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate_run_automation_details_correlation_guid = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_run_automation_details_correlation_guid" in
    if (Sarif_v_2_1_0_util.validate_run_automation_details_correlation_guid) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate__run_automation_details_guid_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_run_automation_details_guid
  )
)
let validate__option_46715fb = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_run_automation_details_correlation_guid
  )
)
let validate_run_automation_details : _ -> run_automation_details -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_run_automation_details" in
    if (Sarif_v_2_1_0_util.validate_run_automation_details) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__option_46715fb
          ) (`Field "correlation_guid" :: path) x.correlation_guid
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__message_option
              ) (`Field "description" :: path) x.description
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__run_automation_details_guid_option
                  ) (`Field "guid" :: path) x.guid
                with
                  | Some _ as err -> err
                  | None ->
                    (
                      validate__property_bag_option
                    ) (`Field "properties" :: path) x.properties
)
let validate__x_9eb6bac = (
  Atdgen_runtime.Ov_run.validate_list (
    fun path x ->
      (let _, x = x in
      (
        validate_artifact_location
      ) (`Index 1 :: path) x
      )
  )
)
let validate_hm_str_al = (
  validate__x_9eb6bac
)
let validate_external_property_file_reference_guid = (
  fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_external_property_file_reference_guid" in
    if (Sarif_v_2_1_0_util.validate_external_property_file_reference_guid) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path)
)
let validate__option_9c938c9 = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_external_property_file_reference_guid
  )
)
let validate_external_property_file_reference : _ -> external_property_file_reference -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_external_property_file_reference" in
    if (Sarif_v_2_1_0_util.validate_external_property_file_reference) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__option_9c938c9
          ) (`Field "guid" :: path) x.guid
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__artifact_location_option
              ) (`Field "location" :: path) x.location
            with
              | Some _ as err -> err
              | None ->
                (
                  validate__property_bag_option
                ) (`Field "properties" :: path) x.properties
)
let validate__external_property_file_reference_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_external_property_file_reference
  )
)
let validate__option_927609b = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__external_property_file_reference_list
  )
)
let validate__external_property_file_reference_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_external_property_file_reference
  )
)
let validate_external_property_file_references : _ -> external_property_file_references -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_external_property_file_references" in
    if (Sarif_v_2_1_0_util.validate_external_property_file_references) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__option_927609b
          ) (`Field "addresses" :: path) x.addresses
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__option_927609b
              ) (`Field "artifacts" :: path) x.artifacts
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__external_property_file_reference_option
                  ) (`Field "conversion" :: path) x.conversion
                with
                  | Some _ as err -> err
                  | None ->
                    match
                      (
                        validate__external_property_file_reference_option
                      ) (`Field "driver" :: path) x.driver
                    with
                      | Some _ as err -> err
                      | None ->
                        match
                          (
                            validate__option_927609b
                          ) (`Field "extensions" :: path) x.extensions
                        with
                          | Some _ as err -> err
                          | None ->
                            match
                              (
                                validate__external_property_file_reference_option
                              ) (`Field "externalized_properties" :: path) x.externalized_properties
                            with
                              | Some _ as err -> err
                              | None ->
                                match
                                  (
                                    validate__option_927609b
                                  ) (`Field "graphs" :: path) x.graphs
                                with
                                  | Some _ as err -> err
                                  | None ->
                                    match
                                      (
                                        validate__option_927609b
                                      ) (`Field "invocations" :: path) x.invocations
                                    with
                                      | Some _ as err -> err
                                      | None ->
                                        match
                                          (
                                            validate__option_927609b
                                          ) (`Field "logical_locations" :: path) x.logical_locations
                                        with
                                          | Some _ as err -> err
                                          | None ->
                                            match
                                              (
                                                validate__option_927609b
                                              ) (`Field "policies" :: path) x.policies
                                            with
                                              | Some _ as err -> err
                                              | None ->
                                                match
                                                  (
                                                    validate__property_bag_option
                                                  ) (`Field "properties" :: path) x.properties
                                                with
                                                  | Some _ as err -> err
                                                  | None ->
                                                    match
                                                      (
                                                        validate__option_927609b
                                                      ) (`Field "results" :: path) x.results
                                                    with
                                                      | Some _ as err -> err
                                                      | None ->
                                                        match
                                                          (
                                                            validate__option_927609b
                                                          ) (`Field "taxonomies" :: path) x.taxonomies
                                                        with
                                                          | Some _ as err -> err
                                                          | None ->
                                                            match
                                                              (
                                                                validate__option_927609b
                                                              ) (`Field "thread_flow_locations" :: path) x.thread_flow_locations
                                                            with
                                                              | Some _ as err -> err
                                                              | None ->
                                                                match
                                                                  (
                                                                    validate__option_927609b
                                                                  ) (`Field "translations" :: path) x.translations
                                                                with
                                                                  | Some _ as err -> err
                                                                  | None ->
                                                                    match
                                                                      (
                                                                        validate__option_927609b
                                                                      ) (`Field "web_requests" :: path) x.web_requests
                                                                    with
                                                                      | Some _ as err -> err
                                                                      | None ->
                                                                        (
                                                                          validate__option_927609b
                                                                        ) (`Field "web_responses" :: path) x.web_responses
)
let validate__version_control_details_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_version_control_details
  )
)
let validate__version_control_details_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__version_control_details_list
  )
)
let validate__special_locations_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_special_locations
  )
)
let validate__run_language_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_run_language
  )
)
let validate__run_column_kind_option = (
  fun _ _ -> None
)
let validate__run_baseline_guid_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_run_baseline_guid
  )
)
let validate__run_automation_details_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_run_automation_details
  )
)
let validate__run_automation_details_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_run_automation_details
  )
)
let validate__run_automation_details_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__run_automation_details_list
  )
)
let validate__result_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_result
  )
)
let validate__result_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__result_list
  )
)
let validate__invocation_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_invocation
  )
)
let validate__invocation_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__invocation_list
  )
)
let validate__hm_str_al_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_hm_str_al
  )
)
let validate__external_property_file_references_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate_external_property_file_references
  )
)
let validate_run : _ -> run -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_run" in
    if (Sarif_v_2_1_0_util.validate_run) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__address_list_option
          ) (`Field "addresses" :: path) x.addresses
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__artifact_list_option
              ) (`Field "artifacts" :: path) x.artifacts
            with
              | Some _ as err -> err
              | None ->
                match
                  (
                    validate__run_automation_details_option
                  ) (`Field "automation_details" :: path) x.automation_details
                with
                  | Some _ as err -> err
                  | None ->
                    match
                      (
                        validate__run_baseline_guid_option
                      ) (`Field "baseline_guid" :: path) x.baseline_guid
                    with
                      | Some _ as err -> err
                      | None ->
                        match
                          (
                            validate__conversion_option
                          ) (`Field "conversion" :: path) x.conversion
                        with
                          | Some _ as err -> err
                          | None ->
                            match
                              (
                                validate__external_property_file_references_option
                              ) (`Field "external_property_file_references" :: path) x.external_property_file_references
                            with
                              | Some _ as err -> err
                              | None ->
                                match
                                  (
                                    validate__graph_list_option
                                  ) (`Field "graphs" :: path) x.graphs
                                with
                                  | Some _ as err -> err
                                  | None ->
                                    match
                                      (
                                        validate__invocation_list_option
                                      ) (`Field "invocations" :: path) x.invocations
                                    with
                                      | Some _ as err -> err
                                      | None ->
                                        match
                                          (
                                            validate__run_language_option
                                          ) (`Field "language" :: path) x.language
                                        with
                                          | Some _ as err -> err
                                          | None ->
                                            match
                                              (
                                                validate__logical_location_list_option
                                              ) (`Field "logical_locations" :: path) x.logical_locations
                                            with
                                              | Some _ as err -> err
                                              | None ->
                                                match
                                                  (
                                                    validate__hm_str_al_option
                                                  ) (`Field "original_uri_base_ids" :: path) x.original_uri_base_ids
                                                with
                                                  | Some _ as err -> err
                                                  | None ->
                                                    match
                                                      (
                                                        validate__tool_component_list_option
                                                      ) (`Field "policies" :: path) x.policies
                                                    with
                                                      | Some _ as err -> err
                                                      | None ->
                                                        match
                                                          (
                                                            validate__property_bag_option
                                                          ) (`Field "properties" :: path) x.properties
                                                        with
                                                          | Some _ as err -> err
                                                          | None ->
                                                            match
                                                              (
                                                                validate__result_list_option
                                                              ) (`Field "results" :: path) x.results
                                                            with
                                                              | Some _ as err -> err
                                                              | None ->
                                                                match
                                                                  (
                                                                    validate__run_automation_details_list_option
                                                                  ) (`Field "run_aggregates" :: path) x.run_aggregates
                                                                with
                                                                  | Some _ as err -> err
                                                                  | None ->
                                                                    match
                                                                      (
                                                                        validate__special_locations_option
                                                                      ) (`Field "special_locations" :: path) x.special_locations
                                                                    with
                                                                      | Some _ as err -> err
                                                                      | None ->
                                                                        match
                                                                          (
                                                                            validate__tool_component_list_option
                                                                          ) (`Field "taxonomies" :: path) x.taxonomies
                                                                        with
                                                                          | Some _ as err -> err
                                                                          | None ->
                                                                            match
                                                                              (
                                                                                validate__thread_flow_location_list_option
                                                                              ) (`Field "thread_flow_locations" :: path) x.thread_flow_locations
                                                                            with
                                                                              | Some _ as err -> err
                                                                              | None ->
                                                                                match
                                                                                  (
                                                                                    validate_tool
                                                                                  ) (`Field "tool" :: path) x.tool
                                                                                with
                                                                                  | Some _ as err -> err
                                                                                  | None ->
                                                                                    match
                                                                                      (
                                                                                        validate__tool_component_list_option
                                                                                      ) (`Field "translations" :: path) x.translations
                                                                                    with
                                                                                      | Some _ as err -> err
                                                                                      | None ->
                                                                                        match
                                                                                          (
                                                                                            validate__version_control_details_list_option
                                                                                          ) (`Field "version_control_provenance" :: path) x.version_control_provenance
                                                                                        with
                                                                                          | Some _ as err -> err
                                                                                          | None ->
                                                                                            match
                                                                                              (
                                                                                                validate__web_request_list_option
                                                                                              ) (`Field "web_requests" :: path) x.web_requests
                                                                                            with
                                                                                              | Some _ as err -> err
                                                                                              | None ->
                                                                                                (
                                                                                                  validate__web_response_list_option
                                                                                                ) (`Field "web_responses" :: path) x.web_responses
)
let validate__run_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_run
  )
)
let validate__external_properties_list = (
  Atdgen_runtime.Ov_run.validate_list (
    validate_external_properties
  )
)
let validate__external_properties_list_option = (
  Atdgen_runtime.Ov_run.validate_option (
    validate__external_properties_list
  )
)
let validate_sarif_json_schema : _ -> sarif_json_schema -> _ = (
  fun path x ->
    match ( fun path x ->
    let msg = "Failed check by Sarif_v_2_1_0_util.validate_sarif_json_schema" in
    if (Sarif_v_2_1_0_util.validate_sarif_json_schema) x then
      None
    else
      Some (Atdgen_runtime.Util.Validation.error ~msg path) ) path x with
      | Some _ as err -> err
      | None ->
        match
          (
            validate__external_properties_list_option
          ) (`Field "inline_external_properties" :: path) x.inline_external_properties
        with
          | Some _ as err -> err
          | None ->
            match
              (
                validate__property_bag_option
              ) (`Field "properties" :: path) x.properties
            with
              | Some _ as err -> err
              | None ->
                (
                  validate__run_list
                ) (`Field "runs" :: path) x.runs
)
let create_address 
  ?(absolute_address = -1L)
  ?fully_qualified_name
  ?(index = -1L)
  ?kind
  ?length
  ?name
  ?offset_from_parent
  ?(parent_index = -1L)
  ?properties
  ?relative_address
  () : address =
  {
    absolute_address = absolute_address;
    fully_qualified_name = fully_qualified_name;
    index = index;
    kind = kind;
    length = length;
    name = name;
    offset_from_parent = offset_from_parent;
    parent_index = parent_index;
    properties = properties;
    relative_address = relative_address;
  }
let create_logical_location 
  ?decorated_name
  ?fully_qualified_name
  ?(index = -1L)
  ?kind
  ?name
  ?(parent_index = -1L)
  ?properties
  () : logical_location =
  {
    decorated_name = decorated_name;
    fully_qualified_name = fully_qualified_name;
    index = index;
    kind = kind;
    name = name;
    parent_index = parent_index;
    properties = properties;
  }
let create_message 
  ?arguments
  ?id
  ?markdown
  ?properties
  ?text
  () : message =
  {
    arguments = arguments;
    id = id;
    markdown = markdown;
    properties = properties;
    text = text;
  }
let create_artifact_location 
  ?description
  ?(index = -1L)
  ?properties
  ?uri
  ?uri_base_id
  () : artifact_location =
  {
    description = description;
    index = index;
    properties = properties;
    uri = uri;
    uri_base_id = uri_base_id;
  }
let create_edge 
  ~id
  ?label
  ?properties
  ~source_node_id
  ~target_node_id
  () : edge =
  {
    id = id;
    label = label;
    properties = properties;
    source_node_id = source_node_id;
    target_node_id = target_node_id;
  }
let create_location_relationship 
  ?description
  ?kinds
  ?properties
  ~target
  () : location_relationship =
  {
    description = description;
    kinds = kinds;
    properties = properties;
    target = target;
  }
let create_multiformat_message_string 
  ?markdown
  ?properties
  ~text
  () : multiformat_message_string =
  {
    markdown = markdown;
    properties = properties;
    text = text;
  }
let create_artifact_content 
  ?binary
  ?properties
  ?rendered
  ?text
  () : artifact_content =
  {
    binary = binary;
    properties = properties;
    rendered = rendered;
    text = text;
  }
let create_edge_traversal 
  ~edge_id
  ?final_state
  ?message
  ?properties
  ?step_over_edge_count
  () : edge_traversal =
  {
    edge_id = edge_id;
    final_state = final_state;
    message = message;
    properties = properties;
    step_over_edge_count = step_over_edge_count;
  }
let create_graph_traversal_variant0 
  ?description
  ?edge_traversals
  ?immutable_state
  ?initial_state
  ?properties
  ?(result_graph_index = -1L)
  ?(run_graph_index = -1L)
  () : graph_traversal_variant0 =
  {
    description = description;
    edge_traversals = edge_traversals;
    immutable_state = immutable_state;
    initial_state = initial_state;
    properties = properties;
    result_graph_index = result_graph_index;
    run_graph_index = run_graph_index;
  }
let create_graph_traversal_variant1 
  ?description
  ?edge_traversals
  ?immutable_state
  ?initial_state
  ?properties
  ?(result_graph_index = -1L)
  ?(run_graph_index = -1L)
  () : graph_traversal_variant1 =
  {
    description = description;
    edge_traversals = edge_traversals;
    immutable_state = immutable_state;
    initial_state = initial_state;
    properties = properties;
    result_graph_index = result_graph_index;
    run_graph_index = run_graph_index;
  }
let create_rectangle 
  ?bottom
  ?left
  ?message
  ?properties
  ?right
  ?top
  () : rectangle =
  {
    bottom = bottom;
    left = left;
    message = message;
    properties = properties;
    right = right;
    top = top;
  }
let create_region 
  ?byte_length
  ?(byte_offset = -1L)
  ?char_length
  ?(char_offset = -1L)
  ?end_column
  ?end_line
  ?message
  ?properties
  ?snippet
  ?source_language
  ?start_column
  ?start_line
  () : region =
  {
    byte_length = byte_length;
    byte_offset = byte_offset;
    char_length = char_length;
    char_offset = char_offset;
    end_column = end_column;
    end_line = end_line;
    message = message;
    properties = properties;
    snippet = snippet;
    source_language = source_language;
    start_column = start_column;
    start_line = start_line;
  }
let create_attachment 
  ~artifact_location
  ?description
  ?properties
  ?rectangles
  ?regions
  () : attachment =
  {
    artifact_location = artifact_location;
    description = description;
    properties = properties;
    rectangles = rectangles;
    regions = regions;
  }
let create_physical_location 
  ?address
  ?artifact_location
  ?context_region
  ?properties
  ?region
  () : physical_location =
  {
    address = address;
    artifact_location = artifact_location;
    context_region = context_region;
    properties = properties;
    region = region;
  }
let create_location 
  ?annotations
  ?(id = -1L)
  ?logical_locations
  ?message
  ?physical_location
  ?properties
  ?relationships
  () : location =
  {
    annotations = annotations;
    id = id;
    logical_locations = logical_locations;
    message = message;
    physical_location = physical_location;
    properties = properties;
    relationships = relationships;
  }
let create_replacement 
  ~deleted_region
  ?inserted_content
  ?properties
  () : replacement =
  {
    deleted_region = deleted_region;
    inserted_content = inserted_content;
    properties = properties;
  }
let create_artifact_change 
  ~artifact_location
  ?properties
  ~replacements
  () : artifact_change =
  {
    artifact_location = artifact_location;
    properties = properties;
    replacements = replacements;
  }
let create_fix 
  ~artifact_changes
  ?description
  ?properties
  () : fix =
  {
    artifact_changes = artifact_changes;
    description = description;
    properties = properties;
  }
let create_reporting_configuration 
  ?(enabled = true)
  ?level
  ?parameters
  ?properties
  ?(rank = -1L)
  () : reporting_configuration =
  {
    enabled = enabled;
    level = level;
    parameters = parameters;
    properties = properties;
    rank = rank;
  }
let create_result_provenance 
  ?conversion_sources
  ?first_detection_run_guid
  ?first_detection_time_utc
  ?(invocation_index = -1L)
  ?last_detection_run_guid
  ?last_detection_time_utc
  ?properties
  () : result_provenance =
  {
    conversion_sources = conversion_sources;
    first_detection_run_guid = first_detection_run_guid;
    first_detection_time_utc = first_detection_time_utc;
    invocation_index = invocation_index;
    last_detection_run_guid = last_detection_run_guid;
    last_detection_time_utc = last_detection_time_utc;
    properties = properties;
  }
let create_stack_frame 
  ?location
  ?module_
  ?parameters
  ?properties
  ?thread_id
  () : stack_frame =
  {
    location = location;
    module_ = module_;
    parameters = parameters;
    properties = properties;
    thread_id = thread_id;
  }
let create_stack 
  ~frames
  ?message
  ?properties
  () : stack =
  {
    frames = frames;
    message = message;
    properties = properties;
  }
let create_suppression 
  ?guid
  ?justification
  ~kind
  ?location
  ?properties
  ?status
  () : suppression =
  {
    guid = guid;
    justification = justification;
    kind = kind;
    location = location;
    properties = properties;
    status = status;
  }
let create_tool_component_reference 
  ?guid
  ?(index = -1L)
  ?name
  ?properties
  () : tool_component_reference =
  {
    guid = guid;
    index = index;
    name = name;
    properties = properties;
  }
let create_reporting_descriptor_reference 
  ?guid
  ?id
  ?(index = -1L)
  ?properties
  ?tool_component
  () : reporting_descriptor_reference =
  {
    guid = guid;
    id = id;
    index = index;
    properties = properties;
    tool_component = tool_component;
  }
let create_configuration_override 
  ~configuration
  ~descriptor
  ?properties
  () : configuration_override =
  {
    configuration = configuration;
    descriptor = descriptor;
    properties = properties;
  }
let create_reporting_descriptor_relationship 
  ?description
  ?kinds
  ?properties
  ~target
  () : reporting_descriptor_relationship =
  {
    description = description;
    kinds = kinds;
    properties = properties;
    target = target;
  }
let create_reporting_descriptor 
  ?default_configuration
  ?deprecated_guids
  ?deprecated_ids
  ?deprecated_names
  ?full_description
  ?guid
  ?help
  ?help_uri
  ~id
  ?message_strings
  ?name
  ?properties
  ?relationships
  ?short_description
  () : reporting_descriptor =
  {
    default_configuration = default_configuration;
    deprecated_guids = deprecated_guids;
    deprecated_ids = deprecated_ids;
    deprecated_names = deprecated_names;
    full_description = full_description;
    guid = guid;
    help = help;
    help_uri = help_uri;
    id = id;
    message_strings = message_strings;
    name = name;
    properties = properties;
    relationships = relationships;
    short_description = short_description;
  }
let create_translation_metadata 
  ?download_uri
  ?full_description
  ?full_name
  ?information_uri
  ~name
  ?properties
  ?short_description
  () : translation_metadata =
  {
    download_uri = download_uri;
    full_description = full_description;
    full_name = full_name;
    information_uri = information_uri;
    name = name;
    properties = properties;
    short_description = short_description;
  }
let create_tool_component 
  ?associated_component
  ?contents
  ?dotted_quad_file_version
  ?download_uri
  ?full_description
  ?full_name
  ?global_message_strings
  ?guid
  ?information_uri
  ?(is_comprehensive = false)
  ?language
  ?localized_data_semantic_version
  ?locations
  ?minimum_required_localized_data_semantic_version
  ~name
  ?notifications
  ?organization
  ?product
  ?product_suite
  ?properties
  ?release_date_utc
  ?rules
  ?semantic_version
  ?short_description
  ?supported_taxonomies
  ?taxa
  ?translation_metadata
  ?version
  () : tool_component =
  {
    associated_component = associated_component;
    contents = contents;
    dotted_quad_file_version = dotted_quad_file_version;
    download_uri = download_uri;
    full_description = full_description;
    full_name = full_name;
    global_message_strings = global_message_strings;
    guid = guid;
    information_uri = information_uri;
    is_comprehensive = is_comprehensive;
    language = language;
    localized_data_semantic_version = localized_data_semantic_version;
    locations = locations;
    minimum_required_localized_data_semantic_version = minimum_required_localized_data_semantic_version;
    name = name;
    notifications = notifications;
    organization = organization;
    product = product;
    product_suite = product_suite;
    properties = properties;
    release_date_utc = release_date_utc;
    rules = rules;
    semantic_version = semantic_version;
    short_description = short_description;
    supported_taxonomies = supported_taxonomies;
    taxa = taxa;
    translation_metadata = translation_metadata;
    version = version;
  }
let create_tool 
  ~driver
  ?extensions
  ?properties
  () : tool =
  {
    driver = driver;
    extensions = extensions;
    properties = properties;
  }
let create_web_request 
  ?body
  ?headers
  ?(index = -1L)
  ?method_
  ?parameters
  ?properties
  ?protocol
  ?target
  ?version
  () : web_request =
  {
    body = body;
    headers = headers;
    index = index;
    method_ = method_;
    parameters = parameters;
    properties = properties;
    protocol = protocol;
    target = target;
    version = version;
  }
let create_web_response 
  ?body
  ?headers
  ?(index = -1L)
  ?(no_response_received = false)
  ?properties
  ?protocol
  ?reason_phrase
  ?status_code
  ?version
  () : web_response =
  {
    body = body;
    headers = headers;
    index = index;
    no_response_received = no_response_received;
    properties = properties;
    protocol = protocol;
    reason_phrase = reason_phrase;
    status_code = status_code;
    version = version;
  }
let create_thread_flow_location 
  ?(execution_order = -1L)
  ?execution_time_utc
  ?importance
  ?(index = -1L)
  ?kinds
  ?location
  ?module_
  ?nesting_level
  ?properties
  ?stack
  ?state
  ?taxa
  ?web_request
  ?web_response
  () : thread_flow_location =
  {
    execution_order = execution_order;
    execution_time_utc = execution_time_utc;
    importance = importance;
    index = index;
    kinds = kinds;
    location = location;
    module_ = module_;
    nesting_level = nesting_level;
    properties = properties;
    stack = stack;
    state = state;
    taxa = taxa;
    web_request = web_request;
    web_response = web_response;
  }
let create_thread_flow 
  ?id
  ?immutable_state
  ?initial_state
  ~locations
  ?message
  ?properties
  () : thread_flow =
  {
    id = id;
    immutable_state = immutable_state;
    initial_state = initial_state;
    locations = locations;
    message = message;
    properties = properties;
  }
let create_code_flow 
  ?message
  ?properties
  ~thread_flows
  () : code_flow =
  {
    message = message;
    properties = properties;
    thread_flows = thread_flows;
  }
let create_node 
  ?children
  ~id
  ?label
  ?location
  ?properties
  () : node =
  {
    children = children;
    id = id;
    label = label;
    location = location;
    properties = properties;
  }
let create_exception_ 
  ?inner_exceptions
  ?kind
  ?message
  ?properties
  ?stack
  () : exception_ =
  {
    inner_exceptions = inner_exceptions;
    kind = kind;
    message = message;
    properties = properties;
    stack = stack;
  }
let create_graph 
  ?description
  ?edges
  ?nodes
  ?properties
  () : graph =
  {
    description = description;
    edges = edges;
    nodes = nodes;
    properties = properties;
  }
let create_result 
  ?analysis_target
  ?attachments
  ?baseline_state
  ?code_flows
  ?correlation_guid
  ?fingerprints
  ?fixes
  ?graph_traversals
  ?graphs
  ?guid
  ?hosted_viewer_uri
  ?kind
  ?level
  ?locations
  ~message
  ?occurrence_count
  ?partial_fingerprints
  ?properties
  ?provenance
  ?(rank = -1L)
  ?related_locations
  ?rule
  ?rule_id
  ?(rule_index = -1L)
  ?stacks
  ?suppressions
  ?taxa
  ?web_request
  ?web_response
  ?work_item_uris
  () : result =
  {
    analysis_target = analysis_target;
    attachments = attachments;
    baseline_state = baseline_state;
    code_flows = code_flows;
    correlation_guid = correlation_guid;
    fingerprints = fingerprints;
    fixes = fixes;
    graph_traversals = graph_traversals;
    graphs = graphs;
    guid = guid;
    hosted_viewer_uri = hosted_viewer_uri;
    kind = kind;
    level = level;
    locations = locations;
    message = message;
    occurrence_count = occurrence_count;
    partial_fingerprints = partial_fingerprints;
    properties = properties;
    provenance = provenance;
    rank = rank;
    related_locations = related_locations;
    rule = rule;
    rule_id = rule_id;
    rule_index = rule_index;
    stacks = stacks;
    suppressions = suppressions;
    taxa = taxa;
    web_request = web_request;
    web_response = web_response;
    work_item_uris = work_item_uris;
  }
let create_notification 
  ?associated_rule
  ?descriptor
  ?exception_
  ?level
  ?locations
  ~message
  ?properties
  ?thread_id
  ?time_utc
  () : notification =
  {
    associated_rule = associated_rule;
    descriptor = descriptor;
    exception_ = exception_;
    level = level;
    locations = locations;
    message = message;
    properties = properties;
    thread_id = thread_id;
    time_utc = time_utc;
  }
let create_invocation 
  ?account
  ?arguments
  ?command_line
  ?end_time_utc
  ?environment_variables
  ?executable_location
  ~execution_successful
  ?exit_code
  ?exit_code_description
  ?exit_signal_name
  ?exit_signal_number
  ?notification_configuration_overrides
  ?process_id
  ?process_start_failure_message
  ?properties
  ?response_files
  ?rule_configuration_overrides
  ?start_time_utc
  ?stderr
  ?stdin
  ?stdout
  ?stdout_stderr
  ?tool_configuration_notifications
  ?tool_execution_notifications
  ?working_directory
  () : invocation =
  {
    account = account;
    arguments = arguments;
    command_line = command_line;
    end_time_utc = end_time_utc;
    environment_variables = environment_variables;
    executable_location = executable_location;
    execution_successful = execution_successful;
    exit_code = exit_code;
    exit_code_description = exit_code_description;
    exit_signal_name = exit_signal_name;
    exit_signal_number = exit_signal_number;
    notification_configuration_overrides = notification_configuration_overrides;
    process_id = process_id;
    process_start_failure_message = process_start_failure_message;
    properties = properties;
    response_files = response_files;
    rule_configuration_overrides = rule_configuration_overrides;
    start_time_utc = start_time_utc;
    stderr = stderr;
    stdin = stdin;
    stdout = stdout;
    stdout_stderr = stdout_stderr;
    tool_configuration_notifications = tool_configuration_notifications;
    tool_execution_notifications = tool_execution_notifications;
    working_directory = working_directory;
  }
let create_conversion 
  ?analysis_tool_log_files
  ?invocation
  ?properties
  ~tool
  () : conversion =
  {
    analysis_tool_log_files = analysis_tool_log_files;
    invocation = invocation;
    properties = properties;
    tool = tool;
  }
let create_artifact 
  ?contents
  ?description
  ?encoding
  ?hashes
  ?last_modified_time_utc
  ?(length = -1L)
  ?location
  ?mime_type
  ?offset
  ?(parent_index = -1L)
  ?properties
  ?roles
  ?source_language
  () : artifact =
  {
    contents = contents;
    description = description;
    encoding = encoding;
    hashes = hashes;
    last_modified_time_utc = last_modified_time_utc;
    length = length;
    location = location;
    mime_type = mime_type;
    offset = offset;
    parent_index = parent_index;
    properties = properties;
    roles = roles;
    source_language = source_language;
  }
let create_external_properties 
  ?addresses
  ?artifacts
  ?conversion
  ?driver
  ?extensions
  ?externalized_properties
  ?graph
  ?guid
  ?invocations
  ?logical_locations
  ?policies
  ?properties
  ?results
  ?run_guid
  ?schema
  ?taxonomies
  ?thread_flow_locations
  ?translations
  ?version
  ?web_requests
  ?web_responses
  () : external_properties =
  {
    addresses = addresses;
    artifacts = artifacts;
    conversion = conversion;
    driver = driver;
    extensions = extensions;
    externalized_properties = externalized_properties;
    graph = graph;
    guid = guid;
    invocations = invocations;
    logical_locations = logical_locations;
    policies = policies;
    properties = properties;
    results = results;
    run_guid = run_guid;
    schema = schema;
    taxonomies = taxonomies;
    thread_flow_locations = thread_flow_locations;
    translations = translations;
    version = version;
    web_requests = web_requests;
    web_responses = web_responses;
  }
let create_version_control_details 
  ?as_of_time_utc
  ?branch
  ?mapped_to
  ?properties
  ~repository_uri
  ?revision_id
  ?revision_tag
  () : version_control_details =
  {
    as_of_time_utc = as_of_time_utc;
    branch = branch;
    mapped_to = mapped_to;
    properties = properties;
    repository_uri = repository_uri;
    revision_id = revision_id;
    revision_tag = revision_tag;
  }
let create_special_locations 
  ?display_base
  ?properties
  () : special_locations =
  {
    display_base = display_base;
    properties = properties;
  }
let create_run_automation_details 
  ?correlation_guid
  ?description
  ?guid
  ?id
  ?properties
  () : run_automation_details =
  {
    correlation_guid = correlation_guid;
    description = description;
    guid = guid;
    id = id;
    properties = properties;
  }
let create_external_property_file_reference 
  ?guid
  ?(item_count = -1L)
  ?location
  ?properties
  () : external_property_file_reference =
  {
    guid = guid;
    item_count = item_count;
    location = location;
    properties = properties;
  }
let create_external_property_file_references 
  ?addresses
  ?artifacts
  ?conversion
  ?driver
  ?extensions
  ?externalized_properties
  ?graphs
  ?invocations
  ?logical_locations
  ?policies
  ?properties
  ?results
  ?taxonomies
  ?thread_flow_locations
  ?translations
  ?web_requests
  ?web_responses
  () : external_property_file_references =
  {
    addresses = addresses;
    artifacts = artifacts;
    conversion = conversion;
    driver = driver;
    extensions = extensions;
    externalized_properties = externalized_properties;
    graphs = graphs;
    invocations = invocations;
    logical_locations = logical_locations;
    policies = policies;
    properties = properties;
    results = results;
    taxonomies = taxonomies;
    thread_flow_locations = thread_flow_locations;
    translations = translations;
    web_requests = web_requests;
    web_responses = web_responses;
  }
let create_run 
  ?addresses
  ?artifacts
  ?automation_details
  ?baseline_guid
  ?column_kind
  ?conversion
  ?default_encoding
  ?default_source_language
  ?external_property_file_references
  ?graphs
  ?invocations
  ?language
  ?logical_locations
  ?(newline_sequences = ["\r\n"; "\n"])
  ?original_uri_base_ids
  ?policies
  ?properties
  ?redaction_tokens
  ?results
  ?run_aggregates
  ?special_locations
  ?taxonomies
  ?thread_flow_locations
  ~tool
  ?translations
  ?version_control_provenance
  ?web_requests
  ?web_responses
  () : run =
  {
    addresses = addresses;
    artifacts = artifacts;
    automation_details = automation_details;
    baseline_guid = baseline_guid;
    column_kind = column_kind;
    conversion = conversion;
    default_encoding = default_encoding;
    default_source_language = default_source_language;
    external_property_file_references = external_property_file_references;
    graphs = graphs;
    invocations = invocations;
    language = language;
    logical_locations = logical_locations;
    newline_sequences = newline_sequences;
    original_uri_base_ids = original_uri_base_ids;
    policies = policies;
    properties = properties;
    redaction_tokens = redaction_tokens;
    results = results;
    run_aggregates = run_aggregates;
    special_locations = special_locations;
    taxonomies = taxonomies;
    thread_flow_locations = thread_flow_locations;
    tool = tool;
    translations = translations;
    version_control_provenance = version_control_provenance;
    web_requests = web_requests;
    web_responses = web_responses;
  }
let create_sarif_json_schema 
  ~version
  ?inline_external_properties
  ?properties
  ~runs
  ?schema
  () : sarif_json_schema =
  {
    version = version;
    inline_external_properties = inline_external_properties;
    properties = properties;
    runs = runs;
    schema = schema;
  }
