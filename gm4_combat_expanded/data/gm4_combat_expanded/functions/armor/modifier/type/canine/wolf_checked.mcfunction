# mark wolf as having been checked, wolf will not despawn until next check
# @s = wolf that belonged to the armor piece
# at world spawn
# run from armor/type/canine/check

execute if score $wolf gm4_ce_data matches 0 run scoreboard players set @s gm4_ce_t_wolf 1
scoreboard players set $wolf gm4_ce_data 1
