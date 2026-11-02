select
  {{ dbt_utils.generate_surrogate_key(['CustomerId'])}} as customerkey,
  CustomerId as customerid,
  FirstName as firstname,
  LastName as lastname,
  Company as company,
  Address as address,
  City as city,
  State as state,
  Country as country,
  PostalCode as postalcode,
  Phone as phone,
  Fax as fax,
  Email as email,
  SupportRepId as supportrepid
from {{ source('chinook', 'customer') }}