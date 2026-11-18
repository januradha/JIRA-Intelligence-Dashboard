-- DDL for schema team_8.quantum_force_gold
-- Generated 2026-11-18 from Unity Catalog (SHOW CREATE TABLE)
-- Tables: 23

CREATE SCHEMA IF NOT EXISTS team_8.quantum_force_gold;

-- Table: bridge_project_sprint
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.bridge_project_sprint (
  data_type STRING COLLATE UTF8_BINARY,
  is_primary_project BOOLEAN,
  issue_count BIGINT,
  project_id STRING COLLATE UTF8_BINARY,
  sprint_id STRING COLLATE UTF8_BINARY,
  _load_run_id STRING COLLATE UTF8_BINARY,
  _load_timestamp TIMESTAMP)
USING delta
COMMENT 'Project to sprint many-to-many bridge'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: bridge_team_role
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.bridge_team_role (
  data_type STRING COLLATE UTF8_BINARY,
  is_primary_role BOOLEAN,
  role_id STRING COLLATE UTF8_BINARY,
  team_id STRING COLLATE UTF8_BINARY,
  _load_run_id STRING COLLATE UTF8_BINARY,
  _load_timestamp TIMESTAMP)
USING delta
COMMENT 'Team to role bridge'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: bridge_user_team_access
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.bridge_user_team_access (
  access_id STRING COLLATE UTF8_BINARY,
  access_scope STRING COLLATE UTF8_BINARY,
  data_type STRING COLLATE UTF8_BINARY,
  is_active BOOLEAN,
  principal_name STRING COLLATE UTF8_BINARY,
  role_id STRING COLLATE UTF8_BINARY,
  team_id STRING COLLATE UTF8_BINARY,
  _load_run_id STRING COLLATE UTF8_BINARY,
  _load_timestamp TIMESTAMP)
USING delta
COMMENT 'User to team access bridge'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: dim_calendar
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.dim_calendar (
  data_type STRING COLLATE UTF8_BINARY,
  date STRING COLLATE UTF8_BINARY,
  date_key BIGINT,
  day BIGINT,
  day_name STRING COLLATE UTF8_BINARY,
  day_of_week BIGINT,
  is_weekend BOOLEAN,
  month BIGINT,
  month_name STRING COLLATE UTF8_BINARY,
  quarter BIGINT,
  week_of_year BIGINT,
  year BIGINT,
  year_quarter STRING COLLATE UTF8_BINARY,
  _load_run_id STRING COLLATE UTF8_BINARY,
  _load_timestamp TIMESTAMP)
USING delta
COMMENT 'Calendar dimension'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: dim_date
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.dim_date (
  date_key BIGINT,
  day BIGINT,
  day_name STRING COLLATE UTF8_BINARY,
  day_of_week BIGINT,
  is_weekend BOOLEAN,
  month BIGINT,
  month_name STRING COLLATE UTF8_BINARY,
  quarter BIGINT,
  week_of_year BIGINT,
  year BIGINT,
  year_quarter STRING COLLATE UTF8_BINARY,
  date DATE,
  _gold_load_timestamp TIMESTAMP)
USING delta
COMMENT 'Calendar dimension'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: dim_developer
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.dim_developer (
  capacity_points_per_sprint BIGINT COMMENT 'Represents the total number of points a developer can handle within a sprint, indicating their potential workload capacity.',
  developer_id STRING COLLATE UTF8_BINARY COMMENT 'A unique identifier assigned to each developer, essential for tracking contributions and roles across different projects.',
  developer_name STRING COLLATE UTF8_BINARY COMMENT 'The full name of the developer, which helps in identifying the individual in reports and project discussions.',
  person_id STRING COLLATE UTF8_BINARY COMMENT 'An identifier that links the developer to their personal information, used for integrating with other HR or personnel databases.',
  role_id STRING COLLATE UTF8_BINARY COMMENT 'Identifies the specific role or position of the developer within a team, allowing for better organization and assignment of responsibilities.',
  team STRING COLLATE UTF8_BINARY COMMENT 'The name of the development team to which the developer belongs, important for team dynamics and project collaboration.',
  team_id STRING COLLATE UTF8_BINARY COMMENT 'A unique identifier for the team, facilitating the tracking of team-specific performance and contributions across projects.',
  _gold_load_timestamp TIMESTAMP)
USING delta
COMMENT 'Developers with sprint capacity'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: dim_epic
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.dim_epic (
  epic_id STRING COLLATE UTF8_BINARY,
  epic_name STRING COLLATE UTF8_BINARY,
  project_id STRING COLLATE UTF8_BINARY,
  project_key STRING COLLATE UTF8_BINARY,
  status STRING COLLATE UTF8_BINARY,
  created_date STRING COLLATE UTF8_BINARY,
  data_type STRING COLLATE UTF8_BINARY,
  _load_run_id STRING COLLATE UTF8_BINARY,
  _load_timestamp TIMESTAMP,
  end_date DATE COMMENT 'Date the last epic issue was resolved; NULL while open')
USING delta
COMMENT 'Jira epic dimension'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: dim_feature
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.dim_feature (
  feature_id STRING COLLATE UTF8_BINARY,
  feature_name STRING COLLATE UTF8_BINARY,
  epic_id STRING COLLATE UTF8_BINARY,
  project_id STRING COLLATE UTF8_BINARY,
  status STRING COLLATE UTF8_BINARY,
  data_type STRING COLLATE UTF8_BINARY,
  _load_run_id STRING COLLATE UTF8_BINARY,
  _load_timestamp TIMESTAMP,
  end_date DATE COMMENT 'Date the last feature issue was resolved; NULL while open')
USING delta
COMMENT 'Jira feature dimension'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: dim_person
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.dim_person (
  person_id STRING COLLATE UTF8_BINARY,
  person_name STRING COLLATE UTF8_BINARY,
  team_id STRING COLLATE UTF8_BINARY,
  team STRING COLLATE UTF8_BINARY,
  role_id STRING COLLATE UTF8_BINARY,
  role_name STRING COLLATE UTF8_BINARY,
  person_type STRING COLLATE UTF8_BINARY,
  developer_id STRING COLLATE UTF8_BINARY,
  data_type STRING COLLATE UTF8_BINARY,
  _load_run_id STRING COLLATE UTF8_BINARY,
  _load_timestamp TIMESTAMP)
USING delta
COMMENT 'People and developer dimension'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: dim_project
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.dim_project (
  project_id STRING COLLATE UTF8_BINARY,
  project_key STRING COLLATE UTF8_BINARY,
  project_name STRING COLLATE UTF8_BINARY,
  description STRING COLLATE UTF8_BINARY,
  project_type STRING COLLATE UTF8_BINARY,
  source_project_key STRING COLLATE UTF8_BINARY,
  data_type STRING COLLATE UTF8_BINARY,
  _load_run_id STRING COLLATE UTF8_BINARY,
  _load_timestamp TIMESTAMP,
  end_date DATE COMMENT 'Planned/actual project end date')
USING delta
COMMENT 'Jira project dimension'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: dim_role
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.dim_role (
  role_id STRING COLLATE UTF8_BINARY,
  role_name STRING COLLATE UTF8_BINARY,
  description STRING COLLATE UTF8_BINARY,
  data_type STRING COLLATE UTF8_BINARY,
  _load_run_id STRING COLLATE UTF8_BINARY,
  _load_timestamp TIMESTAMP)
USING delta
COMMENT 'Role dimension'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: dim_sprint
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.dim_sprint (
  sprint_id STRING COLLATE UTF8_BINARY,
  sprint_name STRING COLLATE UTF8_BINARY,
  sprint_number BIGINT,
  start_date STRING COLLATE UTF8_BINARY,
  end_date STRING COLLATE UTF8_BINARY,
  duration_days BIGINT,
  sprint_type STRING COLLATE UTF8_BINARY,
  status STRING COLLATE UTF8_BINARY,
  project_id STRING COLLATE UTF8_BINARY,
  start_date_key BIGINT,
  end_date_key BIGINT,
  data_type STRING COLLATE UTF8_BINARY,
  _load_run_id STRING COLLATE UTF8_BINARY,
  _load_timestamp TIMESTAMP)
USING delta
COMMENT 'Jira sprint dimension'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: dim_team
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.dim_team (
  team_id STRING COLLATE UTF8_BINARY,
  team_name STRING COLLATE UTF8_BINARY,
  team_type STRING COLLATE UTF8_BINARY,
  description STRING COLLATE UTF8_BINARY,
  data_type STRING COLLATE UTF8_BINARY,
  _load_run_id STRING COLLATE UTF8_BINARY,
  _load_timestamp TIMESTAMP)
USING delta
COMMENT 'Team dimension'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: dim_time
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.dim_time (
  data_type STRING COLLATE UTF8_BINARY,
  hour BIGINT,
  minute BIGINT,
  second BIGINT,
  time STRING COLLATE UTF8_BINARY,
  time_key BIGINT,
  time_period STRING COLLATE UTF8_BINARY,
  _load_run_id STRING COLLATE UTF8_BINARY,
  _load_timestamp TIMESTAMP)
USING delta
COMMENT 'Time dimension'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: dq_validation_results
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.dq_validation_results (
  run_id STRING COLLATE UTF8_BINARY,
  table_name STRING COLLATE UTF8_BINARY,
  check_name STRING COLLATE UTF8_BINARY,
  severity STRING COLLATE UTF8_BINARY,
  failed_rows BIGINT,
  status STRING COLLATE UTF8_BINARY,
  detail STRING COLLATE UTF8_BINARY,
  checked_at TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: fact_issue
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.fact_issue (
  assignee STRING COLLATE UTF8_BINARY,
  assignee_person_id STRING COLLATE UTF8_BINARY,
  assignee_role_id STRING COLLATE UTF8_BINARY,
  assignee_source STRING COLLATE UTF8_BINARY,
  created STRING COLLATE UTF8_BINARY,
  created_date_key BIGINT,
  created_time_key BIGINT,
  cycle_time_days DOUBLE,
  data_type STRING COLLATE UTF8_BINARY,
  description STRING COLLATE UTF8_BINARY,
  developer_id STRING COLLATE UTF8_BINARY,
  epic_id STRING COLLATE UTF8_BINARY,
  feature_id STRING COLLATE UTF8_BINARY,
  is_resolved BOOLEAN,
  issue_id STRING COLLATE UTF8_BINARY,
  issue_key STRING COLLATE UTF8_BINARY,
  issue_type STRING COLLATE UTF8_BINARY,
  priority STRING COLLATE UTF8_BINARY,
  project_id STRING COLLATE UTF8_BINARY,
  project_key STRING COLLATE UTF8_BINARY,
  reporter STRING COLLATE UTF8_BINARY,
  resolution STRING COLLATE UTF8_BINARY,
  resolution_date STRING COLLATE UTF8_BINARY,
  resolution_date_key BIGINT,
  resolution_notes STRING COLLATE UTF8_BINARY,
  resolution_time_key BIGINT,
  source_issue_key STRING COLLATE UTF8_BINARY,
  sprint_id STRING COLLATE UTF8_BINARY,
  status STRING COLLATE UTF8_BINARY,
  story_points DOUBLE,
  summary STRING COLLATE UTF8_BINARY,
  team STRING COLLATE UTF8_BINARY,
  team_id STRING COLLATE UTF8_BINARY,
  updated STRING COLLATE UTF8_BINARY,
  updated_date_key BIGINT,
  updated_time_key BIGINT,
  created_ts TIMESTAMP,
  updated_ts TIMESTAMP,
  resolution_date_ts TIMESTAMP,
  assignee_person_name STRING COLLATE UTF8_BINARY,
  assignee_person_type STRING COLLATE UTF8_BINARY,
  _load_run_id STRING COLLATE UTF8_BINARY,
  _load_timestamp TIMESTAMP)
USING delta
COMMENT 'One row per Jira issue, enriched with assignee person attributes'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: fact_issue_status_history
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.fact_issue_status_history (
  data_type STRING COLLATE UTF8_BINARY,
  history_id STRING COLLATE UTF8_BINARY,
  issue_id STRING COLLATE UTF8_BINARY,
  issue_key STRING COLLATE UTF8_BINARY,
  project_id STRING COLLATE UTF8_BINARY,
  sequence_number BIGINT,
  status STRING COLLATE UTF8_BINARY,
  status_changed_at STRING COLLATE UTF8_BINARY,
  status_date_key BIGINT,
  status_time_key BIGINT,
  team_id STRING COLLATE UTF8_BINARY,
  status_changed_at_ts TIMESTAMP,
  _gold_load_timestamp TIMESTAMP)
USING delta
COMMENT 'Issue status transitions (one row per change)'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: fact_sprint_delivery
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.fact_sprint_delivery (
  team_id STRING COLLATE UTF8_BINARY,
  project_id STRING COLLATE UTF8_BINARY,
  sprint_id STRING COLLATE UTF8_BINARY,
  assigned_issue_count BIGINT,
  assigned_points_proxy DOUBLE,
  completed_points DOUBLE,
  completed_issue_count BIGINT,
  open_issue_count BIGINT,
  team_capacity_points_per_sprint DOUBLE,
  developer_count BIGINT,
  spillover_issue_count BIGINT,
  commitment_measure_type STRING COLLATE UTF8_BINARY,
  completion_rate DOUBLE,
  _load_run_id STRING COLLATE UTF8_BINARY,
  _load_timestamp TIMESTAMP)
USING delta
COMMENT 'Sprint delivery metrics by project, sprint and team'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: fact_status_transition
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.fact_status_transition (
  data_type STRING COLLATE UTF8_BINARY,
  history_id STRING COLLATE UTF8_BINARY,
  issue_id STRING COLLATE UTF8_BINARY,
  issue_key STRING COLLATE UTF8_BINARY,
  project_id STRING COLLATE UTF8_BINARY,
  sequence_number INT,
  status STRING COLLATE UTF8_BINARY,
  status_changed_at STRING COLLATE UTF8_BINARY,
  status_date_key BIGINT,
  status_time_key BIGINT,
  team_id STRING COLLATE UTF8_BINARY,
  status_changed_ts TIMESTAMP,
  _load_run_id STRING COLLATE UTF8_BINARY,
  _load_timestamp TIMESTAMP)
USING delta
COMMENT 'One row per simulated Jira status transition'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: gold_defect_knowledge
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.gold_defect_knowledge (
  issue_id STRING COLLATE UTF8_BINARY,
  issue_key STRING COLLATE UTF8_BINARY,
  project_id STRING COLLATE UTF8_BINARY,
  project_key STRING COLLATE UTF8_BINARY,
  team_id STRING COLLATE UTF8_BINARY,
  team STRING COLLATE UTF8_BINARY,
  assignee_person_id STRING COLLATE UTF8_BINARY,
  developer_id STRING COLLATE UTF8_BINARY,
  summary STRING COLLATE UTF8_BINARY,
  issue_type STRING COLLATE UTF8_BINARY,
  priority STRING COLLATE UTF8_BINARY,
  story_points DOUBLE,
  status STRING COLLATE UTF8_BINARY,
  is_resolved BOOLEAN,
  resolution STRING COLLATE UTF8_BINARY,
  resolution_date STRING COLLATE UTF8_BINARY,
  cycle_time_days DOUBLE,
  epic_id STRING COLLATE UTF8_BINARY,
  feature_id STRING COLLATE UTF8_BINARY,
  sprint_id STRING COLLATE UTF8_BINARY,
  data_type STRING COLLATE UTF8_BINARY,
  _load_run_id STRING COLLATE UTF8_BINARY,
  _load_timestamp TIMESTAMP)
USING delta
COMMENT 'Knowledge base of Jira bug issues and their descriptive summaries'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: issues_kedb_search_source
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.issues_kedb_search_source (
  issue_id STRING COLLATE UTF8_BINARY,
  issue_key STRING COLLATE UTF8_BINARY,
  issue_type STRING COLLATE UTF8_BINARY,
  summary STRING COLLATE UTF8_BINARY,
  description STRING COLLATE UTF8_BINARY,
  priority STRING COLLATE UTF8_BINARY,
  status STRING COLLATE UTF8_BINARY,
  team STRING COLLATE UTF8_BINARY,
  team_id STRING COLLATE UTF8_BINARY,
  assignee_person_name STRING COLLATE UTF8_BINARY,
  created_ts TIMESTAMP,
  updated_ts TIMESTAMP,
  resolution_date_ts TIMESTAMP,
  is_resolved BOOLEAN,
  resolution STRING COLLATE UTF8_BINARY,
  resolution_notes STRING COLLATE UTF8_BINARY,
  cycle_time_days DOUBLE,
  search_text STRING COLLATE UTF8_BINARY)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpoint.writeStatsAsJson' = 'false',
  'delta.checkpoint.writeStatsAsStruct' = 'true',
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: kpi_sprint_velocity
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.kpi_sprint_velocity (
  team_id STRING COLLATE UTF8_BINARY,
  sprint_id STRING COLLATE UTF8_BINARY,
  sprint_name STRING COLLATE UTF8_BINARY,
  sprint_number BIGINT,
  start_date DATE,
  end_date DATE,
  project_id STRING COLLATE UTF8_BINARY,
  issues_committed BIGINT,
  story_points_committed BIGINT,
  issues_completed BIGINT,
  story_points_completed BIGINT,
  story_points_completed_in_sprint BIGINT,
  avg_cycle_time_days DOUBLE,
  team_name STRING COLLATE UTF8_BINARY,
  team_capacity_points BIGINT,
  team_developers BIGINT,
  completion_rate DOUBLE,
  capacity_utilization DOUBLE,
  _gold_load_timestamp TIMESTAMP)
USING delta
COMMENT 'Sprint velocity per sprint and team'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: kpi_team_throughput
CREATE TABLE IF NOT EXISTS team_8.quantum_force_gold.kpi_team_throughput (
  team_id STRING COLLATE UTF8_BINARY,
  month DATE,
  issues_created BIGINT,
  story_points_created DOUBLE,
  issues_resolved BIGINT,
  story_points_resolved DOUBLE,
  avg_cycle_time_days DOUBLE,
  median_cycle_time_days DOUBLE,
  high_priority_resolved BIGINT,
  net_backlog_change BIGINT,
  team_name STRING COLLATE UTF8_BINARY,
  _gold_load_timestamp TIMESTAMP)
USING delta
COMMENT 'Monthly created vs resolved throughput per team'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');
