# Welcome to reFactor Friday!

This repository will house the starters for each challenge as they are released. I will be submitting my efforts at solving the challenges under a seperate branch called solution.

## Setting up a challenge

Each time I add a new challenge if new data is required I will be adding a file to the seeds directory so that it can be easily loaded into your database of choice with a `dbt seed` command. As the point of these challenges is to get familiar with updating legacy code into dbt modularized code, I have opted to use dbt seed despite it typically being more suited to static reference files because I want to encourage the simplicity in starting up to get people going with dbt.

Typically when working with seeds a `{{ ref() }}` function is how you would refer back to a seed but in some instances we will nonetheless setup sources by loading in the data with seeds and then copying it to a new schema to allow us to set up sources and source.ymls.

## Where do I find challenge details?

Each challenge will have a `README.md` in its model subdirectory which will give some context to the challenge, these challenges are meant to be open-ended and you can approach and structure them how you feel is most apporpriate - feel free to add comments into the SQL to justify decisions so others can learn from your submissions.


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
