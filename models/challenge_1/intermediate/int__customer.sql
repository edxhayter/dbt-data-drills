-- this model exists for dag purposes. Although in future logic could be added at this stage if required
-- E.g. perhaps to process instances where a customer is forced to make a new frequent flyer account but their
-- history can be transferred across.

SELECT
    *
FROM {{ ref('staging_transform_air__customers') }}