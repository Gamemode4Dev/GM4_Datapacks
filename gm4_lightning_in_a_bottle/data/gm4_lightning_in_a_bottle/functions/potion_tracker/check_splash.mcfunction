# @s = none
# scheduled from potion_tracker/spawn_tracker

execute at @e[type=marker,tag=gm4_liab_potion_tracker] unless entity @e[type=#gm4_lightning_in_a_bottle:potion_tracker,tag=gm4_liab_potion_tracker,distance=.001..3,limit=1] run function gm4_lightning_in_a_bottle:potion_tracker/potion_landed

execute if entity @e[type=marker,tag=gm4_liab_potion_tracker] run schedule function gm4_lightning_in_a_bottle:potion_tracker/check_splash 1t
