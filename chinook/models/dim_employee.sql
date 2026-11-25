select
    {{ dbt_utils.generate_surrogate_key(['EmployeeId'])}} as employeekey,
    EmployeeId as employeeid,
    LastName as lastname,
    FirstName as firstname,
    Title as title,
    ReportsTo as reportsto,
    BirthDate as birthdate,
    HireDate as hiredate,
    Address as address,
    City as city,
    State as state,
    Country as country,
    PostalCode as postalcode,
    Phone as phone,
    Fax as fax,
    Email as email
from {{ source('chinook', 'employee') }}