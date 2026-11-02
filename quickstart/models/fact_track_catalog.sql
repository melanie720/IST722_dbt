select
    trackid,
    trackkey,
    datekey AS snapshotdatekey,
    unitprice,
    lengthms,
    sizebytes,
    1 as trackcount
from {{ ref('dim_track') }}
join {{ ref('dim_date') }} on datekey = to_number(to_char(GETDATE(), 'YYYYMMDD'))