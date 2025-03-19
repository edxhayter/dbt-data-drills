# 🛫 dbt Data Drills 1 – Refactor Airline Loyalty Query

## ✈️ The Challenge

Refactor Airline currently computes yearly loyalty statuses using a SQL query written by David, who has since left the business. The company has identified a serious risk: if this query breaks, their entire loyalty system could fall apart.  

They are exploring **dbt** as part of their data stack and have brought you in to refactor the existing query using **dbt best practices**. Your goal is to make the code **more interpretable** and **robust** so that any future issues can be quickly resolved, ensuring loyalty statuses continue to be assigned seamlessly at the start of each new year.

**Note the original query was built for compatibility with Snowflake so may need adjustment to work with an alternative connection**

---

## 🏗️ Getting Started

To set up the legacy script into a working state before refactoring:

1. **Load the Data**
   If you are using a managed repository rather than a forked version of this repository then you will need to copy the relevant .csv files into your seeds sub-sidrectory before running the command below.
   The dataset is preconfigured using **seeds**, so running the following command will load the `.csv` files into your warehouse:  
   ```
   dbt seed
   ```
This will create tables in your warehouse, allowing you to work with the legacy query.

2. **Update the Legacy Query**
    The legacy query references a placeholder schema:
    ```
    target_database.target_schema
    ```
    Replace this with the actual target_database.target_schema configured in your dbt project.

---

## Alternative Setup

Note: While seeds provide a quick way to get started, they are typically used for static reference data. If you prefer a source-based approach:

    1. Seed the data into your warehouse
    2. Copy the seeded tables into another schema within your warehouse
       ```
       CREATE TABLE <destination_schema>.<destination_table> AS
       SELECT * FROM <source_schema>.<source_table>;
       ```
    3. Configure dbt sources to point to this new location

This mirrors how data ingestion typically works in a dbt project where we configure sources to point at raw data to be processed.

---

## 🔍 Validating Your Refactored Query

If you want to compare your refactored query’s results with the original:

    1. Install the audit_helper package:

    `dbt deps`

    2. Use the `compare_and_classify_query_results` or `compare_and_classify_relation_rows` macro to validate that your refactored query matches the legacy results.

---

## 📢 Share Your Work!

    1. How did you structure your transformation layers?
    2. Did you abstract logic into a macro? Why?
    3. What dbt best practices did you apply?

Document your approach and share your solution with the community! 🚀
