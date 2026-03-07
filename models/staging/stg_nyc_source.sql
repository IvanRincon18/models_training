select * 
from {{ source('nyc_raw', 'nyc_source')}}