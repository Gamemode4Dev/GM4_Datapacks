

scoreboard players remove @s gm4_ce_frozen_time 1
execute if score @s[type=player] gm4_ce_frozen_time matches ..0 run return run function gm4_combat_expanded:effect/freeze/thaw_player
execute if score @s[type=!player] gm4_ce_frozen_time matches ..0 run return run function gm4_combat_expanded:effect/freeze/thaw_entity

particle dust{color:[0.725,0.910,0.918],scale:2} ~ ~0.9 ~ 0.3 0.65 0.3 0 1 normal
particle snowflake ~ ~0.9 ~ 0.3 0.65 0.3 0 6 normal

scoreboard players set $keep_tick.frozen_entity gm4_ce_keep_tick 1