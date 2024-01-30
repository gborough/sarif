(* Auto-generated from "sarif_v_2_1_0.atd" *)
[@@@ocaml.warning "-27-32-33-35-39"]

(** The MIME type (RFC 2045) of the artifact. *)
type artifact_mimetype = Sarif_v_2_1_0_t.artifact_mimetype [@@deriving show, eq]

(** ArtifactRolesItem *)
type artifact_roles_item = Sarif_v_2_1_0_t.artifact_roles_item [@@deriving show, eq]

(** A stable, unique identifier for this external properties object, in the
    form of a GUID. *)
type external_properties_guid = Sarif_v_2_1_0_t.external_properties_guid
[@@deriving show, eq]

(** A stable, unique identifier for the run associated with this external
    properties object, in the form of a GUID. *)
type external_properties_run_guid = Sarif_v_2_1_0_t.external_properties_run_guid
[@@deriving show, eq]

type external_properties_version = Sarif_v_2_1_0_t.external_properties_version
[@@deriving show, eq]

type hm_str_str = Sarif_v_2_1_0_t.hm_str_str [@@deriving show, eq]
type int64 = Sarif_v_2_1_0_t.int64 [@@deriving show, eq]

(** A value specifying the severity level of the notification. *)
type notification_level = Sarif_v_2_1_0_t.notification_level [@@deriving show, eq]

(** Key/value pairs that provide additional information about the object. *)
type property_bag = Sarif_v_2_1_0_t.property_bag [@@deriving show, eq]

(** A physical or virtual address, or a range of addresses, in an 'addressable
    region' (memory or a binary file). *)
type address = Sarif_v_2_1_0_t.address =
  { absolute_address : int64
  (** The address expressed as a byte offset from the start of the
      addressable region. *)
  ; fully_qualified_name : string option
  (** A human-readable fully qualified name that is associated with the
      address. *)
  ; index : int64
  (** The index within run.addresses of the cached object for this address. *)
  ; kind : string option
  (** An open-ended string that identifies the address kind. 'data',
      'function', 'header','instruction', 'module', 'page', 'section',
      'segment', 'stack', 'stackFrame', 'table' are well-known values. *)
  ; length : int64 option (** The number of bytes in this range of addresses. *)
  ; name : string option (** A name that is associated with the address, e.g., '.text'. *)
  ; offset_from_parent : int64 option
  (** The byte offset of this address from the absolute or relative address
      of the parent object. *)
  ; parent_index : int64 (** The index within run.addresses of the parent object. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the address. *)
  ; relative_address : int64 option
  (** The address expressed as a byte offset from the absolute address of the
      top-most parent object. *)
  }
[@@deriving show, eq]

(** A logical location of a construct that produced a result. *)
type logical_location = Sarif_v_2_1_0_t.logical_location =
  { decorated_name : string option
  (** The machine-readable name for the logical location, such as a mangled
      function name provided by a C++ compiler that encodes calling
      convention, return type and other details along with the function name. *)
  ; fully_qualified_name : string option
  (** The human-readable fully qualified name of the logical location. *)
  ; index : int64 (** The index within the logical locations array. *)
  ; kind : string option
  (** The type of construct this logical location component refers to. Should
      be one of 'function', 'member', 'module', 'namespace', 'parameter',
      'resource', 'returnType', 'type', 'variable', 'object', 'array',
      'property', 'value', 'element', 'text', 'attribute', 'comment',
      'declaration', 'dtd' or 'processingInstruction', if any of those
      accurately describe the construct. *)
  ; name : string option
  (** Identifies the construct in which the result occurred. For example,
      this property might contain the name of a class or a method. *)
  ; parent_index : int64
  (** Identifies the index of the immediate parent of the construct in which
      the result was detected. For example, this property might point to a
      logical location that represents the namespace that holds a type. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the logical
      location. *)
  }
[@@deriving show, eq]

(** Encapsulates a message intended to be read by the end user. *)
type message = Sarif_v_2_1_0_t.message =
  { arguments : string list option
  (** An array of strings to substitute into the message string. *)
  ; id : string option (** The identifier for this message. *)
  ; markdown : string option (** A Markdown message string. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the message. *)
  ; text : string option (** A plain text message string. *)
  }
[@@deriving show, eq]

(** Specifies the location of an artifact. *)
type artifact_location = Sarif_v_2_1_0_t.artifact_location =
  { description : message option (** A short description of the artifact location. *)
  ; index : int64
  (** The index within the run artifacts array of the artifact object
      associated with the artifact location. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the artifact
      location. *)
  ; uri : string option (** A string containing a valid relative or absolute URI. *)
  ; uri_base_id : string option
  (** A string which indirectly specifies the absolute URI with respect to
      which a relative URI in the "uri" property is interpreted. *)
  }
[@@deriving show, eq]

(** Represents a directed edge in a graph. *)
type edge = Sarif_v_2_1_0_t.edge =
  { id : string (** A string that uniquely identifies the edge within its graph. *)
  ; label : message option (** A short description of the edge. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the edge. *)
  ; source_node_id : string
  (** Identifies the source node (the node at which the edge starts). *)
  ; target_node_id : string
  (** Identifies the target node (the node at which the edge ends). *)
  }
[@@deriving show, eq]

(** Information about the relation of one location to another. *)
type location_relationship = Sarif_v_2_1_0_t.location_relationship =
  { description : message option (** A description of the location relationship. *)
  ; kinds : string list option
  (** A set of distinct strings that categorize the relationship. Well-known
      kinds include 'includes', 'isIncludedBy' and 'relevant'. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the location
      relationship. *)
  ; target : int64 (** A reference to the related location. *)
  }
[@@deriving show, eq]

(** A message string or message format string rendered in multiple formats. *)
type multiformat_message_string = Sarif_v_2_1_0_t.multiformat_message_string =
  { markdown : string option (** A Markdown message string or format string. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the message. *)
  ; text : string (** A plain text message string or format string. *)
  }
[@@deriving show, eq]

(** Represents the contents of an artifact. *)
type artifact_content = Sarif_v_2_1_0_t.artifact_content =
  { binary : string option
  (** MIME Base64-encoded content from a binary artifact, or from a text
      artifact in its original encoding. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the artifact
      content. *)
  ; rendered : multiformat_message_string option
  (** An alternate rendered representation of the artifact (e.g., a
      decompiled representation of a binary region). *)
  ; text : string option (** UTF-8-encoded content from a text artifact. *)
  }
[@@deriving show, eq]

type hm_str_mms = Sarif_v_2_1_0_t.hm_str_mms [@@deriving show, eq]

(** Represents the traversal of a single edge during a graph traversal. *)
type edge_traversal = Sarif_v_2_1_0_t.edge_traversal =
  { edge_id : string (** Identifies the edge being traversed. *)
  ; final_state : hm_str_mms option
  (** The values of relevant expressions after the edge has been traversed. *)
  ; message : message option
  (** A message to display to the user as the edge is traversed. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the edge
      traversal. *)
  ; step_over_edge_count : int64 option
  (** The number of edge traversals necessary to return from a nested graph. *)
  }
[@@deriving show, eq]

type graph_traversal_variant0 = Sarif_v_2_1_0_t.graph_traversal_variant0 =
  { description : message option (** A description of this graph traversal. *)
  ; edge_traversals : edge_traversal list option
  (** The sequences of edges traversed by this graph traversal. *)
  ; immutable_state : hm_str_mms option
  (** Values of relevant expressions at the start of the graph traversal that
      remain constant for the graph traversal. *)
  ; initial_state : hm_str_mms option
  (** Values of relevant expressions at the start of the graph traversal that
      may change during graph traversal. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the graph
      traversal. *)
  ; result_graph_index : int64
  (** The index within the result.graphs to be associated with the result. *)
  ; run_graph_index : int64
  (** The index within the run.graphs to be associated with the result. *)
  }
[@@deriving show, eq]

type graph_traversal_variant1 = Sarif_v_2_1_0_t.graph_traversal_variant1 =
  { description : message option (** A description of this graph traversal. *)
  ; edge_traversals : edge_traversal list option
  (** The sequences of edges traversed by this graph traversal. *)
  ; immutable_state : hm_str_mms option
  (** Values of relevant expressions at the start of the graph traversal that
      remain constant for the graph traversal. *)
  ; initial_state : hm_str_mms option
  (** Values of relevant expressions at the start of the graph traversal that
      may change during graph traversal. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the graph
      traversal. *)
  ; result_graph_index : int64
  (** The index within the result.graphs to be associated with the result. *)
  ; run_graph_index : int64
  (** The index within the run.graphs to be associated with the result. *)
  }
[@@deriving show, eq]

(** Represents a path through a graph. *)
type graph_traversal = Sarif_v_2_1_0_t.graph_traversal [@@deriving show, eq]

(** An area within an image. *)
type rectangle = Sarif_v_2_1_0_t.rectangle =
  { bottom : float option
  ; left : float option
  ; message : message option (** A message relevant to the rectangle. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the
      rectangle. *)
  ; right : float option
  ; top : float option
  }
[@@deriving show, eq]

(** A region within an artifact where a result was detected. *)
type region = Sarif_v_2_1_0_t.region =
  { byte_length : int64 option (** The length of the region in bytes. *)
  ; byte_offset : int64
  (** The zero-based offset from the beginning of the artifact of the first
      byte in the region. *)
  ; char_length : int64 option (** The length of the region in characters. *)
  ; char_offset : int64
  (** The zero-based offset from the beginning of the artifact of the first
      character in the region. *)
  ; end_column : int64 option
  (** The column number of the character following the end of the region. *)
  ; end_line : int64 option (** The line number of the last character in the region. *)
  ; message : message option (** A message relevant to the region. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the region. *)
  ; snippet : artifact_content option
  (** The portion of the artifact contents within the specified region. *)
  ; source_language : string option
  (** Specifies the source language, if any, of the portion of the artifact
      specified by the region object. *)
  ; start_column : int64 option
  (** The column number of the first character in the region. *)
  ; start_line : int64 option (** The line number of the first character in the region. *)
  }
[@@deriving show, eq]

(** An artifact relevant to a result. *)
type attachment = Sarif_v_2_1_0_t.attachment =
  { artifact_location : artifact_location (** The location of the attachment. *)
  ; description : message option
  (** A message describing the role played by the attachment. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the
      attachment. *)
  ; rectangles : rectangle list option
  (** An array of rectangles specifying areas of interest within the image. *)
  ; regions : region list option
  (** An array of regions of interest within the attachment. *)
  }
[@@deriving show, eq]

(** A physical location relevant to a result. Specifies a reference to a
    programming artifact together with a range of bytes or characters within
    that artifact. *)
type physical_location = Sarif_v_2_1_0_t.physical_location =
  { address : address option (** The address of the location. *)
  ; artifact_location : artifact_location option (** The location of the artifact. *)
  ; context_region : region option
  (** Specifies a portion of the artifact that encloses the region. Allows a
      viewer to display additional context around the region. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the physical
      location. *)
  ; region : region option (** Specifies a portion of the artifact. *)
  }
[@@deriving show, eq]

(** A location within a programming artifact. *)
type location = Sarif_v_2_1_0_t.location =
  { annotations : region list option (** A set of regions relevant to the location. *)
  ; id : int64
  (** Value that distinguishes this location from all other locations within
      a single result object. *)
  ; logical_locations : logical_location list option
  (** The logical locations associated with the result. *)
  ; message : message option (** A message relevant to the location. *)
  ; physical_location : physical_location option
  (** Identifies the artifact and region. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the location. *)
  ; relationships : location_relationship list option
  (** An array of objects that describe relationships between this location
      and others. *)
  }
[@@deriving show, eq]

(** The replacement of a single region of an artifact. *)
type replacement = Sarif_v_2_1_0_t.replacement =
  { deleted_region : region (** The region of the artifact to delete. *)
  ; inserted_content : artifact_content option
  (** The content to insert at the location specified by the 'deletedRegion'
      property. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the
      replacement. *)
  }
[@@deriving show, eq]

(** A change to a single artifact. *)
type artifact_change = Sarif_v_2_1_0_t.artifact_change =
  { artifact_location : artifact_location (** The location of the artifact to change. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the change. *)
  ; replacements : replacement list
  (** An array of replacement objects, each of which represents the
      replacement of a single region in a single artifact specified by
      'artifactLocation'. *)
  }
[@@deriving show, eq]

(** A proposed fix for the problem represented by a result object. A fix
    specifies a set of artifacts to modify. For each artifact, it specifies a
    set of bytes to remove, and provides a set of new bytes to replace them. *)
type fix = Sarif_v_2_1_0_t.fix =
  { artifact_changes : artifact_change list
  (** One or more artifact changes that comprise a fix for a result. *)
  ; description : message option
  (** A message that describes the proposed fix, enabling viewers to present
      the proposed change to an end user. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the fix. *)
  }
[@@deriving show, eq]

(** Specifies the failure level for the report. *)
type reporting_configuration_level = Sarif_v_2_1_0_t.reporting_configuration_level
[@@deriving show, eq]

(** Information about a rule or notification that can be configured at runtime. *)
type reporting_configuration = Sarif_v_2_1_0_t.reporting_configuration =
  { enabled : bool (** Specifies whether the report may be produced during the scan. *)
  ; level : reporting_configuration_level option
  (** Specifies the failure level for the report. *)
  ; parameters : property_bag option
  (** Contains configuration information specific to a report. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the reporting
      configuration. *)
  ; rank : int64
  }
[@@deriving show, eq]

(** ReportingDescriptorDeprecatedGuidsItem *)
type reporting_descriptor_deprecated_guids_item =
  Sarif_v_2_1_0_t.reporting_descriptor_deprecated_guids_item
[@@deriving show, eq]

(** A unique identifier for the reporting descriptor in the form of a GUID. *)
type reporting_descriptor_guid = Sarif_v_2_1_0_t.reporting_descriptor_guid
[@@deriving show, eq]

(** A guid that uniquely identifies the descriptor. *)
type reporting_descriptor_reference_guid =
  Sarif_v_2_1_0_t.reporting_descriptor_reference_guid
[@@deriving show, eq]

(** The state of a result relative to a baseline of a previous run. *)
type result_baseline_state = Sarif_v_2_1_0_t.result_baseline_state [@@deriving show, eq]

(** A stable, unique identifier for the equivalence class of logically
    identical results to which this result belongs, in the form of a GUID. *)
type result_correlation_guid = Sarif_v_2_1_0_t.result_correlation_guid
[@@deriving show, eq]

(** A stable, unique identifier for the result in the form of a GUID. *)
type result_guid = Sarif_v_2_1_0_t.result_guid [@@deriving show, eq]

(** A value that categorizes results by evaluation state. *)
type result_kind = Sarif_v_2_1_0_t.result_kind [@@deriving show, eq]

(** A value specifying the severity level of the result. *)
type result_level = Sarif_v_2_1_0_t.result_level [@@deriving show, eq]

(** A GUID-valued string equal to the automationDetails.guid property of the
    run in which the result was first detected. *)
type result_provenance_first_detection_run_guid =
  Sarif_v_2_1_0_t.result_provenance_first_detection_run_guid
[@@deriving show, eq]

(** A GUID-valued string equal to the automationDetails.guid property of the
    run in which the result was most recently detected. *)
type result_provenance_last_detection_run_guid =
  Sarif_v_2_1_0_t.result_provenance_last_detection_run_guid
[@@deriving show, eq]

(** Contains information about how and when a result was detected. *)
type result_provenance = Sarif_v_2_1_0_t.result_provenance =
  { conversion_sources : physical_location list option
  (** An array of physicalLocation objects which specify the portions of an
      analysis tool's output that a converter transformed into the result. *)
  ; first_detection_run_guid : result_provenance_first_detection_run_guid option
  (** A GUID-valued string equal to the automationDetails.guid property of
      the run in which the result was first detected. *)
  ; first_detection_time_utc : string option
  (** The Coordinated Universal Time (UTC) date and time at which the result
      was first detected. See "Date/time properties" in the SARIF spec for
      the required format. *)
  ; invocation_index : int64
  (** The index within the run.invocations array of the invocation object
      which describes the tool invocation that detected the result. *)
  ; last_detection_run_guid : result_provenance_last_detection_run_guid option
  (** A GUID-valued string equal to the automationDetails.guid property of
      the run in which the result was most recently detected. *)
  ; last_detection_time_utc : string option
  (** The Coordinated Universal Time (UTC) date and time at which the result
      was most recently detected. See "Date/time properties" in the SARIF
      spec for the required format. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the result. *)
  }
[@@deriving show, eq]

(** A function call within a stack trace. *)
type stack_frame = Sarif_v_2_1_0_t.stack_frame =
  { location : location option (** The location to which this stack frame refers. *)
  ; module_ : string option
  (** The name of the module that contains the code of this stack frame. *)
  ; parameters : string list option (** The parameters of the call that is executing. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the stack
      frame. *)
  ; thread_id : int64 option (** The thread identifier of the stack frame. *)
  }
[@@deriving show, eq]

(** A call stack that is relevant to a result. *)
type stack = Sarif_v_2_1_0_t.stack =
  { frames : stack_frame list
  (** An array of stack frames that represents a sequence of calls, rendered
      in reverse chronological order, that comprise the call stack. *)
  ; message : message option (** A message relevant to this call stack. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the stack. *)
  }
[@@deriving show, eq]

(** A stable, unique identifier for the suprression in the form of a GUID. *)
type suppression_guid = Sarif_v_2_1_0_t.suppression_guid [@@deriving show, eq]

(** A string that indicates where the suppression is persisted. *)
type suppression_kind = Sarif_v_2_1_0_t.suppression_kind [@@deriving show, eq]

(** A string that indicates the review status of the suppression. *)
type suppression_status = Sarif_v_2_1_0_t.suppression_status [@@deriving show, eq]

(** A suppression that is relevant to a result. *)
type suppression = Sarif_v_2_1_0_t.suppression =
  { guid : suppression_guid option
  (** A stable, unique identifier for the suprression in the form of a GUID. *)
  ; justification : string option
  (** A string representing the justification for the suppression. *)
  ; kind : suppression_kind
  (** A string that indicates where the suppression is persisted. *)
  ; location : location option
  (** Identifies the location associated with the suppression. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the
      suppression. *)
  ; status : suppression_status option
  (** A string that indicates the review status of the suppression. *)
  }
[@@deriving show, eq]

(** Specifies the importance of this location in understanding the code flow in
    which it occurs. The order from most to least important is "essential",
    "important", "unimportant". Default: "important". *)
type thread_flow_location_importance = Sarif_v_2_1_0_t.thread_flow_location_importance
[@@deriving show, eq]

(** ToolComponentContentsItem *)
type tool_component_contents_item = Sarif_v_2_1_0_t.tool_component_contents_item
[@@deriving show, eq]

(** The binary version of the tool component's primary executable file
    expressed as four non-negative integers separated by a period (for
    operating systems that express file versions in this way). *)
type tool_component_dotted_quad_file_version =
  Sarif_v_2_1_0_t.tool_component_dotted_quad_file_version
[@@deriving show, eq]

(** A unique identifier for the tool component in the form of a GUID. *)
type tool_component_guid = Sarif_v_2_1_0_t.tool_component_guid [@@deriving show, eq]

(** The language of the messages emitted into the log file during this run
    (expressed as an ISO 639-1 two-letter lowercase language code) and an
    optional region (expressed as an ISO 3166-1 two-letter uppercase subculture
    code associated with a country or region). The casing is recommended but
    not required (in order for this data to conform to RFC5646). *)
type tool_component_language = Sarif_v_2_1_0_t.tool_component_language
[@@deriving show, eq]

(** The 'guid' property of the referenced toolComponent. *)
type tool_component_reference_guid = Sarif_v_2_1_0_t.tool_component_reference_guid
[@@deriving show, eq]

(** Identifies a particular toolComponent object, either the driver or an
    extension. *)
type tool_component_reference = Sarif_v_2_1_0_t.tool_component_reference =
  { guid : tool_component_reference_guid option
  (** The 'guid' property of the referenced toolComponent. *)
  ; index : int64 (** An index into the referenced toolComponent in tool.extensions. *)
  ; name : string option (** The 'name' property of the referenced toolComponent. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the
      toolComponentReference. *)
  }
[@@deriving show, eq]

(** Information about how to locate a relevant reporting descriptor. *)
type reporting_descriptor_reference = Sarif_v_2_1_0_t.reporting_descriptor_reference =
  { guid : reporting_descriptor_reference_guid option
  (** A guid that uniquely identifies the descriptor. *)
  ; id : string option (** The id of the descriptor. *)
  ; index : int64
  (** The index into an array of descriptors in
      toolComponent.ruleDescriptors, toolComponent.notificationDescriptors,
      or toolComponent.taxonomyDescriptors, depending on context. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the reporting
      descriptor reference. *)
  ; tool_component : tool_component_reference option
  (** A reference used to locate the toolComponent associated with the
      descriptor. *)
  }
[@@deriving show, eq]

(** Information about how a specific rule or notification was reconfigured at
    runtime. *)
type configuration_override = Sarif_v_2_1_0_t.configuration_override =
  { configuration : reporting_configuration
  (** Specifies how the rule or notification was configured during the scan. *)
  ; descriptor : reporting_descriptor_reference
  (** A reference used to locate the descriptor whose configuration was
      overridden. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the
      configuration override. *)
  }
[@@deriving show, eq]

(** Information about the relation of one reporting descriptor to another. *)
type reporting_descriptor_relationship =
      Sarif_v_2_1_0_t.reporting_descriptor_relationship =
  { description : message option
  (** A description of the reporting descriptor relationship. *)
  ; kinds : string list option
  (** A set of distinct strings that categorize the relationship. Well-known
      kinds include 'canPrecede', 'canFollow', 'willPrecede', 'willFollow',
      'superset', 'subset', 'equal', 'disjoint', 'relevant', and
      'incomparable'. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the reporting
      descriptor reference. *)
  ; target : reporting_descriptor_reference
  (** A reference to the related reporting descriptor. *)
  }
[@@deriving show, eq]

(** Metadata that describes a specific report produced by the tool, as part of
    the analysis it provides or its runtime reporting. *)
type reporting_descriptor = Sarif_v_2_1_0_t.reporting_descriptor =
  { default_configuration : reporting_configuration option
  (** Default reporting configuration information. *)
  ; deprecated_guids : reporting_descriptor_deprecated_guids_item list option
  (** An array of unique identifies in the form of a GUID by which this
      report was known in some previous version of the analysis tool. *)
  ; deprecated_ids : string list option
  (** An array of stable, opaque identifiers by which this report was known
      in some previous version of the analysis tool. *)
  ; deprecated_names : string list option
  (** An array of readable identifiers by which this report was known in some
      previous version of the analysis tool. *)
  ; full_description : multiformat_message_string option
  (** A description of the report. Should, as far as possible, provide
      details sufficient to enable resolution of any problem indicated by the
      result. *)
  ; guid : reporting_descriptor_guid option
  (** A unique identifier for the reporting descriptor in the form of a GUID. *)
  ; help : multiformat_message_string option
  (** Provides the primary documentation for the report, useful when there is
      no online documentation. *)
  ; help_uri : string option
  (** A URI where the primary documentation for the report can be found. *)
  ; id : string (** A stable, opaque identifier for the report. *)
  ; message_strings : hm_str_mms option
  (** A set of name/value pairs with arbitrary names. Each value is a
      multiformatMessageString object, which holds message strings in plain
      text and (optionally) Markdown format. The strings can include
      placeholders, which can be used to construct a message in combination
      with an arbitrary number of additional string arguments. *)
  ; name : string option (** A report identifier that is understandable to an end user. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the report. *)
  ; relationships : reporting_descriptor_relationship list option
  (** An array of objects that describe relationships between this reporting
      descriptor and others. *)
  ; short_description : multiformat_message_string option
  (** A concise description of the report. Should be a single sentence that
      is understandable when visible space is limited to a single line of
      text. *)
  }
[@@deriving show, eq]

(** Provides additional metadata related to translation. *)
type translation_metadata = Sarif_v_2_1_0_t.translation_metadata =
  { download_uri : string option
  (** The absolute URI from which the translation metadata can be downloaded. *)
  ; full_description : multiformat_message_string option
  (** A comprehensive description of the translation metadata. *)
  ; full_name : string option
  (** The full name associated with the translation metadata. *)
  ; information_uri : string option
  (** The absolute URI from which information related to the translation
      metadata can be downloaded. *)
  ; name : string (** The name associated with the translation metadata. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the
      translation metadata. *)
  ; short_description : multiformat_message_string option
  (** A brief description of the translation metadata. *)
  }
[@@deriving show, eq]

(** A component, such as a plug-in or the driver, of the analysis tool that was
    run. *)
type tool_component = Sarif_v_2_1_0_t.tool_component =
  { associated_component : tool_component_reference option
  (** The component which is strongly associated with this component. For a
      translation, this refers to the component which has been translated.
      For an extension, this is the driver that provides the extension's
      plugin model. *)
  ; contents : tool_component_contents_item list option
  (** The kinds of data contained in this object. *)
  ; dotted_quad_file_version : tool_component_dotted_quad_file_version option
  (** The binary version of the tool component's primary executable file
      expressed as four non-negative integers separated by a period (for
      operating systems that express file versions in this way). *)
  ; download_uri : string option
  (** The absolute URI from which the tool component can be downloaded. *)
  ; full_description : multiformat_message_string option
  (** A comprehensive description of the tool component. *)
  ; full_name : string option
  (** The name of the tool component along with its version and any other
      useful identifying information, such as its locale. *)
  ; global_message_strings : hm_str_mms option
  (** A dictionary, each of whose keys is a resource identifier and each of
      whose values is a multiformatMessageString object, which holds message
      strings in plain text and (optionally) Markdown format. The strings can
      include placeholders, which can be used to construct a message in
      combination with an arbitrary number of additional string arguments. *)
  ; guid : tool_component_guid option
  (** A unique identifier for the tool component in the form of a GUID. *)
  ; information_uri : string option
  (** The absolute URI at which information about this version of the tool
      component can be found. *)
  ; is_comprehensive : bool
  (** Specifies whether this object contains a complete definition of the
      localizable and/or non-localizable data for this component, as opposed
      to including only data that is relevant to the results persisted to
      this log file. *)
  ; language : tool_component_language option
  (** The language of the messages emitted into the log file during this run
      (expressed as an ISO 639-1 two-letter lowercase language code) and an
      optional region (expressed as an ISO 3166-1 two-letter uppercase
      subculture code associated with a country or region). The casing is
      recommended but not required (in order for this data to conform to
      RFC5646). *)
  ; localized_data_semantic_version : string option
  (** The semantic version of the localized strings defined in this
      component; maintained by components that provide translations. *)
  ; locations : artifact_location list option
  (** An array of the artifactLocation objects associated with the tool
      component. *)
  ; minimum_required_localized_data_semantic_version : string option
  (** The minimum value of localizedDataSemanticVersion required in
      translations consumed by this component; used by components that
      consume translations. *)
  ; name : string (** The name of the tool component. *)
  ; notifications : reporting_descriptor list option
  (** An array of reportingDescriptor objects relevant to the notifications
      related to the configuration and runtime execution of the tool
      component. *)
  ; organization : string option
  (** The organization or company that produced the tool component. *)
  ; product : string option (** A product suite to which the tool component belongs. *)
  ; product_suite : string option
  (** A localizable string containing the name of the suite of products to
      which the tool component belongs. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the tool
      component. *)
  ; release_date_utc : string option
  (** A string specifying the UTC date (and optionally, the time) of the
      component's release. *)
  ; rules : reporting_descriptor list option
  (** An array of reportingDescriptor objects relevant to the analysis
      performed by the tool component. *)
  ; semantic_version : string option
  (** The tool component version in the format specified by Semantic
      Versioning 2.0. *)
  ; short_description : multiformat_message_string option
  (** A brief description of the tool component. *)
  ; supported_taxonomies : tool_component_reference list option
  (** An array of toolComponentReference objects to declare the taxonomies
      supported by the tool component. *)
  ; taxa : reporting_descriptor list option
  (** An array of reportingDescriptor objects relevant to the definitions of
      both standalone and tool-defined taxonomies. *)
  ; translation_metadata : translation_metadata option
  (** Translation metadata, required for a translation, not populated by
      other component types. *)
  ; version : string option
  (** The tool component version, in whatever format the component natively
      provides. *)
  }
[@@deriving show, eq]

(** The analysis tool that was run. *)
type tool = Sarif_v_2_1_0_t.tool =
  { driver : tool_component (** The analysis tool that was run. *)
  ; extensions : tool_component list option
  (** Tool extensions that contributed to or reconfigured the analysis tool
      that was run. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the tool. *)
  }
[@@deriving show, eq]

(** Describes an HTTP request. *)
type web_request = Sarif_v_2_1_0_t.web_request =
  { body : artifact_content option (** The body of the request. *)
  ; headers : hm_str_str option (** The request headers. *)
  ; index : int64
  (** The index within the run.webRequests array of the request object
      associated with this result. *)
  ; method_ : string option
  (** The HTTP method. Well-known values are 'GET', 'PUT', 'POST', 'DELETE',
      'PATCH', 'HEAD', 'OPTIONS', 'TRACE', 'CONNECT'. *)
  ; parameters : hm_str_str option (** The request parameters. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the request. *)
  ; protocol : string option (** The request protocol. Example: 'http'. *)
  ; target : string option (** The target of the request. *)
  ; version : string option (** The request version. Example: '1.1'. *)
  }
[@@deriving show, eq]

(** Describes the response to an HTTP request. *)
type web_response = Sarif_v_2_1_0_t.web_response =
  { body : artifact_content option (** The body of the request. *)
  ; headers : hm_str_str option (** The request headers. *)
  ; index : int64
  (** The index within the run.webRequests array of the request object
      associated with this result. *)
  ; no_response_received : bool
  (** Specifies whether a response was received from the server. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the request. *)
  ; protocol : string option (** The request protocol. Example: 'http'. *)
  ; reason_phrase : string option (** The response reason. Example: 'Not found'. *)
  ; status_code : string option (** The response status code. Example: 451. *)
  ; version : string option (** The request version. Example: '1.1'. *)
  }
[@@deriving show, eq]

(** A location visited by an analysis tool while simulating or monitoring the
    execution of a program. *)
type thread_flow_location = Sarif_v_2_1_0_t.thread_flow_location =
  { execution_order : int64
  (** An integer representing the temporal order in which execution reached
      this location. *)
  ; execution_time_utc : string option
  (** The Coordinated Universal Time (UTC) date and time at which this
      location was executed. *)
  ; importance : thread_flow_location_importance option
  (** Specifies the importance of this location in understanding the code
      flow in which it occurs. The order from most to least important is
      "essential", "important", "unimportant". Default: "important". *)
  ; index : int64 (** he index within the run threadFlowLocations array. *)
  ; kinds : string list option
  (** A set of distinct strings that categorize the thread flow location.
      Well-known kinds include 'acquire', 'release', 'enter', 'exit', 'call',
      'return', 'branch', 'implicit', 'false', 'true', 'caution', 'danger',
      'unknown', 'unreachable', 'taint', 'function', 'handler', 'lock',
      'memory', 'resource', 'scope' and 'value'. *)
  ; location : location option (** The code location. *)
  ; module_ : string option
  (** The name of the module that contains the code that is executing. *)
  ; nesting_level : int64 option
  (** An integer representing a containment hierarchy within the thread flow. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the
      threadflow location. *)
  ; stack : stack option (** The call stack leading to this location. *)
  ; state : hm_str_mms option
  (** A dictionary, each of whose keys specifies a variable or expression,
      the associated value of which represents the variable or expression
      value. For an annotation of kind 'continuation', for example, this
      dictionary might hold the current assumed values of a set of global
      variables. *)
  ; taxa : reporting_descriptor_reference list option
  (** An array of references to rule or taxonomy reporting descriptors that
      are applicable to the thread flow location. *)
  ; web_request : web_request option
  (** A web request associated with this thread flow location. *)
  ; web_response : web_response option
  (** A web response associated with this thread flow location. *)
  }
[@@deriving show, eq]

(** Describes a sequence of code locations that specify a path through a single
    thread of execution such as an operating system or fiber. *)
type thread_flow = Sarif_v_2_1_0_t.thread_flow =
  { id : string option
  (** An string that uniquely identifies the threadFlow within the codeFlow
      in which it occurs. *)
  ; immutable_state : hm_str_mms option
  (** Values of relevant expressions at the start of the thread flow that
      remain constant. *)
  ; initial_state : hm_str_mms option
  (** Values of relevant expressions at the start of the thread flow that may
      change during thread flow execution. *)
  ; locations : thread_flow_location list
  (** A temporally ordered array of 'threadFlowLocation' objects, each of
      which describes a location visited by the tool while producing the
      result. *)
  ; message : message option (** A message relevant to the thread flow. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the thread
      flow. *)
  }
[@@deriving show, eq]

(** A set of threadFlows which together describe a pattern of code execution
    relevant to detecting a result. *)
type code_flow = Sarif_v_2_1_0_t.code_flow =
  { message : message option (** A message relevant to the code flow. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the code
      flow. *)
  ; thread_flows : thread_flow list
  (** An array of one or more unique threadFlow objects, each of which
      describes the progress of a program through a thread of execution. *)
  }
[@@deriving show, eq]

(** Represents a node in a graph. *)
type node = Sarif_v_2_1_0_t.node =
  { children : node list option (** Array of child nodes. *)
  ; id : string (** A string that uniquely identifies the node within its graph. *)
  ; label : message option (** A short description of the node. *)
  ; location : location option (** A code location associated with the node. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the node. *)
  }
[@@deriving show, eq]

(** Describes a runtime exception encountered during the execution of an
    analysis tool. *)
type exception_ = Sarif_v_2_1_0_t.exception_ =
  { inner_exceptions : exception_ list option
  (** An array of exception objects each of which is considered a cause of
      this exception. *)
  ; kind : string option
  (** A string that identifies the kind of exception, for example, the fully
      qualified type name of an object that was thrown, or the symbolic name
      of a signal. *)
  ; message : string option (** A message that describes the exception. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the
      exception. *)
  ; stack : stack option (** The sequence of function calls leading to the exception. *)
  }
[@@deriving show, eq]

(** A network of nodes and directed edges that describes some aspect of the
    structure of the code (for example, a call graph). *)
type graph = Sarif_v_2_1_0_t.graph =
  { description : message option (** A description of the graph. *)
  ; edges : edge list option
  (** An array of edge objects representing the edges of the graph. *)
  ; nodes : node list option
  (** An array of node objects representing the nodes of the graph. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the graph. *)
  }
[@@deriving show, eq]

(** A result produced by an analysis tool. *)
type result = Sarif_v_2_1_0_t.result =
  { analysis_target : artifact_location option
  (** Identifies the artifact that the analysis tool was instructed to scan.
      This need not be the same as the artifact where the result actually
      occurred. *)
  ; attachments : attachment list option (** A set of artifacts relevant to the result. *)
  ; baseline_state : result_baseline_state option
  (** The state of a result relative to a baseline of a previous run. *)
  ; code_flows : code_flow list option
  (** An array of 'codeFlow' objects relevant to the result. *)
  ; correlation_guid : result_correlation_guid option
  (** A stable, unique identifier for the equivalence class of logically
      identical results to which this result belongs, in the form of a GUID. *)
  ; fingerprints : hm_str_str option
  (** A set of strings each of which individually defines a stable, unique
      identity for the result. *)
  ; fixes : fix list option
  (** An array of 'fix' objects, each of which represents a proposed fix to
      the problem indicated by the result. *)
  ; graph_traversals : graph_traversal list option
  (** An array of one or more unique 'graphTraversal' objects. *)
  ; graphs : graph list option
  (** An array of zero or more unique graph objects associated with the
      result. *)
  ; guid : result_guid option
  (** A stable, unique identifier for the result in the form of a GUID. *)
  ; hosted_viewer_uri : string option
  (** An absolute URI at which the result can be viewed. *)
  ; kind : result_kind option (** A value that categorizes results by evaluation state. *)
  ; level : result_level option
  (** A value specifying the severity level of the result. *)
  ; locations : location list option
  (** The set of locations where the result was detected. Specify only one
      location unless the problem indicated by the result can only be
      corrected by making a change at every specified location. *)
  ; message : message
  (** A message that describes the result. The first sentence of the message
      only will be displayed when visible space is limited. *)
  ; occurrence_count : int64 option
  (** A positive integer specifying the number of times this logically unique
      result was observed in this run. *)
  ; partial_fingerprints : hm_str_str option
  (** A set of strings that contribute to the stable, unique identity of the
      result. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the result. *)
  ; provenance : result_provenance option
  (** Information about how and when the result was detected. *)
  ; rank : int64
  ; related_locations : location list option
  (** A set of locations relevant to this result. *)
  ; rule : reporting_descriptor_reference option
  (** A reference used to locate the rule descriptor relevant to this result. *)
  ; rule_id : string option
  (** The stable, unique identifier of the rule, if any, to which this result
      is relevant. *)
  ; rule_index : int64
  (** The index within the tool component rules array of the rule object
      associated with this result. *)
  ; stacks : stack list option (** An array of 'stack' objects relevant to the result. *)
  ; suppressions : suppression list option
  (** A set of suppressions relevant to this result. *)
  ; taxa : reporting_descriptor_reference list option
  (** An array of references to taxonomy reporting descriptors that are
      applicable to the result. *)
  ; web_request : web_request option (** A web request associated with this result. *)
  ; web_response : web_response option (** A web response associated with this result. *)
  ; work_item_uris : string list option
  (** The URIs of the work items associated with this result. *)
  }
[@@deriving show, eq]

(** Describes a condition relevant to the tool itself, as opposed to being
    relevant to a target being analyzed by the tool. *)
type notification = Sarif_v_2_1_0_t.notification =
  { associated_rule : reporting_descriptor_reference option
  (** A reference used to locate the rule descriptor associated with this
      notification. *)
  ; descriptor : reporting_descriptor_reference option
  (** A reference used to locate the descriptor relevant to this
      notification. *)
  ; exception_ : exception_ option
  (** The runtime exception, if any, relevant to this notification. *)
  ; level : notification_level option
  (** A value specifying the severity level of the notification. *)
  ; locations : location list option (** The locations relevant to this notification. *)
  ; message : message (** A message that describes the condition that was encountered. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the
      notification. *)
  ; thread_id : int64 option
  (** The thread identifier of the code that generated the notification. *)
  ; time_utc : string option
  (** The Coordinated Universal Time (UTC) date and time at which the
      analysis tool generated the notification. *)
  }
[@@deriving show, eq]

(** The runtime environment of the analysis tool run. *)
type invocation = Sarif_v_2_1_0_t.invocation =
  { account : string option (** The account under which the invocation occurred. *)
  ; arguments : string option
  (** An array of strings, containing in order the command line arguments
      passed to the tool from the operating system. *)
  ; command_line : string option (** The command line used to invoke the tool. *)
  ; end_time_utc : string option
  (** The Coordinated Universal Time (UTC) date and time at which the
      invocation ended. See "Date/time properties" in the SARIF spec for the
      required format. *)
  ; environment_variables : hm_str_str option
  (** The environment variables associated with the analysis tool process,
      expressed as key/value pairs. *)
  ; executable_location : artifact_location option
  (** An absolute URI specifying the location of the executable that was
      invoked. *)
  ; execution_successful : bool
  (** Specifies whether the tool's execution completed successfully. *)
  ; exit_code : int64 option (** The process exit code. *)
  ; exit_code_description : string option (** The reason for the process exit. *)
  ; exit_signal_name : string option
  (** The name of the signal that caused the process to exit. *)
  ; exit_signal_number : int64 option
  (** The numeric value of the signal that caused the process to exit. *)
  ; notification_configuration_overrides : configuration_override list option
  (** An array of configurationOverride objects that describe notifications
      related runtime overrides. *)
  ; process_id : int64 option
  (** The id of the process in which the invocation occurred. *)
  ; process_start_failure_message : string option
  (** The reason given by the operating system that the process failed to
      start. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the
      invocation. *)
  ; response_files : artifact_location list option
  (** The locations of any response files specified on the tool's command
      line. *)
  ; rule_configuration_overrides : configuration_override list option
  (** An array of configurationOverride objects that describe rules related
      runtime overrides. *)
  ; start_time_utc : string option
  (** The Coordinated Universal Time (UTC) date and time at which the
      invocation started. See "Date/time properties" in the SARIF spec for
      the required format. *)
  ; stderr : artifact_location option
  (** A file containing the standard error stream from the process that was
      invoked. *)
  ; stdin : artifact_location option
  (** A file containing the standard input stream to the process that was
      invoked. *)
  ; stdout : artifact_location option
  (** A file containing the standard output stream from the process that was
      invoked. *)
  ; stdout_stderr : artifact_location option
  (** A file containing the interleaved standard output and standard error
      stream from the process that was invoked. *)
  ; tool_configuration_notifications : notification list option
  (** A list of conditions detected by the tool that are relevant to the
      tool's configuration. *)
  ; tool_execution_notifications : notification list option
  (** A list of runtime conditions detected by the tool during the analysis. *)
  ; working_directory : artifact_location option
  (** The working directory for the invocation. *)
  }
[@@deriving show, eq]

(** Describes how a converter transformed the output of a static analysis tool
    from the analysis tool's native output format into the SARIF format. *)
type conversion = Sarif_v_2_1_0_t.conversion =
  { analysis_tool_log_files : artifact_location list option
  (** The locations of the analysis tool's per-run log files. *)
  ; invocation : invocation option
  (** An invocation object that describes the invocation of the converter. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the
      conversion. *)
  ; tool : tool (** A tool object that describes the converter. *)
  }
[@@deriving show, eq]

(** A single artifact. In some cases, this artifact might be nested within
    another artifact. *)
type artifact = Sarif_v_2_1_0_t.artifact =
  { contents : artifact_content option (** The contents of the artifact. *)
  ; description : message option (** A short description of the artifact. *)
  ; encoding : string option
  (** Specifies the encoding for an artifact object that refers to a text
      file. *)
  ; hashes : hm_str_str option
  (** A dictionary, each of whose keys is the name of a hash function and
      each of whose values is the hashed value of the artifact produced by
      the specified hash function. *)
  ; last_modified_time_utc : string option
  (** The Coordinated Universal Time (UTC) date and time at which the
      artifact was most recently modified. See "Date/time properties" in the
      SARIF spec for the required format. *)
  ; length : int64 (** The length of the artifact in bytes. *)
  ; location : artifact_location option (** The location of the artifact. *)
  ; mime_type : artifact_mimetype option (** The MIME type (RFC 2045) of the artifact. *)
  ; offset : int64 option
  (** The offset in bytes of the artifact within its containing artifact. *)
  ; parent_index : int64
  (** Identifies the index of the immediate parent of the artifact, if this
      artifact is nested. *)
  ; properties : external_properties option
  (** Key/value pairs that provide additional information about the artifact. *)
  ; roles : artifact_roles_item list option
  (** The role or roles played by the artifact in the analysis. *)
  ; source_language : string option
  (** Specifies the source language for any artifact object that refers to a
      text file that contains source code. *)
  }
[@@deriving show, eq]

(** The top-level element of an external property file. *)
and external_properties = Sarif_v_2_1_0_t.external_properties =
  { addresses : address list option
  (** Addresses that will be merged with a separate run. *)
  ; artifacts : artifact list option
  (** An array of artifact objects that will be merged with a separate run. *)
  ; conversion : conversion option
  (** A conversion object that will be merged with a separate run. *)
  ; driver : tool_component option
  (** The analysis tool object that will be merged with a separate run. *)
  ; extensions : tool_component list option
  (** Tool extensions that will be merged with a separate run. *)
  ; externalized_properties : property_bag option
  (** Key/value pairs that provide additional information that will be merged
      with a separate run. *)
  ; graph : graph list option
  (** An array of graph objects that will be merged with a separate run. *)
  ; guid : external_properties_guid option
  (** A stable, unique identifier for this external properties object, in the
      form of a GUID. *)
  ; invocations : invocation option
  (** Describes the invocation of the analysis tool that will be merged with
      a separate run. *)
  ; logical_locations : logical_location list option
  (** An array of logical locations such as namespaces, types or functions
      that will be merged with a separate run. *)
  ; policies : tool_component list option
  (** Tool policies that will be merged with a separate run. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the external
      properties. *)
  ; results : result option
  (** An array of result objects that will be merged with a separate run. *)
  ; run_guid : external_properties_run_guid option
  (** A stable, unique identifier for the run associated with this external
      properties object, in the form of a GUID. *)
  ; schema : string option
  (** The URI of the JSON schema corresponding to the version of the external
      property file format. *)
  ; taxonomies : tool_component list option
  (** Tool taxonomies that will be merged with a separate run. *)
  ; thread_flow_locations : thread_flow_location list option
  (** An array of threadFlowLocation objects that will be merged with a
      separate run. *)
  ; translations : tool_component list option
  (** Tool translations that will be merged with a separate run. *)
  ; version : external_properties_version option
  (** The SARIF format version of this external properties object. *)
  ; web_requests : web_request list option
  (** Requests that will be merged with a separate run. *)
  ; web_responses : web_response list option
  (** Responses that will be merged with a separate run. *)
  }
[@@deriving show, eq]

(** Specifies the information necessary to retrieve a desired revision from a
    version control system. *)
type version_control_details = Sarif_v_2_1_0_t.version_control_details =
  { as_of_time_utc : string option
  (** A Coordinated Universal Time (UTC) date and time that can be used to
      synchronize an enlistment to the state of the repository at that time. *)
  ; branch : string option (** The name of a branch containing the revision. *)
  ; mapped_to : artifact_location option
  (** The location in the local file system to which the root of the
      repository was mapped at the time of the analysis. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the version
      control details. *)
  ; repository_uri : string (** The absolute URI of the repository. *)
  ; revision_id : string option
  (** A string that uniquely and permanently identifies the revision within
      the repository. *)
  ; revision_tag : string option (** A tag that has been applied to the revision. *)
  }
[@@deriving show, eq]

(** Defines locations of special significance to SARIF consumers. *)
type special_locations = Sarif_v_2_1_0_t.special_locations =
  { display_base : artifact_location option
  (** Provides a suggestion to SARIF consumers to display file paths relative
      to the specified location. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the special
      locations. *)
  }
[@@deriving show, eq]

type sarif_version = Sarif_v_2_1_0_t.sarif_version [@@deriving show, eq]

(** The language of the messages emitted into the log file during this run
    (expressed as an ISO 639-1 two-letter lowercase culture code) and an
    optional region (expressed as an ISO 3166-1 two-letter uppercase subculture
    code associated with a country or region). The casing is recommended but
    not required (in order for this data to conform to RFC5646). *)
type run_language = Sarif_v_2_1_0_t.run_language [@@deriving show, eq]

(** Specifies the unit in which the tool measures columns. *)
type run_column_kind = Sarif_v_2_1_0_t.run_column_kind [@@deriving show, eq]

(** The 'guid' property of a previous SARIF 'run' that comprises the baseline
    that was used to compute result 'baselineState' properties for the run. *)
type run_baseline_guid = Sarif_v_2_1_0_t.run_baseline_guid [@@deriving show, eq]

(** A stable, unique identifier for this object's containing run object in the
    form of a GUID. *)
type run_automation_details_guid = Sarif_v_2_1_0_t.run_automation_details_guid
[@@deriving show, eq]

(** A stable, unique identifier for the equivalence class of runs to which this
    object's containing run object belongs in the form of a GUID. *)
type run_automation_details_correlation_guid =
  Sarif_v_2_1_0_t.run_automation_details_correlation_guid
[@@deriving show, eq]

(** Information that describes a run's identity and role within an engineering
    system process. *)
type run_automation_details = Sarif_v_2_1_0_t.run_automation_details =
  { correlation_guid : run_automation_details_correlation_guid option
  (** A stable, unique identifier for the equivalence class of runs to which
      this object's containing run object belongs in the form of a GUID. *)
  ; description : message option
  (** A description of the identity and role played within the engineering
      system by this object's containing run object. *)
  ; guid : run_automation_details_guid option
  (** A stable, unique identifier for this object's containing run object in
      the form of a GUID. *)
  ; id : string option
  (** A hierarchical string that uniquely identifies this object's containing
      run object. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the run
      automation details. *)
  }
[@@deriving show, eq]

type hm_str_al = Sarif_v_2_1_0_t.hm_str_al [@@deriving show, eq]

(** A stable, unique identifier for the external property file in the form of a
    GUID. *)
type external_property_file_reference_guid =
  Sarif_v_2_1_0_t.external_property_file_reference_guid
[@@deriving show, eq]

(** Contains information that enables a SARIF consumer to locate the external
    property file that contains the value of an externalized property
    associated with the run. *)
type external_property_file_reference = Sarif_v_2_1_0_t.external_property_file_reference =
  { guid : external_property_file_reference_guid option
  (** A stable, unique identifier for the external property file in the form
      of a GUID. *)
  ; item_count : int64
  (** A non-negative integer specifying the number of items contained in the
      external property file. *)
  ; location : artifact_location option (** The location of the external property file. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the external
      property file. *)
  }
[@@deriving show, eq]

(** References to external property files that should be inlined with the
    content of a root log file. *)
type external_property_file_references =
      Sarif_v_2_1_0_t.external_property_file_references =
  { addresses : external_property_file_reference list option
  (** An array of external property files containing run.addresses arrays to
      be merged with the root log file. *)
  ; artifacts : external_property_file_reference list option
  (** An array of external property files containing run.artifacts arrays to
      be merged with the root log file. *)
  ; conversion : external_property_file_reference option
  (** An external property file containing a run.conversion object to be
      merged with the root log file. *)
  ; driver : external_property_file_reference option
  (** An external property file containing a run.driver object to be merged
      with the root log file. *)
  ; extensions : external_property_file_reference list option
  (** An array of external property files containing run.extensions arrays to
      be merged with the root log file. *)
  ; externalized_properties : external_property_file_reference option
  (** An external property file containing a run.properties object to be
      merged with the root log file. *)
  ; graphs : external_property_file_reference list option
  (** An array of external property files containing a run.graphs object to
      be merged with the root log file. *)
  ; invocations : external_property_file_reference list option
  (** An array of external property files containing run.invocations arrays
      to be merged with the root log file. *)
  ; logical_locations : external_property_file_reference list option
  (** An array of external property files containing run.logicalLocations
      arrays to be merged with the root log file. *)
  ; policies : external_property_file_reference list option
  (** An array of external property files containing run.policies arrays to
      be merged with the root log file. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the external
      property files. *)
  ; results : external_property_file_reference list option
  (** An array of external property files containing run.results arrays to be
      merged with the root log file. *)
  ; taxonomies : external_property_file_reference list option
  (** An array of external property files containing run.taxonomies arrays to
      be merged with the root log file. *)
  ; thread_flow_locations : external_property_file_reference list option
  (** An array of external property files containing run.threadFlowLocations
      arrays to be merged with the root log file. *)
  ; translations : external_property_file_reference list option
  (** An array of external property files containing run.translations arrays
      to be merged with the root log file. *)
  ; web_requests : external_property_file_reference list option
  (** An array of external property files containing run.requests arrays to
      be merged with the root log file. *)
  ; web_responses : external_property_file_reference list option
  (** An array of external property files containing run.responses arrays to
      be merged with the root log file. *)
  }
[@@deriving show, eq]

(** Describes a single run of an analysis tool, and contains the reported
    output of that run. *)
type run = Sarif_v_2_1_0_t.run =
  { addresses : address list option
  (** Addresses associated with this run instance, if any. *)
  ; artifacts : artifact list option
  (** An array of artifact objects relevant to the run. *)
  ; automation_details : run_automation_details option
  (** Automation details that describe this run. *)
  ; baseline_guid : run_baseline_guid option
  (** The 'guid' property of a previous SARIF 'run' that comprises the
      baseline that was used to compute result 'baselineState' properties for
      the run. *)
  ; column_kind : run_column_kind option
  (** Specifies the unit in which the tool measures columns. *)
  ; conversion : conversion option
  (** A conversion object that describes how a converter transformed an
      analysis tool's native reporting format into the SARIF format. *)
  ; default_encoding : string option
  (** Specifies the default encoding for any artifact object that refers to a
      text file. *)
  ; default_source_language : string option
  (** Specifies the default source language for any artifact object that
      refers to a text file that contains source code. *)
  ; external_property_file_references : external_property_file_references option
  (** References to external property files that should be inlined with the
      content of a root log file. *)
  ; graphs : graph list option
  (** An array of zero or more unique graph objects associated with the run. *)
  ; invocations : invocation list option
  (** Describes the invocation of the analysis tool. *)
  ; language : run_language option
  (** The language of the messages emitted into the log file during this run
      (expressed as an ISO 639-1 two-letter lowercase culture code) and an
      optional region (expressed as an ISO 3166-1 two-letter uppercase
      subculture code associated with a country or region). The casing is
      recommended but not required (in order for this data to conform to
      RFC5646). *)
  ; logical_locations : logical_location list option
  (** An array of logical locations such as namespaces, types or functions. *)
  ; newline_sequences : string list
  (** An ordered list of character sequences that were treated as line breaks
      when computing region information for the run. *)
  ; original_uri_base_ids : hm_str_al option
  (** The artifact location specified by each uriBaseId symbol on the machine
      where the tool originally ran. *)
  ; policies : tool_component list option
  (** Contains configurations that may potentially override both
      reportingDescriptor.defaultConfiguration (the tool's default
      severities) and invocation.configurationOverrides (severities
      established at run-time from the command line). *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the run. *)
  ; redaction_tokens : string list option
  (** An array of strings used to replace sensitive information in a
      redaction-aware property. *)
  ; results : result list option
  (** The set of results contained in an SARIF log. The results array can be
      omitted when a run is solely exporting rules metadata. It must be
      present (but may be empty) if a log file represents an actual scan. *)
  ; run_aggregates : run_automation_details list option
  (** Automation details that describe the aggregate of runs to which this
      run belongs. *)
  ; special_locations : special_locations option
  (** A specialLocations object that defines locations of special
      significance to SARIF consumers. *)
  ; taxonomies : tool_component list option
  (** An array of toolComponent objects relevant to a taxonomy in which
      results are categorized. *)
  ; thread_flow_locations : thread_flow_location list option
  (** An array of threadFlowLocation objects cached at run level. *)
  ; tool : tool
  (** Information about the tool or tool pipeline that generated the results
      in this run. A run can only contain results produced by a single tool
      or tool pipeline. A run can aggregate results from multiple log files,
      as long as context around the tool run (tool command-line arguments and
      the like) is identical for all aggregated files. *)
  ; translations : tool_component list option
  (** Specifies the revision in version control of the artifacts that were
      scanned. *)
  ; version_control_provenance : version_control_details list option
  (** Specifies the revision in version control of the artifacts that were
      scanned. *)
  ; web_requests : web_request list option
  (** An array of request objects cached at run level. *)
  ; web_responses : web_response list option
  (** An array of response objects cached at run level. *)
  }
[@@deriving show, eq]

(** Core type: Static Analysis Results Format (SARIF) Version 2.1.0 JSON
    Schema: a standard format for the output of static analysis tools. *)
type sarif_json_schema = Sarif_v_2_1_0_t.sarif_json_schema =
  { version : sarif_version (** The SARIF format version of this log file. *)
  ; inline_external_properties : external_properties list option
  (** References to external property files that share data between runs. *)
  ; properties : property_bag option
  (** Key/value pairs that provide additional information about the log file. *)
  ; runs : run list (** The set of runs contained in this log file. *)
  ; schema : string option (** The URI of the JSON schema corresponding to the version. *)
  }
[@@deriving show, eq]

(** Validate a value of type {!type:artifact_mimetype}. *)
val validate_artifact_mimetype
  :  Atdgen_runtime.Util.Validation.path
  -> artifact_mimetype
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:artifact_roles_item}. *)
val validate_artifact_roles_item
  :  Atdgen_runtime.Util.Validation.path
  -> artifact_roles_item
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:external_properties_guid}. *)
val validate_external_properties_guid
  :  Atdgen_runtime.Util.Validation.path
  -> external_properties_guid
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:external_properties_run_guid}. *)
val validate_external_properties_run_guid
  :  Atdgen_runtime.Util.Validation.path
  -> external_properties_run_guid
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:external_properties_version}. *)
val validate_external_properties_version
  :  Atdgen_runtime.Util.Validation.path
  -> external_properties_version
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:hm_str_str}. *)
val validate_hm_str_str
  :  Atdgen_runtime.Util.Validation.path
  -> hm_str_str
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:int64}. *)
val validate_int64
  :  Atdgen_runtime.Util.Validation.path
  -> int64
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:notification_level}. *)
val validate_notification_level
  :  Atdgen_runtime.Util.Validation.path
  -> notification_level
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:property_bag}. *)
val validate_property_bag
  :  Atdgen_runtime.Util.Validation.path
  -> property_bag
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:address}. *)
val create_address
  :  ?absolute_address:int64
  -> ?fully_qualified_name:string
  -> ?index:int64
  -> ?kind:string
  -> ?length:int64
  -> ?name:string
  -> ?offset_from_parent:int64
  -> ?parent_index:int64
  -> ?properties:property_bag
  -> ?relative_address:int64
  -> unit
  -> address

(** Validate a value of type {!type:address}. *)
val validate_address
  :  Atdgen_runtime.Util.Validation.path
  -> address
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:logical_location}. *)
val create_logical_location
  :  ?decorated_name:string
  -> ?fully_qualified_name:string
  -> ?index:int64
  -> ?kind:string
  -> ?name:string
  -> ?parent_index:int64
  -> ?properties:property_bag
  -> unit
  -> logical_location

(** Validate a value of type {!type:logical_location}. *)
val validate_logical_location
  :  Atdgen_runtime.Util.Validation.path
  -> logical_location
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:message}. *)
val create_message
  :  ?arguments:string list
  -> ?id:string
  -> ?markdown:string
  -> ?properties:property_bag
  -> ?text:string
  -> unit
  -> message

(** Validate a value of type {!type:message}. *)
val validate_message
  :  Atdgen_runtime.Util.Validation.path
  -> message
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:artifact_location}. *)
val create_artifact_location
  :  ?description:message
  -> ?index:int64
  -> ?properties:property_bag
  -> ?uri:string
  -> ?uri_base_id:string
  -> unit
  -> artifact_location

(** Validate a value of type {!type:artifact_location}. *)
val validate_artifact_location
  :  Atdgen_runtime.Util.Validation.path
  -> artifact_location
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:edge}. *)
val create_edge
  :  id:string
  -> ?label:message
  -> ?properties:property_bag
  -> source_node_id:string
  -> target_node_id:string
  -> unit
  -> edge

(** Validate a value of type {!type:edge}. *)
val validate_edge
  :  Atdgen_runtime.Util.Validation.path
  -> edge
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:location_relationship}. *)
val create_location_relationship
  :  ?description:message
  -> ?kinds:string list
  -> ?properties:property_bag
  -> target:int64
  -> unit
  -> location_relationship

(** Validate a value of type {!type:location_relationship}. *)
val validate_location_relationship
  :  Atdgen_runtime.Util.Validation.path
  -> location_relationship
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:multiformat_message_string}. *)
val create_multiformat_message_string
  :  ?markdown:string
  -> ?properties:property_bag
  -> text:string
  -> unit
  -> multiformat_message_string

(** Validate a value of type {!type:multiformat_message_string}. *)
val validate_multiformat_message_string
  :  Atdgen_runtime.Util.Validation.path
  -> multiformat_message_string
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:artifact_content}. *)
val create_artifact_content
  :  ?binary:string
  -> ?properties:property_bag
  -> ?rendered:multiformat_message_string
  -> ?text:string
  -> unit
  -> artifact_content

(** Validate a value of type {!type:artifact_content}. *)
val validate_artifact_content
  :  Atdgen_runtime.Util.Validation.path
  -> artifact_content
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:hm_str_mms}. *)
val validate_hm_str_mms
  :  Atdgen_runtime.Util.Validation.path
  -> hm_str_mms
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:edge_traversal}. *)
val create_edge_traversal
  :  edge_id:string
  -> ?final_state:hm_str_mms
  -> ?message:message
  -> ?properties:property_bag
  -> ?step_over_edge_count:int64
  -> unit
  -> edge_traversal

(** Validate a value of type {!type:edge_traversal}. *)
val validate_edge_traversal
  :  Atdgen_runtime.Util.Validation.path
  -> edge_traversal
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:graph_traversal_variant0}. *)
val create_graph_traversal_variant0
  :  ?description:message
  -> ?edge_traversals:edge_traversal list
  -> ?immutable_state:hm_str_mms
  -> ?initial_state:hm_str_mms
  -> ?properties:property_bag
  -> ?result_graph_index:int64
  -> ?run_graph_index:int64
  -> unit
  -> graph_traversal_variant0

(** Validate a value of type {!type:graph_traversal_variant0}. *)
val validate_graph_traversal_variant0
  :  Atdgen_runtime.Util.Validation.path
  -> graph_traversal_variant0
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:graph_traversal_variant1}. *)
val create_graph_traversal_variant1
  :  ?description:message
  -> ?edge_traversals:edge_traversal list
  -> ?immutable_state:hm_str_mms
  -> ?initial_state:hm_str_mms
  -> ?properties:property_bag
  -> ?result_graph_index:int64
  -> ?run_graph_index:int64
  -> unit
  -> graph_traversal_variant1

(** Validate a value of type {!type:graph_traversal_variant1}. *)
val validate_graph_traversal_variant1
  :  Atdgen_runtime.Util.Validation.path
  -> graph_traversal_variant1
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:graph_traversal}. *)
val validate_graph_traversal
  :  Atdgen_runtime.Util.Validation.path
  -> graph_traversal
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:rectangle}. *)
val create_rectangle
  :  ?bottom:float
  -> ?left:float
  -> ?message:message
  -> ?properties:property_bag
  -> ?right:float
  -> ?top:float
  -> unit
  -> rectangle

(** Validate a value of type {!type:rectangle}. *)
val validate_rectangle
  :  Atdgen_runtime.Util.Validation.path
  -> rectangle
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:region}. *)
val create_region
  :  ?byte_length:int64
  -> ?byte_offset:int64
  -> ?char_length:int64
  -> ?char_offset:int64
  -> ?end_column:int64
  -> ?end_line:int64
  -> ?message:message
  -> ?properties:property_bag
  -> ?snippet:artifact_content
  -> ?source_language:string
  -> ?start_column:int64
  -> ?start_line:int64
  -> unit
  -> region

(** Validate a value of type {!type:region}. *)
val validate_region
  :  Atdgen_runtime.Util.Validation.path
  -> region
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:attachment}. *)
val create_attachment
  :  artifact_location:artifact_location
  -> ?description:message
  -> ?properties:property_bag
  -> ?rectangles:rectangle list
  -> ?regions:region list
  -> unit
  -> attachment

(** Validate a value of type {!type:attachment}. *)
val validate_attachment
  :  Atdgen_runtime.Util.Validation.path
  -> attachment
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:physical_location}. *)
val create_physical_location
  :  ?address:address
  -> ?artifact_location:artifact_location
  -> ?context_region:region
  -> ?properties:property_bag
  -> ?region:region
  -> unit
  -> physical_location

(** Validate a value of type {!type:physical_location}. *)
val validate_physical_location
  :  Atdgen_runtime.Util.Validation.path
  -> physical_location
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:location}. *)
val create_location
  :  ?annotations:region list
  -> ?id:int64
  -> ?logical_locations:logical_location list
  -> ?message:message
  -> ?physical_location:physical_location
  -> ?properties:property_bag
  -> ?relationships:location_relationship list
  -> unit
  -> location

(** Validate a value of type {!type:location}. *)
val validate_location
  :  Atdgen_runtime.Util.Validation.path
  -> location
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:replacement}. *)
val create_replacement
  :  deleted_region:region
  -> ?inserted_content:artifact_content
  -> ?properties:property_bag
  -> unit
  -> replacement

(** Validate a value of type {!type:replacement}. *)
val validate_replacement
  :  Atdgen_runtime.Util.Validation.path
  -> replacement
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:artifact_change}. *)
val create_artifact_change
  :  artifact_location:artifact_location
  -> ?properties:property_bag
  -> replacements:replacement list
  -> unit
  -> artifact_change

(** Validate a value of type {!type:artifact_change}. *)
val validate_artifact_change
  :  Atdgen_runtime.Util.Validation.path
  -> artifact_change
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:fix}. *)
val create_fix
  :  artifact_changes:artifact_change list
  -> ?description:message
  -> ?properties:property_bag
  -> unit
  -> fix

(** Validate a value of type {!type:fix}. *)
val validate_fix
  :  Atdgen_runtime.Util.Validation.path
  -> fix
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:reporting_configuration_level}. *)
val validate_reporting_configuration_level
  :  Atdgen_runtime.Util.Validation.path
  -> reporting_configuration_level
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:reporting_configuration}. *)
val create_reporting_configuration
  :  ?enabled:bool
  -> ?level:reporting_configuration_level
  -> ?parameters:property_bag
  -> ?properties:property_bag
  -> ?rank:int64
  -> unit
  -> reporting_configuration

(** Validate a value of type {!type:reporting_configuration}. *)
val validate_reporting_configuration
  :  Atdgen_runtime.Util.Validation.path
  -> reporting_configuration
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:reporting_descriptor_deprecated_guids_item}. *)
val validate_reporting_descriptor_deprecated_guids_item
  :  Atdgen_runtime.Util.Validation.path
  -> reporting_descriptor_deprecated_guids_item
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:reporting_descriptor_guid}. *)
val validate_reporting_descriptor_guid
  :  Atdgen_runtime.Util.Validation.path
  -> reporting_descriptor_guid
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:reporting_descriptor_reference_guid}. *)
val validate_reporting_descriptor_reference_guid
  :  Atdgen_runtime.Util.Validation.path
  -> reporting_descriptor_reference_guid
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:result_baseline_state}. *)
val validate_result_baseline_state
  :  Atdgen_runtime.Util.Validation.path
  -> result_baseline_state
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:result_correlation_guid}. *)
val validate_result_correlation_guid
  :  Atdgen_runtime.Util.Validation.path
  -> result_correlation_guid
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:result_guid}. *)
val validate_result_guid
  :  Atdgen_runtime.Util.Validation.path
  -> result_guid
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:result_kind}. *)
val validate_result_kind
  :  Atdgen_runtime.Util.Validation.path
  -> result_kind
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:result_level}. *)
val validate_result_level
  :  Atdgen_runtime.Util.Validation.path
  -> result_level
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:result_provenance_first_detection_run_guid}. *)
val validate_result_provenance_first_detection_run_guid
  :  Atdgen_runtime.Util.Validation.path
  -> result_provenance_first_detection_run_guid
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:result_provenance_last_detection_run_guid}. *)
val validate_result_provenance_last_detection_run_guid
  :  Atdgen_runtime.Util.Validation.path
  -> result_provenance_last_detection_run_guid
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:result_provenance}. *)
val create_result_provenance
  :  ?conversion_sources:physical_location list
  -> ?first_detection_run_guid:result_provenance_first_detection_run_guid
  -> ?first_detection_time_utc:string
  -> ?invocation_index:int64
  -> ?last_detection_run_guid:result_provenance_last_detection_run_guid
  -> ?last_detection_time_utc:string
  -> ?properties:property_bag
  -> unit
  -> result_provenance

(** Validate a value of type {!type:result_provenance}. *)
val validate_result_provenance
  :  Atdgen_runtime.Util.Validation.path
  -> result_provenance
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:stack_frame}. *)
val create_stack_frame
  :  ?location:location
  -> ?module_:string
  -> ?parameters:string list
  -> ?properties:property_bag
  -> ?thread_id:int64
  -> unit
  -> stack_frame

(** Validate a value of type {!type:stack_frame}. *)
val validate_stack_frame
  :  Atdgen_runtime.Util.Validation.path
  -> stack_frame
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:stack}. *)
val create_stack
  :  frames:stack_frame list
  -> ?message:message
  -> ?properties:property_bag
  -> unit
  -> stack

(** Validate a value of type {!type:stack}. *)
val validate_stack
  :  Atdgen_runtime.Util.Validation.path
  -> stack
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:suppression_guid}. *)
val validate_suppression_guid
  :  Atdgen_runtime.Util.Validation.path
  -> suppression_guid
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:suppression_kind}. *)
val validate_suppression_kind
  :  Atdgen_runtime.Util.Validation.path
  -> suppression_kind
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:suppression_status}. *)
val validate_suppression_status
  :  Atdgen_runtime.Util.Validation.path
  -> suppression_status
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:suppression}. *)
val create_suppression
  :  ?guid:suppression_guid
  -> ?justification:string
  -> kind:suppression_kind
  -> ?location:location
  -> ?properties:property_bag
  -> ?status:suppression_status
  -> unit
  -> suppression

(** Validate a value of type {!type:suppression}. *)
val validate_suppression
  :  Atdgen_runtime.Util.Validation.path
  -> suppression
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:thread_flow_location_importance}. *)
val validate_thread_flow_location_importance
  :  Atdgen_runtime.Util.Validation.path
  -> thread_flow_location_importance
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:tool_component_contents_item}. *)
val validate_tool_component_contents_item
  :  Atdgen_runtime.Util.Validation.path
  -> tool_component_contents_item
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:tool_component_dotted_quad_file_version}. *)
val validate_tool_component_dotted_quad_file_version
  :  Atdgen_runtime.Util.Validation.path
  -> tool_component_dotted_quad_file_version
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:tool_component_guid}. *)
val validate_tool_component_guid
  :  Atdgen_runtime.Util.Validation.path
  -> tool_component_guid
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:tool_component_language}. *)
val validate_tool_component_language
  :  Atdgen_runtime.Util.Validation.path
  -> tool_component_language
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:tool_component_reference_guid}. *)
val validate_tool_component_reference_guid
  :  Atdgen_runtime.Util.Validation.path
  -> tool_component_reference_guid
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:tool_component_reference}. *)
val create_tool_component_reference
  :  ?guid:tool_component_reference_guid
  -> ?index:int64
  -> ?name:string
  -> ?properties:property_bag
  -> unit
  -> tool_component_reference

(** Validate a value of type {!type:tool_component_reference}. *)
val validate_tool_component_reference
  :  Atdgen_runtime.Util.Validation.path
  -> tool_component_reference
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:reporting_descriptor_reference}. *)
val create_reporting_descriptor_reference
  :  ?guid:reporting_descriptor_reference_guid
  -> ?id:string
  -> ?index:int64
  -> ?properties:property_bag
  -> ?tool_component:tool_component_reference
  -> unit
  -> reporting_descriptor_reference

(** Validate a value of type {!type:reporting_descriptor_reference}. *)
val validate_reporting_descriptor_reference
  :  Atdgen_runtime.Util.Validation.path
  -> reporting_descriptor_reference
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:configuration_override}. *)
val create_configuration_override
  :  configuration:reporting_configuration
  -> descriptor:reporting_descriptor_reference
  -> ?properties:property_bag
  -> unit
  -> configuration_override

(** Validate a value of type {!type:configuration_override}. *)
val validate_configuration_override
  :  Atdgen_runtime.Util.Validation.path
  -> configuration_override
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:reporting_descriptor_relationship}. *)
val create_reporting_descriptor_relationship
  :  ?description:message
  -> ?kinds:string list
  -> ?properties:property_bag
  -> target:reporting_descriptor_reference
  -> unit
  -> reporting_descriptor_relationship

(** Validate a value of type {!type:reporting_descriptor_relationship}. *)
val validate_reporting_descriptor_relationship
  :  Atdgen_runtime.Util.Validation.path
  -> reporting_descriptor_relationship
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:reporting_descriptor}. *)
val create_reporting_descriptor
  :  ?default_configuration:reporting_configuration
  -> ?deprecated_guids:reporting_descriptor_deprecated_guids_item list
  -> ?deprecated_ids:string list
  -> ?deprecated_names:string list
  -> ?full_description:multiformat_message_string
  -> ?guid:reporting_descriptor_guid
  -> ?help:multiformat_message_string
  -> ?help_uri:string
  -> id:string
  -> ?message_strings:hm_str_mms
  -> ?name:string
  -> ?properties:property_bag
  -> ?relationships:reporting_descriptor_relationship list
  -> ?short_description:multiformat_message_string
  -> unit
  -> reporting_descriptor

(** Validate a value of type {!type:reporting_descriptor}. *)
val validate_reporting_descriptor
  :  Atdgen_runtime.Util.Validation.path
  -> reporting_descriptor
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:translation_metadata}. *)
val create_translation_metadata
  :  ?download_uri:string
  -> ?full_description:multiformat_message_string
  -> ?full_name:string
  -> ?information_uri:string
  -> name:string
  -> ?properties:property_bag
  -> ?short_description:multiformat_message_string
  -> unit
  -> translation_metadata

(** Validate a value of type {!type:translation_metadata}. *)
val validate_translation_metadata
  :  Atdgen_runtime.Util.Validation.path
  -> translation_metadata
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:tool_component}. *)
val create_tool_component
  :  ?associated_component:tool_component_reference
  -> ?contents:tool_component_contents_item list
  -> ?dotted_quad_file_version:tool_component_dotted_quad_file_version
  -> ?download_uri:string
  -> ?full_description:multiformat_message_string
  -> ?full_name:string
  -> ?global_message_strings:hm_str_mms
  -> ?guid:tool_component_guid
  -> ?information_uri:string
  -> ?is_comprehensive:bool
  -> ?language:tool_component_language
  -> ?localized_data_semantic_version:string
  -> ?locations:artifact_location list
  -> ?minimum_required_localized_data_semantic_version:string
  -> name:string
  -> ?notifications:reporting_descriptor list
  -> ?organization:string
  -> ?product:string
  -> ?product_suite:string
  -> ?properties:property_bag
  -> ?release_date_utc:string
  -> ?rules:reporting_descriptor list
  -> ?semantic_version:string
  -> ?short_description:multiformat_message_string
  -> ?supported_taxonomies:tool_component_reference list
  -> ?taxa:reporting_descriptor list
  -> ?translation_metadata:translation_metadata
  -> ?version:string
  -> unit
  -> tool_component

(** Validate a value of type {!type:tool_component}. *)
val validate_tool_component
  :  Atdgen_runtime.Util.Validation.path
  -> tool_component
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:tool}. *)
val create_tool
  :  driver:tool_component
  -> ?extensions:tool_component list
  -> ?properties:property_bag
  -> unit
  -> tool

(** Validate a value of type {!type:tool}. *)
val validate_tool
  :  Atdgen_runtime.Util.Validation.path
  -> tool
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:web_request}. *)
val create_web_request
  :  ?body:artifact_content
  -> ?headers:hm_str_str
  -> ?index:int64
  -> ?method_:string
  -> ?parameters:hm_str_str
  -> ?properties:property_bag
  -> ?protocol:string
  -> ?target:string
  -> ?version:string
  -> unit
  -> web_request

(** Validate a value of type {!type:web_request}. *)
val validate_web_request
  :  Atdgen_runtime.Util.Validation.path
  -> web_request
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:web_response}. *)
val create_web_response
  :  ?body:artifact_content
  -> ?headers:hm_str_str
  -> ?index:int64
  -> ?no_response_received:bool
  -> ?properties:property_bag
  -> ?protocol:string
  -> ?reason_phrase:string
  -> ?status_code:string
  -> ?version:string
  -> unit
  -> web_response

(** Validate a value of type {!type:web_response}. *)
val validate_web_response
  :  Atdgen_runtime.Util.Validation.path
  -> web_response
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:thread_flow_location}. *)
val create_thread_flow_location
  :  ?execution_order:int64
  -> ?execution_time_utc:string
  -> ?importance:thread_flow_location_importance
  -> ?index:int64
  -> ?kinds:string list
  -> ?location:location
  -> ?module_:string
  -> ?nesting_level:int64
  -> ?properties:property_bag
  -> ?stack:stack
  -> ?state:hm_str_mms
  -> ?taxa:reporting_descriptor_reference list
  -> ?web_request:web_request
  -> ?web_response:web_response
  -> unit
  -> thread_flow_location

(** Validate a value of type {!type:thread_flow_location}. *)
val validate_thread_flow_location
  :  Atdgen_runtime.Util.Validation.path
  -> thread_flow_location
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:thread_flow}. *)
val create_thread_flow
  :  ?id:string
  -> ?immutable_state:hm_str_mms
  -> ?initial_state:hm_str_mms
  -> locations:thread_flow_location list
  -> ?message:message
  -> ?properties:property_bag
  -> unit
  -> thread_flow

(** Validate a value of type {!type:thread_flow}. *)
val validate_thread_flow
  :  Atdgen_runtime.Util.Validation.path
  -> thread_flow
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:code_flow}. *)
val create_code_flow
  :  ?message:message
  -> ?properties:property_bag
  -> thread_flows:thread_flow list
  -> unit
  -> code_flow

(** Validate a value of type {!type:code_flow}. *)
val validate_code_flow
  :  Atdgen_runtime.Util.Validation.path
  -> code_flow
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:node}. *)
val create_node
  :  ?children:node list
  -> id:string
  -> ?label:message
  -> ?location:location
  -> ?properties:property_bag
  -> unit
  -> node

(** Validate a value of type {!type:node}. *)
val validate_node
  :  Atdgen_runtime.Util.Validation.path
  -> node
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:exception_}. *)
val create_exception_
  :  ?inner_exceptions:exception_ list
  -> ?kind:string
  -> ?message:string
  -> ?properties:property_bag
  -> ?stack:stack
  -> unit
  -> exception_

(** Validate a value of type {!type:exception_}. *)
val validate_exception_
  :  Atdgen_runtime.Util.Validation.path
  -> exception_
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:graph}. *)
val create_graph
  :  ?description:message
  -> ?edges:edge list
  -> ?nodes:node list
  -> ?properties:property_bag
  -> unit
  -> graph

(** Validate a value of type {!type:graph}. *)
val validate_graph
  :  Atdgen_runtime.Util.Validation.path
  -> graph
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:result}. *)
val create_result
  :  ?analysis_target:artifact_location
  -> ?attachments:attachment list
  -> ?baseline_state:result_baseline_state
  -> ?code_flows:code_flow list
  -> ?correlation_guid:result_correlation_guid
  -> ?fingerprints:hm_str_str
  -> ?fixes:fix list
  -> ?graph_traversals:graph_traversal list
  -> ?graphs:graph list
  -> ?guid:result_guid
  -> ?hosted_viewer_uri:string
  -> ?kind:result_kind
  -> ?level:result_level
  -> ?locations:location list
  -> message:message
  -> ?occurrence_count:int64
  -> ?partial_fingerprints:hm_str_str
  -> ?properties:property_bag
  -> ?provenance:result_provenance
  -> ?rank:int64
  -> ?related_locations:location list
  -> ?rule:reporting_descriptor_reference
  -> ?rule_id:string
  -> ?rule_index:int64
  -> ?stacks:stack list
  -> ?suppressions:suppression list
  -> ?taxa:reporting_descriptor_reference list
  -> ?web_request:web_request
  -> ?web_response:web_response
  -> ?work_item_uris:string list
  -> unit
  -> result

(** Validate a value of type {!type:result}. *)
val validate_result
  :  Atdgen_runtime.Util.Validation.path
  -> result
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:notification}. *)
val create_notification
  :  ?associated_rule:reporting_descriptor_reference
  -> ?descriptor:reporting_descriptor_reference
  -> ?exception_:exception_
  -> ?level:notification_level
  -> ?locations:location list
  -> message:message
  -> ?properties:property_bag
  -> ?thread_id:int64
  -> ?time_utc:string
  -> unit
  -> notification

(** Validate a value of type {!type:notification}. *)
val validate_notification
  :  Atdgen_runtime.Util.Validation.path
  -> notification
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:invocation}. *)
val create_invocation
  :  ?account:string
  -> ?arguments:string
  -> ?command_line:string
  -> ?end_time_utc:string
  -> ?environment_variables:hm_str_str
  -> ?executable_location:artifact_location
  -> execution_successful:bool
  -> ?exit_code:int64
  -> ?exit_code_description:string
  -> ?exit_signal_name:string
  -> ?exit_signal_number:int64
  -> ?notification_configuration_overrides:configuration_override list
  -> ?process_id:int64
  -> ?process_start_failure_message:string
  -> ?properties:property_bag
  -> ?response_files:artifact_location list
  -> ?rule_configuration_overrides:configuration_override list
  -> ?start_time_utc:string
  -> ?stderr:artifact_location
  -> ?stdin:artifact_location
  -> ?stdout:artifact_location
  -> ?stdout_stderr:artifact_location
  -> ?tool_configuration_notifications:notification list
  -> ?tool_execution_notifications:notification list
  -> ?working_directory:artifact_location
  -> unit
  -> invocation

(** Validate a value of type {!type:invocation}. *)
val validate_invocation
  :  Atdgen_runtime.Util.Validation.path
  -> invocation
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:conversion}. *)
val create_conversion
  :  ?analysis_tool_log_files:artifact_location list
  -> ?invocation:invocation
  -> ?properties:property_bag
  -> tool:tool
  -> unit
  -> conversion

(** Validate a value of type {!type:conversion}. *)
val validate_conversion
  :  Atdgen_runtime.Util.Validation.path
  -> conversion
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:artifact}. *)
val create_artifact
  :  ?contents:artifact_content
  -> ?description:message
  -> ?encoding:string
  -> ?hashes:hm_str_str
  -> ?last_modified_time_utc:string
  -> ?length:int64
  -> ?location:artifact_location
  -> ?mime_type:artifact_mimetype
  -> ?offset:int64
  -> ?parent_index:int64
  -> ?properties:external_properties
  -> ?roles:artifact_roles_item list
  -> ?source_language:string
  -> unit
  -> artifact

(** Validate a value of type {!type:artifact}. *)
val validate_artifact
  :  Atdgen_runtime.Util.Validation.path
  -> artifact
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:external_properties}. *)
val create_external_properties
  :  ?addresses:address list
  -> ?artifacts:artifact list
  -> ?conversion:conversion
  -> ?driver:tool_component
  -> ?extensions:tool_component list
  -> ?externalized_properties:property_bag
  -> ?graph:graph list
  -> ?guid:external_properties_guid
  -> ?invocations:invocation
  -> ?logical_locations:logical_location list
  -> ?policies:tool_component list
  -> ?properties:property_bag
  -> ?results:result
  -> ?run_guid:external_properties_run_guid
  -> ?schema:string
  -> ?taxonomies:tool_component list
  -> ?thread_flow_locations:thread_flow_location list
  -> ?translations:tool_component list
  -> ?version:external_properties_version
  -> ?web_requests:web_request list
  -> ?web_responses:web_response list
  -> unit
  -> external_properties

(** Validate a value of type {!type:external_properties}. *)
val validate_external_properties
  :  Atdgen_runtime.Util.Validation.path
  -> external_properties
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:version_control_details}. *)
val create_version_control_details
  :  ?as_of_time_utc:string
  -> ?branch:string
  -> ?mapped_to:artifact_location
  -> ?properties:property_bag
  -> repository_uri:string
  -> ?revision_id:string
  -> ?revision_tag:string
  -> unit
  -> version_control_details

(** Validate a value of type {!type:version_control_details}. *)
val validate_version_control_details
  :  Atdgen_runtime.Util.Validation.path
  -> version_control_details
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:special_locations}. *)
val create_special_locations
  :  ?display_base:artifact_location
  -> ?properties:property_bag
  -> unit
  -> special_locations

(** Validate a value of type {!type:special_locations}. *)
val validate_special_locations
  :  Atdgen_runtime.Util.Validation.path
  -> special_locations
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:sarif_version}. *)
val validate_sarif_version
  :  Atdgen_runtime.Util.Validation.path
  -> sarif_version
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:run_language}. *)
val validate_run_language
  :  Atdgen_runtime.Util.Validation.path
  -> run_language
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:run_column_kind}. *)
val validate_run_column_kind
  :  Atdgen_runtime.Util.Validation.path
  -> run_column_kind
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:run_baseline_guid}. *)
val validate_run_baseline_guid
  :  Atdgen_runtime.Util.Validation.path
  -> run_baseline_guid
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:run_automation_details_guid}. *)
val validate_run_automation_details_guid
  :  Atdgen_runtime.Util.Validation.path
  -> run_automation_details_guid
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:run_automation_details_correlation_guid}. *)
val validate_run_automation_details_correlation_guid
  :  Atdgen_runtime.Util.Validation.path
  -> run_automation_details_correlation_guid
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:run_automation_details}. *)
val create_run_automation_details
  :  ?correlation_guid:run_automation_details_correlation_guid
  -> ?description:message
  -> ?guid:run_automation_details_guid
  -> ?id:string
  -> ?properties:property_bag
  -> unit
  -> run_automation_details

(** Validate a value of type {!type:run_automation_details}. *)
val validate_run_automation_details
  :  Atdgen_runtime.Util.Validation.path
  -> run_automation_details
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:hm_str_al}. *)
val validate_hm_str_al
  :  Atdgen_runtime.Util.Validation.path
  -> hm_str_al
  -> Atdgen_runtime.Util.Validation.error option

(** Validate a value of type {!type:external_property_file_reference_guid}. *)
val validate_external_property_file_reference_guid
  :  Atdgen_runtime.Util.Validation.path
  -> external_property_file_reference_guid
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:external_property_file_reference}. *)
val create_external_property_file_reference
  :  ?guid:external_property_file_reference_guid
  -> ?item_count:int64
  -> ?location:artifact_location
  -> ?properties:property_bag
  -> unit
  -> external_property_file_reference

(** Validate a value of type {!type:external_property_file_reference}. *)
val validate_external_property_file_reference
  :  Atdgen_runtime.Util.Validation.path
  -> external_property_file_reference
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:external_property_file_references}. *)
val create_external_property_file_references
  :  ?addresses:external_property_file_reference list
  -> ?artifacts:external_property_file_reference list
  -> ?conversion:external_property_file_reference
  -> ?driver:external_property_file_reference
  -> ?extensions:external_property_file_reference list
  -> ?externalized_properties:external_property_file_reference
  -> ?graphs:external_property_file_reference list
  -> ?invocations:external_property_file_reference list
  -> ?logical_locations:external_property_file_reference list
  -> ?policies:external_property_file_reference list
  -> ?properties:property_bag
  -> ?results:external_property_file_reference list
  -> ?taxonomies:external_property_file_reference list
  -> ?thread_flow_locations:external_property_file_reference list
  -> ?translations:external_property_file_reference list
  -> ?web_requests:external_property_file_reference list
  -> ?web_responses:external_property_file_reference list
  -> unit
  -> external_property_file_references

(** Validate a value of type {!type:external_property_file_references}. *)
val validate_external_property_file_references
  :  Atdgen_runtime.Util.Validation.path
  -> external_property_file_references
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:run}. *)
val create_run
  :  ?addresses:address list
  -> ?artifacts:artifact list
  -> ?automation_details:run_automation_details
  -> ?baseline_guid:run_baseline_guid
  -> ?column_kind:run_column_kind
  -> ?conversion:conversion
  -> ?default_encoding:string
  -> ?default_source_language:string
  -> ?external_property_file_references:external_property_file_references
  -> ?graphs:graph list
  -> ?invocations:invocation list
  -> ?language:run_language
  -> ?logical_locations:logical_location list
  -> ?newline_sequences:string list
  -> ?original_uri_base_ids:hm_str_al
  -> ?policies:tool_component list
  -> ?properties:property_bag
  -> ?redaction_tokens:string list
  -> ?results:result list
  -> ?run_aggregates:run_automation_details list
  -> ?special_locations:special_locations
  -> ?taxonomies:tool_component list
  -> ?thread_flow_locations:thread_flow_location list
  -> tool:tool
  -> ?translations:tool_component list
  -> ?version_control_provenance:version_control_details list
  -> ?web_requests:web_request list
  -> ?web_responses:web_response list
  -> unit
  -> run

(** Validate a value of type {!type:run}. *)
val validate_run
  :  Atdgen_runtime.Util.Validation.path
  -> run
  -> Atdgen_runtime.Util.Validation.error option

(** Create a record of type {!type:sarif_json_schema}. *)
val create_sarif_json_schema
  :  version:sarif_version
  -> ?inline_external_properties:external_properties list
  -> ?properties:property_bag
  -> runs:run list
  -> ?schema:string
  -> unit
  -> sarif_json_schema

(** Validate a value of type {!type:sarif_json_schema}. *)
val validate_sarif_json_schema
  :  Atdgen_runtime.Util.Validation.path
  -> sarif_json_schema
  -> Atdgen_runtime.Util.Validation.error option
