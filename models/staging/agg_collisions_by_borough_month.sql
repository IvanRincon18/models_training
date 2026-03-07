select
    borough,
    extract(year from crash_date) as year_number,
    extract(month from crash_date) as month_number,
    count(*) as total_collisions,
    sum(number_of_persons_injured) as total_persons_injured,
    sum(number_of_persons_killed) as total_persons_killed
from {{ ref('fact_collisions') }}
where borough is not null
group by 1, 2, 3