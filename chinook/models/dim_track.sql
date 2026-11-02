select
    {{ dbt_utils.generate_surrogate_key(['t.TrackId']) }} as trackkey,
    t.TrackId as trackid,
    t.name as trackname,
    al.Title as album,
    a.Name as artist,
    m.Name as mediatype,
    g.Name as genre,
    t.Composer as composer,
    t.UnitPrice as unitprice,  
    t.Milliseconds as lengthms,
    t.Bytes as sizebytes
from {{ source('chinook', 'track') }} t
left join {{ source('chinook', 'mediatype') }} m on t.MediaTypeId = m.MediaTypeId
left join {{ source('chinook', 'genre') }} g on t.GenreId = g.GenreId
left join {{ source('chinook', 'album') }} al  on al.AlbumId = t.AlbumId
left join {{ source('chinook', 'artist') }} a on a.ArtistId = al.ArtistId


