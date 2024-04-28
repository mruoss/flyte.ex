defmodule Flyteidl.Service.AdminService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl.service.AdminService", protoc_gen_elixir_version: "0.12.0"

  rpc :CreateTask, Flyteidl.Admin.TaskCreateRequest, Flyteidl.Admin.TaskCreateResponse

  rpc :GetTask, Flyteidl.Admin.ObjectGetRequest, Flyteidl.Admin.Task

  rpc :ListTaskIds,
      Flyteidl.Admin.NamedEntityIdentifierListRequest,
      Flyteidl.Admin.NamedEntityIdentifierList

  rpc :ListTasks, Flyteidl.Admin.ResourceListRequest, Flyteidl.Admin.TaskList

  rpc :CreateWorkflow, Flyteidl.Admin.WorkflowCreateRequest, Flyteidl.Admin.WorkflowCreateResponse

  rpc :GetWorkflow, Flyteidl.Admin.ObjectGetRequest, Flyteidl.Admin.Workflow

  rpc :ListWorkflowIds,
      Flyteidl.Admin.NamedEntityIdentifierListRequest,
      Flyteidl.Admin.NamedEntityIdentifierList

  rpc :ListWorkflows, Flyteidl.Admin.ResourceListRequest, Flyteidl.Admin.WorkflowList

  rpc :CreateLaunchPlan,
      Flyteidl.Admin.LaunchPlanCreateRequest,
      Flyteidl.Admin.LaunchPlanCreateResponse

  rpc :GetLaunchPlan, Flyteidl.Admin.ObjectGetRequest, Flyteidl.Admin.LaunchPlan

  rpc :GetActiveLaunchPlan, Flyteidl.Admin.ActiveLaunchPlanRequest, Flyteidl.Admin.LaunchPlan

  rpc :ListActiveLaunchPlans,
      Flyteidl.Admin.ActiveLaunchPlanListRequest,
      Flyteidl.Admin.LaunchPlanList

  rpc :ListLaunchPlanIds,
      Flyteidl.Admin.NamedEntityIdentifierListRequest,
      Flyteidl.Admin.NamedEntityIdentifierList

  rpc :ListLaunchPlans, Flyteidl.Admin.ResourceListRequest, Flyteidl.Admin.LaunchPlanList

  rpc :UpdateLaunchPlan,
      Flyteidl.Admin.LaunchPlanUpdateRequest,
      Flyteidl.Admin.LaunchPlanUpdateResponse

  rpc :CreateExecution,
      Flyteidl.Admin.ExecutionCreateRequest,
      Flyteidl.Admin.ExecutionCreateResponse

  rpc :RelaunchExecution,
      Flyteidl.Admin.ExecutionRelaunchRequest,
      Flyteidl.Admin.ExecutionCreateResponse

  rpc :RecoverExecution,
      Flyteidl.Admin.ExecutionRecoverRequest,
      Flyteidl.Admin.ExecutionCreateResponse

  rpc :GetExecution, Flyteidl.Admin.WorkflowExecutionGetRequest, Flyteidl.Admin.Execution

  rpc :UpdateExecution,
      Flyteidl.Admin.ExecutionUpdateRequest,
      Flyteidl.Admin.ExecutionUpdateResponse

  rpc :GetExecutionData,
      Flyteidl.Admin.WorkflowExecutionGetDataRequest,
      Flyteidl.Admin.WorkflowExecutionGetDataResponse

  rpc :ListExecutions, Flyteidl.Admin.ResourceListRequest, Flyteidl.Admin.ExecutionList

  rpc :TerminateExecution,
      Flyteidl.Admin.ExecutionTerminateRequest,
      Flyteidl.Admin.ExecutionTerminateResponse

  rpc :GetNodeExecution, Flyteidl.Admin.NodeExecutionGetRequest, Flyteidl.Admin.NodeExecution

  rpc :ListNodeExecutions,
      Flyteidl.Admin.NodeExecutionListRequest,
      Flyteidl.Admin.NodeExecutionList

  rpc :ListNodeExecutionsForTask,
      Flyteidl.Admin.NodeExecutionForTaskListRequest,
      Flyteidl.Admin.NodeExecutionList

  rpc :GetNodeExecutionData,
      Flyteidl.Admin.NodeExecutionGetDataRequest,
      Flyteidl.Admin.NodeExecutionGetDataResponse

  rpc :RegisterProject,
      Flyteidl.Admin.ProjectRegisterRequest,
      Flyteidl.Admin.ProjectRegisterResponse

  rpc :UpdateProject, Flyteidl.Admin.Project, Flyteidl.Admin.ProjectUpdateResponse

  rpc :ListProjects, Flyteidl.Admin.ProjectListRequest, Flyteidl.Admin.Projects

  rpc :CreateWorkflowEvent,
      Flyteidl.Admin.WorkflowExecutionEventRequest,
      Flyteidl.Admin.WorkflowExecutionEventResponse

  rpc :CreateNodeEvent,
      Flyteidl.Admin.NodeExecutionEventRequest,
      Flyteidl.Admin.NodeExecutionEventResponse

  rpc :CreateTaskEvent,
      Flyteidl.Admin.TaskExecutionEventRequest,
      Flyteidl.Admin.TaskExecutionEventResponse

  rpc :GetTaskExecution, Flyteidl.Admin.TaskExecutionGetRequest, Flyteidl.Admin.TaskExecution

  rpc :ListTaskExecutions,
      Flyteidl.Admin.TaskExecutionListRequest,
      Flyteidl.Admin.TaskExecutionList

  rpc :GetTaskExecutionData,
      Flyteidl.Admin.TaskExecutionGetDataRequest,
      Flyteidl.Admin.TaskExecutionGetDataResponse

  rpc :UpdateProjectDomainAttributes,
      Flyteidl.Admin.ProjectDomainAttributesUpdateRequest,
      Flyteidl.Admin.ProjectDomainAttributesUpdateResponse

  rpc :GetProjectDomainAttributes,
      Flyteidl.Admin.ProjectDomainAttributesGetRequest,
      Flyteidl.Admin.ProjectDomainAttributesGetResponse

  rpc :DeleteProjectDomainAttributes,
      Flyteidl.Admin.ProjectDomainAttributesDeleteRequest,
      Flyteidl.Admin.ProjectDomainAttributesDeleteResponse

  rpc :UpdateProjectAttributes,
      Flyteidl.Admin.ProjectAttributesUpdateRequest,
      Flyteidl.Admin.ProjectAttributesUpdateResponse

  rpc :GetProjectAttributes,
      Flyteidl.Admin.ProjectAttributesGetRequest,
      Flyteidl.Admin.ProjectAttributesGetResponse

  rpc :DeleteProjectAttributes,
      Flyteidl.Admin.ProjectAttributesDeleteRequest,
      Flyteidl.Admin.ProjectAttributesDeleteResponse

  rpc :UpdateWorkflowAttributes,
      Flyteidl.Admin.WorkflowAttributesUpdateRequest,
      Flyteidl.Admin.WorkflowAttributesUpdateResponse

  rpc :GetWorkflowAttributes,
      Flyteidl.Admin.WorkflowAttributesGetRequest,
      Flyteidl.Admin.WorkflowAttributesGetResponse

  rpc :DeleteWorkflowAttributes,
      Flyteidl.Admin.WorkflowAttributesDeleteRequest,
      Flyteidl.Admin.WorkflowAttributesDeleteResponse

  rpc :ListMatchableAttributes,
      Flyteidl.Admin.ListMatchableAttributesRequest,
      Flyteidl.Admin.ListMatchableAttributesResponse

  rpc :ListNamedEntities, Flyteidl.Admin.NamedEntityListRequest, Flyteidl.Admin.NamedEntityList

  rpc :GetNamedEntity, Flyteidl.Admin.NamedEntityGetRequest, Flyteidl.Admin.NamedEntity

  rpc :UpdateNamedEntity,
      Flyteidl.Admin.NamedEntityUpdateRequest,
      Flyteidl.Admin.NamedEntityUpdateResponse

  rpc :GetVersion, Flyteidl.Admin.GetVersionRequest, Flyteidl.Admin.GetVersionResponse

  rpc :GetDescriptionEntity, Flyteidl.Admin.ObjectGetRequest, Flyteidl.Admin.DescriptionEntity

  rpc :ListDescriptionEntities,
      Flyteidl.Admin.DescriptionEntityListRequest,
      Flyteidl.Admin.DescriptionEntityList

  rpc :GetExecutionMetrics,
      Flyteidl.Admin.WorkflowExecutionGetMetricsRequest,
      Flyteidl.Admin.WorkflowExecutionGetMetricsResponse
end

defmodule Flyteidl.Service.AdminService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl.Service.AdminService.Service
end