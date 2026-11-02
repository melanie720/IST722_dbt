select
    t.trackkey,
    p.playlistkey
from {{ ref('stg_playlisttrack') }} pt
join {{ ref('dim_playlist') }} p on pt.PlaylistId = p.playlistid
join {{ ref('dim_track') }} t on pt.TrackId = t.trackid