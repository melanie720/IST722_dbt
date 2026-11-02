select
    customerid,
    trackid,
    sentiment
from {{ source('chinook', 'trackreviews') }}