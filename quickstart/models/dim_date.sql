with date_sequence as (

    select
        dateadd(day, row_number() over (order by seq4()) - 1, date '2026-01-01') as full_date
    from table(generator(rowcount => 731)) -- 2 years; Extra day in case there is a leap year.

)

select
    to_number(to_char(full_date, 'YYYYMMDD')) as datekey,
    full_date,
    year(full_date) as year,
    quarter(full_date) as quarter,
    month(full_date) as month,
    to_char(full_date, 'MMMM') as monthname,
    day(full_date) as dayofmonth,
    dayofweekiso(full_date) as dayofweek,
    decode(dayofweekiso(full_date),
        1, 'Monday', 2, 'Tuesday', 3, 'Wednesday', 4, 'Thursday',
        5, 'Friday', 6, 'Saturday', 7, 'Sunday') as dayname
from date_sequence

