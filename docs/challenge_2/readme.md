# DBT Challenge: Conditional Job Execution

## Overview

Welcome to the DBT challenge! Your task is to create a DBT job that only runs when a source table has fresher data and ensures that all dependent downstream models are also refreshed.

## Challenge Instructions

1. **Create the required tables** in the warehouse of your choice:

   ```sql
   -- Create the initial source table
   CREATE OR REPLACE TABLE source_status__test AS (
       SELECT
           'x' AS value,
           CURRENT_TIMESTAMP() AS load_timestamp
   );

   -- Create a table to join to which won’t be updated to test behaviour
   CREATE OR REPLACE TABLE dim_name AS (
       SELECT
           'x' AS foreign_key,
           'Derrick' AS name
       UNION ALL
       SELECT
           'y' AS foreign_key,
           'Dennis' AS name
   );

2. Configure a source.yml to track the freshness of source_status__test.

3. Set up a DBT job that runs when source_status__test has fresher data and triggers all downstream models.

4. Test your job by inserting a new row into source_status__test:

  ```sql
  INSERT INTO source_status__test(value, load_timestamp)
  VALUES ('y', CURRENT_TIMESTAMP());
```

<details>
  <summary>Hint 1: Freshness Block</summary>
  
  To make your DBT job dependent on source freshness, you need to define a `freshness` block in `source.yml`.

</details>

<details>
  <summary>Hint 2: Multiple Jobs</summary>
  
  You might need more than one job – one for the initial build and another to check the environment state before running transformations.

</details>

<details>
  <summary>Hint 3: Using Defer State</summary>
  When setting up the job configuration, you can use `defer` to reference previous runs and avoid unnecessary recomputation.
  ![image](https://github.com/user-attachments/assets/d3d32804-572f-41b1-95c5-47dbb76683c0)
  Where Challenge 2 is the production environment for the project.

</details>

Check if your models run as expected!
