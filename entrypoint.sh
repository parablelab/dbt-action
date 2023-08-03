#!/bin/bash

set -o pipefail

cd ${INPUT_DBT_PROJECT_FOLDER}

# Logging and output design below taken from 
# Michael Whitaker's OS version of a dbt-action.  
DBT_ACTION_LOG_FILE=${DBT_ACTION_LOG_FILE:="dbt_console_output.txt"}
DBT_ACTION_LOG_PATH="${INPUT_DBT_PROJECT_FOLDER}/${DBT_ACTION_LOG_FILE}"
echo "DBT_ACTION_LOG_PATH=${DBT_ACTION_LOG_PATH}" >> $GITHUB_ENV

$1 2>&1 | tee "${DBT_ACTION_LOG_FILE}"

if [ $? -eq 0 ]
  then
    echo "DBT_RUN_STATE=passed" >> $GITHUB_ENV
    echo "result=passed" >> $GITHUB_OUTPUT
    echo "DBT run OK" >> "${DBT_ACTION_LOG_FILE}"
  else
    echo "DBT_RUN_STATE=failed" >> $GITHUB_ENV
    echo "result=failed" >> $GITHUB_OUTPUT
    echo "DBT run failed" >> "${DBT_ACTION_LOG_FILE}"
    exit 1
fi
