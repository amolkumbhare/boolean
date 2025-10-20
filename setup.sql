-- setup.sql
-- Run-time setup for Snowflake Native App "Snowflake_Cost_Estimator"
-- Idempotent DDL: safe to run multiple times

-- Create schema (inside the app)
CREATE SCHEMA IF NOT EXISTS APP_COST_ESTIMATOR;

-- Create a table to log usage/demo uploads
CREATE TABLE IF NOT EXISTS APP_COST_ESTIMATOR.USAGE_LOG (
  CREATED_AT TIMESTAMP_LTZ DEFAULT CURRENT_TIMESTAMP,
  USER_NAME STRING,
  ACTION STRING,
  REMARKS STRING
);

-- Create application roles for use within the app
CREATE APPLICATION ROLE IF NOT EXISTS app_admin;
CREATE APPLICATION ROLE IF NOT EXISTS app_user;

-- Grant schema usage to app roles (within app sandbox)
GRANT USAGE ON SCHEMA APP_COST_ESTIMATOR TO APPLICATION ROLE app_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA APP_COST_ESTIMATOR TO APPLICATION ROLE app_user;
GRANT ALL PRIVILEGES ON SCHEMA APP_COST_ESTIMATOR TO APPLICATION ROLE app_admin;
