select distinct 
    borough
from {{ ref('stg_nyc_collisions')}}
where borough is not null