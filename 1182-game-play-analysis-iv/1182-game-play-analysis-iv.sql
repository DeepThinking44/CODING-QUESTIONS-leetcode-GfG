select 
ROUND(

    cast(Count(a1.player_id) as Float)/ Count(distinct a2.player_id),2
) as fraction
from (
      
      select player_id,
      MIN(event_date) as mindate
      from Activity 
      group BY player_id

) as a2
LEFT JOIN Activity as a1
on a2.player_id=a1.player_id
AND a1.event_date =DATEADD(DAY, 1,a2.mindate)