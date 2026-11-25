select
    c.supportrepid as employeeid,
    e.employeekey as employeekey,
    DATEFROMPARTS(YEAR(i.invoicedate), MONTH(i.invoicedate), 1) as monthdatekey,
    count(distinct c.customerid) as activecustomercount,
    count(i.invoiceid) as invoicecount,
    sum(i.total) as revenue
from {{ ref('dim_customer') }} c
join {{ ref('dim_employee') }} e on c.supportrepid = e.employeeid
join {{ ref('dim_invoice') }} i on i.customerid = c.customerid
join {{ ref('dim_date') }} d on d.full_date = i.invoicedate
group by
    c.supportrepid,
    e.employeekey,
    DATEFROMPARTS(YEAR(i.invoicedate), MONTH(i.invoicedate), 1)