# Welcome to reFactor Friday!

This repository hosts the starter templates for each challenge as they are released. I will also be submitting my solutions under a separate branch called `solution`.

## Setting up a challenge

For each new challenge, if new data is required, I will add a file to the `seeds` directory. This file can be easily loaded into your database of choice using the `dbt seed` command. 

While `dbt seed` is traditionally used for static reference files, I am opting to use it here to simplify the process of getting started. The main goal of these challenges is to help you get comfortable with updating legacy code and transforming it into modularized dbt code. As such, we are focusing on making the setup process as easy as possible.

Typically, when working with seeds, the `{{ ref() }}` function is used to refer to a seed. However, in some instances, we will load the data using seeds, then copy it into a new schema. This enables us to set up sources and their corresponding `source.yml` configurations.

If you want to use sources you could seed the tables and then copy them across to a new database/schema and then configure dbt source connection.

```
CREATE TABLE <destination_schema>.<destination_table> AS
SELECT * FROM <source_schema>.<source_table>;
```

## Challenge Details

Each challenge will have a `README.md` located in a subdirectory under the `docs` folder. This file will contain the context and requirements for the challenge. These challenges are designed to be open-ended, so you are encouraged to approach and structure them as you see fit. 

Feel free to add comments in your SQL code to explain your reasoning and decisions—this will help others learn from your approach.

## Challenge List

The first challenge is a refactor challenge and further details can be found [here](docs/challenge_1/readme.md).

## Checking Your Results

The repository includes the `dbt_audit_helper` package in the `packages.yml` file. To install it, run `dbt deps`, and then use the package to check if your output matches the legacy query output.

### Resources:
- [Learn more about dbt in the docs](https://docs.getdbt.com/docs/introduction)
- [Check out Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the dbt blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
