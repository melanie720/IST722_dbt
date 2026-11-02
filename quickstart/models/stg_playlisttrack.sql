select
    playlistid,
    trackid
from {{ source('chinook', 'playlisttrack') }}