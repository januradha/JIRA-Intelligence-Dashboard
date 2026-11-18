-- DDL for schema team_8.quantum_force
-- Generated 2026-11-18 from Unity Catalog (SHOW CREATE TABLE)
-- Tables: 22

CREATE SCHEMA IF NOT EXISTS team_8.quantum_force;

-- Table: active_sprint
CREATE TABLE IF NOT EXISTS team_8.quantum_force.active_sprint (
  assigned_issue_ids ARRAY<STRING COLLATE UTF8_BINARY>,
  assigned_issue_keys ARRAY<STRING COLLATE UTF8_BINARY>,
  assignment_count BIGINT,
  note STRING COLLATE UTF8_BINARY,
  project_id STRING COLLATE UTF8_BINARY,
  sprint STRUCT<data_type: STRING COLLATE UTF8_BINARY, duration_days: BIGINT, end_date: STRING COLLATE UTF8_BINARY, end_date_key: BIGINT, project_id: STRING COLLATE UTF8_BINARY, sprint_id: STRING COLLATE UTF8_BINARY, sprint_name: STRING COLLATE UTF8_BINARY, sprint_number: BIGINT, sprint_type: STRING COLLATE UTF8_BINARY, start_date: STRING COLLATE UTF8_BINARY, start_date_key: BIGINT, status: STRING COLLATE UTF8_BINARY>,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: active_sprint_issues
CREATE TABLE IF NOT EXISTS team_8.quantum_force.active_sprint_issues (
  assignee STRING COLLATE UTF8_BINARY,
  assignee_person_id STRING COLLATE UTF8_BINARY,
  assignee_role_id STRING COLLATE UTF8_BINARY,
  assignee_source STRING COLLATE UTF8_BINARY,
  created STRING COLLATE UTF8_BINARY,
  created_date_key BIGINT,
  created_time_key BIGINT,
  cycle_time_days STRING COLLATE UTF8_BINARY,
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
  resolution_date_key STRING COLLATE UTF8_BINARY,
  resolution_notes STRING COLLATE UTF8_BINARY,
  resolution_time_key STRING COLLATE UTF8_BINARY,
  source_issue_key STRING COLLATE UTF8_BINARY,
  sprint_id STRING COLLATE UTF8_BINARY,
  status STRING COLLATE UTF8_BINARY,
  story_points BIGINT,
  summary STRING COLLATE UTF8_BINARY,
  team STRING COLLATE UTF8_BINARY,
  team_id STRING COLLATE UTF8_BINARY,
  updated STRING COLLATE UTF8_BINARY,
  updated_date_key BIGINT,
  updated_time_key BIGINT,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
COMMENT 'The table contains details about issues in the current sprint. It includes information such as assignees, issue status, priority, and resolution details. This data can be used for tracking sprint progress, understanding team workload, and analyzing issue resolution times.'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: active_sprint_record
CREATE TABLE IF NOT EXISTS team_8.quantum_force.active_sprint_record (
  data_type STRING COLLATE UTF8_BINARY,
  duration_days BIGINT,
  end_date STRING COLLATE UTF8_BINARY,
  end_date_key BIGINT,
  project_id STRING COLLATE UTF8_BINARY,
  sprint_id STRING COLLATE UTF8_BINARY,
  sprint_name STRING COLLATE UTF8_BINARY,
  sprint_number BIGINT,
  sprint_type STRING COLLATE UTF8_BINARY,
  start_date STRING COLLATE UTF8_BINARY,
  start_date_key BIGINT,
  status STRING COLLATE UTF8_BINARY,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: close_batch_20261118
CREATE TABLE IF NOT EXISTS team_8.quantum_force.close_batch_20261118 (
  issue_id STRING COLLATE UTF8_BINARY,
  issue_key STRING COLLATE UTF8_BINARY,
  project_id STRING COLLATE UTF8_BINARY,
  team_id STRING COLLATE UTF8_BINARY,
  created_ts TIMESTAMP,
  new_status STRING COLLATE UTF8_BINARY,
  new_resolution STRING COLLATE UTF8_BINARY,
  new_resolution_ts TIMESTAMP,
  batch_ts TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpoint.writeStatsAsJson' = 'false',
  'delta.checkpoint.writeStatsAsStruct' = 'true',
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: data_quality_audit
CREATE TABLE IF NOT EXISTS team_8.quantum_force.data_quality_audit (
  active_sprint STRUCT<end_date: STRING COLLATE UTF8_BINARY, new_demo_issues: BIGINT, project_id: STRING COLLATE UTF8_BINARY, sprint_id: STRING COLLATE UTF8_BINARY, start_date: STRING COLLATE UTF8_BINARY, status: STRING COLLATE UTF8_BINARY>,
  audit_date STRING COLLATE UTF8_BINARY,
  consistency_checks STRUCT<assignee_person_team_mismatches: BIGINT, feature_epic_project_mismatches: BIGINT, issue_feature_epic_mismatches: BIGINT, issue_feature_project_mismatches: BIGINT, resolved_flag_vs_status_mismatches: BIGINT>,
  dataset_type STRING COLLATE UTF8_BINARY,
  date_design STRUCT<actual_end_date: STRING COLLATE UTF8_BINARY, forecast: STRING COLLATE UTF8_BINARY, latest_child_resolution_date: STRING COLLATE UTF8_BINARY, parent_status: STRING COLLATE UTF8_BINARY, planned_end_date: STRING COLLATE UTF8_BINARY>,
  duplicate_checks STRUCT<`epics.json`: STRUCT<epic_id: BIGINT>, `features.json`: STRUCT<feature_id: BIGINT>, `issue_history.json`: STRUCT<history_id: BIGINT>, `issues_enriched.json`: STRUCT<issue_id: BIGINT, issue_key: BIGINT>, `projects.json`: STRUCT<project_id: BIGINT>, `sprints.json`: STRUCT<sprint_id: BIGINT>>,
  key_join_checks STRUCT<`bridge.project_id`: STRUCT<nulls: BIGINT, rows: BIGINT, unmatched: BIGINT>, `bridge.sprint_id`: STRUCT<nulls: BIGINT, rows: BIGINT, unmatched: BIGINT>, `epics.project_id`: STRUCT<nulls: BIGINT, rows: BIGINT, unmatched: BIGINT>, `features.epic_id`: STRUCT<nulls: BIGINT, rows: BIGINT, unmatched: BIGINT>, `features.project_id`: STRUCT<nulls: BIGINT, rows: BIGINT, unmatched: BIGINT>, `history.issue_id`: STRUCT<nulls: BIGINT, rows: BIGINT, unmatched: BIGINT>, `history.project_id`: STRUCT<nulls: BIGINT, rows: BIGINT, unmatched: BIGINT>, `history.team_id`: STRUCT<nulls: BIGINT, rows: BIGINT, unmatched: BIGINT>, `issues.assignee_person_id`: STRUCT<nulls: BIGINT, rows: BIGINT, unmatched: BIGINT>, `issues.developer_id`: STRUCT<nulls: BIGINT, rows: BIGINT, unmatched: BIGINT>, `issues.epic_id`: STRUCT<nulls: BIGINT, rows: BIGINT, unmatched: BIGINT>, `issues.feature_id`: STRUCT<nulls: BIGINT, rows: BIGINT, unmatched: BIGINT>, `issues.project_id`: STRUCT<nulls: BIGINT, rows: BIGINT, unmatched: BIGINT>, `issues.sprint_id`: STRUCT<nulls: BIGINT, rows: BIGINT, unmatched: BIGINT>, `issues.team_id`: STRUCT<nulls: BIGINT, rows: BIGINT, unmatched: BIGINT>, `sprints.project_id`: STRUCT<nulls: BIGINT, rows: BIGINT, unmatched: BIGINT>>,
  known_nulls STRUCT<`issues.cycle_time_days`: BIGINT, `issues.developer_id`: BIGINT, `issues.reporter_literal_null`: BIGINT, `issues.resolution_date`: BIGINT, `issues.resolution_notes`: BIGINT>,
  limitations ARRAY<STRING COLLATE UTF8_BINARY>,
  parent_date_validation STRUCT<epic_planning_duration_days: BIGINT, epics_source_status_done_but_child_completion_below_100: BIGINT, epics_with_actual_parent_end_date: BIGINT, epics_with_latest_child_resolution_date: BIGINT, feature_planning_duration_days: BIGINT, features_source_status_done_but_child_completion_below_100: BIGINT, features_with_actual_parent_end_date: BIGINT, features_with_latest_child_resolution_date: BIGINT, project_planning_duration_days: BIGINT, projects_with_actual_project_end_date: BIGINT>,
  row_counts STRUCT<`developers.json`: BIGINT, `dim_calendar.json`: BIGINT, `dim_time.json`: BIGINT, `epics.json`: BIGINT, `features.json`: BIGINT, `issue_history.json`: BIGINT, `issues_enriched.json`: BIGINT, `people.json`: BIGINT, `project_sprint_bridge.json`: BIGINT, `projects.json`: BIGINT, `roles.json`: BIGINT, `sprints.json`: BIGINT, `team_members.json`: BIGINT, `team_roles.json`: BIGINT, `teams.json`: BIGINT, `user_team_access.json`: BIGINT>,
  source_zip STRING COLLATE UTF8_BINARY,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: developers
CREATE TABLE IF NOT EXISTS team_8.quantum_force.developers (
  capacity_points_per_sprint BIGINT,
  data_type STRING COLLATE UTF8_BINARY,
  developer_id STRING COLLATE UTF8_BINARY,
  developer_name STRING COLLATE UTF8_BINARY,
  person_id STRING COLLATE UTF8_BINARY,
  role_id STRING COLLATE UTF8_BINARY,
  team STRING COLLATE UTF8_BINARY,
  team_id STRING COLLATE UTF8_BINARY,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
COMMENT 'The table contains information about developers involved in various projects. It captures details such as developer identity, role, team assignment, and capacity for work per sprint. This data can be used to analyze team composition, assess productivity, and manage workload effectively across different development cycles.'
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: dim_calendar
CREATE TABLE IF NOT EXISTS team_8.quantum_force.dim_calendar (
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
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: dim_time
CREATE TABLE IF NOT EXISTS team_8.quantum_force.dim_time (
  data_type STRING COLLATE UTF8_BINARY,
  hour BIGINT,
  minute BIGINT,
  second BIGINT,
  time STRING COLLATE UTF8_BINARY,
  time_key BIGINT,
  time_period STRING COLLATE UTF8_BINARY,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: epics
CREATE TABLE IF NOT EXISTS team_8.quantum_force.epics (
  created_date STRING COLLATE UTF8_BINARY,
  data_type STRING COLLATE UTF8_BINARY,
  description STRING COLLATE UTF8_BINARY,
  end_date STRING COLLATE UTF8_BINARY,
  epic_id STRING COLLATE UTF8_BINARY,
  epic_name STRING COLLATE UTF8_BINARY,
  project_id STRING COLLATE UTF8_BINARY,
  project_key STRING COLLATE UTF8_BINARY,
  source_project_key STRING COLLATE UTF8_BINARY,
  status STRING COLLATE UTF8_BINARY,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: features
CREATE TABLE IF NOT EXISTS team_8.quantum_force.features (
  data_type STRING COLLATE UTF8_BINARY,
  description STRING COLLATE UTF8_BINARY,
  end_date STRING COLLATE UTF8_BINARY,
  epic_id STRING COLLATE UTF8_BINARY,
  feature_id STRING COLLATE UTF8_BINARY,
  feature_name STRING COLLATE UTF8_BINARY,
  project_id STRING COLLATE UTF8_BINARY,
  status STRING COLLATE UTF8_BINARY,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: issue_history
CREATE TABLE IF NOT EXISTS team_8.quantum_force.issue_history (
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
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: issues_enriched
CREATE TABLE IF NOT EXISTS team_8.quantum_force.issues_enriched (
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
  story_points BIGINT,
  summary STRING COLLATE UTF8_BINARY,
  team STRING COLLATE UTF8_BINARY,
  team_id STRING COLLATE UTF8_BINARY,
  updated STRING COLLATE UTF8_BINARY,
  updated_date_key BIGINT,
  updated_time_key BIGINT,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: manifest
CREATE TABLE IF NOT EXISTS team_8.quantum_force.manifest (
  files STRUCT<`README.md`: BIGINT, `developers.json`: BIGINT, `dim_calendar.json`: BIGINT, `dim_time.json`: BIGINT, `epics.json`: BIGINT, `features.json`: BIGINT, `issue_history.json`: BIGINT, `issues_enriched.json`: BIGINT, `people.json`: BIGINT, `project_sprint_bridge.json`: BIGINT, `projects.json`: BIGINT, `roles.json`: BIGINT, `sprints.json`: BIGINT, `team_members.json`: BIGINT, `team_roles.json`: BIGINT, `teams.json`: BIGINT, `user_team_access.json`: BIGINT>,
  generated_on STRING COLLATE UTF8_BINARY,
  package STRING COLLATE UTF8_BINARY,
  validation STRUCT<all_developer_ids_valid_or_null: BOOLEAN, all_epics_end_dates_derived_from_resolved_child_issues: BOOLEAN, all_epics_project_ids_valid: BOOLEAN, all_features_end_dates_derived_from_resolved_child_issues: BOOLEAN, all_features_project_ids_valid: BOOLEAN, all_issue_assignee_people_valid: BOOLEAN, all_issue_epic_feature_sprint_fks_valid: BOOLEAN, all_issue_story_points_between_0_and_3: BOOLEAN, all_issue_team_ids_valid: BOOLEAN, all_issues_project_ids_valid: BOOLEAN, all_projects_end_dates_derived_from_resolved_child_issues: BOOLEAN, all_resolved_issues_have_resolution: BOOLEAN, all_sprints_project_ids_valid: BOOLEAN, all_unresolved_cycle_times_null: BOOLEAN, calendar_contains_all_issue_dates: BOOLEAN, project_end_date_mapping: STRING COLLATE UTF8_BINARY>,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: people
CREATE TABLE IF NOT EXISTS team_8.quantum_force.people (
  data_type STRING COLLATE UTF8_BINARY,
  developer_id STRING COLLATE UTF8_BINARY,
  person_id STRING COLLATE UTF8_BINARY,
  person_name STRING COLLATE UTF8_BINARY,
  person_type STRING COLLATE UTF8_BINARY,
  role_id STRING COLLATE UTF8_BINARY,
  role_name STRING COLLATE UTF8_BINARY,
  team STRING COLLATE UTF8_BINARY,
  team_id STRING COLLATE UTF8_BINARY,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: project_sprint_bridge
CREATE TABLE IF NOT EXISTS team_8.quantum_force.project_sprint_bridge (
  data_type STRING COLLATE UTF8_BINARY,
  is_primary_project BOOLEAN,
  issue_count BIGINT,
  project_id STRING COLLATE UTF8_BINARY,
  sprint_id STRING COLLATE UTF8_BINARY,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: projects
CREATE TABLE IF NOT EXISTS team_8.quantum_force.projects (
  data_type STRING COLLATE UTF8_BINARY,
  description STRING COLLATE UTF8_BINARY,
  end_date STRING COLLATE UTF8_BINARY,
  project_id STRING COLLATE UTF8_BINARY,
  project_key STRING COLLATE UTF8_BINARY,
  project_name STRING COLLATE UTF8_BINARY,
  project_type STRING COLLATE UTF8_BINARY,
  source_project_key STRING COLLATE UTF8_BINARY,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: roles
CREATE TABLE IF NOT EXISTS team_8.quantum_force.roles (
  data_type STRING COLLATE UTF8_BINARY,
  description STRING COLLATE UTF8_BINARY,
  role_id STRING COLLATE UTF8_BINARY,
  role_name STRING COLLATE UTF8_BINARY,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: sprints
CREATE TABLE IF NOT EXISTS team_8.quantum_force.sprints (
  data_type STRING COLLATE UTF8_BINARY,
  duration_days BIGINT,
  end_date STRING COLLATE UTF8_BINARY,
  end_date_key BIGINT,
  project_id STRING COLLATE UTF8_BINARY,
  sprint_id STRING COLLATE UTF8_BINARY,
  sprint_name STRING COLLATE UTF8_BINARY,
  sprint_number BIGINT,
  sprint_type STRING COLLATE UTF8_BINARY,
  start_date STRING COLLATE UTF8_BINARY,
  start_date_key BIGINT,
  status STRING COLLATE UTF8_BINARY,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: team_members
CREATE TABLE IF NOT EXISTS team_8.quantum_force.team_members (
  data_type STRING COLLATE UTF8_BINARY,
  person_id STRING COLLATE UTF8_BINARY,
  person_name STRING COLLATE UTF8_BINARY,
  role_id STRING COLLATE UTF8_BINARY,
  role_name STRING COLLATE UTF8_BINARY,
  team STRING COLLATE UTF8_BINARY,
  team_id STRING COLLATE UTF8_BINARY,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: team_roles
CREATE TABLE IF NOT EXISTS team_8.quantum_force.team_roles (
  data_type STRING COLLATE UTF8_BINARY,
  is_primary_role BOOLEAN,
  role_id STRING COLLATE UTF8_BINARY,
  team_id STRING COLLATE UTF8_BINARY,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: teams
CREATE TABLE IF NOT EXISTS team_8.quantum_force.teams (
  data_type STRING COLLATE UTF8_BINARY,
  description STRING COLLATE UTF8_BINARY,
  team_id STRING COLLATE UTF8_BINARY,
  team_name STRING COLLATE UTF8_BINARY,
  team_type STRING COLLATE UTF8_BINARY,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');

-- Table: user_team_access
CREATE TABLE IF NOT EXISTS team_8.quantum_force.user_team_access (
  access_id STRING COLLATE UTF8_BINARY,
  access_scope STRING COLLATE UTF8_BINARY,
  data_type STRING COLLATE UTF8_BINARY,
  is_active BOOLEAN,
  principal_name STRING COLLATE UTF8_BINARY,
  role_id STRING COLLATE UTF8_BINARY,
  team_id STRING COLLATE UTF8_BINARY,
  _source_file STRING COLLATE UTF8_BINARY,
  _bronze_load_timestamp TIMESTAMP)
USING delta
CLUSTER BY AUTO
TBLPROPERTIES (
  'delta.checkpointPolicy' = 'v2',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true');
