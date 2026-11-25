select
    {{ dbt_utils.generate_surrogate_key(['InvoiceId'])}} as invoicekey,
    InvoiceId as invoiceid,
    CustomerId as customerid,
    InvoiceDate as invoicedate,
    BillingAddress as billingaddress,
    BillingCity as billingcity,
    BillingState as billingstate,
    BillingCountry as billingcountry,
    BillingPostalCode as billingpostalcode,
    Total as total
from {{ source('chinook', 'invoice') }}