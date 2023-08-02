#!/bin/bash

cd ${INPUT_DBT_PROJECT_FOLDER}

DBT_ACTION_LOG_FILE=${DBT_ACTION_LOG_FILE:="dbt_console_output.txt"}
$1 2>&1 | tee "${DBT_ACTION_LOG_FILE}"
