select
  {{ dbt_utils.generate_surrogate_key(['PlaylistId']) }} as playlistkey,
  PlaylistId as playlistid,
  Name as playlistname
from {{ source('chinook', 'playlist') }}
