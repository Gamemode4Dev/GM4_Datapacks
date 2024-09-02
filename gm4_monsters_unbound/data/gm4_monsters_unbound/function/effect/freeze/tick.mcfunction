# tick freeze effect for this entity
# @s = entity with freeze effect
# at @s
# run from clocks/effect/freeze

scoreboard players remove @s gm4_mu_frozen_time 1
execute if score @s[type=player] gm4_mu_frozen_time matches ..0 run return run function gm4_monsters_unbound:effect/freeze/thaw_player
execute if score @s[type=!player] gm4_mu_frozen_time matches ..0 run return run function gm4_monsters_unbound:effect/freeze/thaw_entity

particle dust{color:[0.725,0.910,0.918],scale:2} ~ ~0.9 ~ 0.3 0.65 0.3 0 1 normal
particle snowflake ~ ~0.9 ~ 0.3 0.65 0.3 0 6 normal

scoreboard players set $keep_tick.frozen_entity gm4_mu_keep_tick 1
