select
    {{ dbt_utils.generate_surrogate_key(['c.CustomerId', 't.TrackId']) }} as reviewkey,
    c.customerkey as customerkey,
    t.trackkey as trackkey,
    case
        when Sentiment = 'like'
        then 1
        else 0 
    end as likecount,
    case
        when Sentiment = 'dislike'
        then 1
        else 0 
    end as dislikecount,
    1 as reviewcount
from {{ ref('stg_trackreviews') }} tr
join {{ ref('dim_track') }} t on tr.TrackId = t.trackid
join {{ ref('dim_customer') }} c on tr.CustomerId = c.customerid