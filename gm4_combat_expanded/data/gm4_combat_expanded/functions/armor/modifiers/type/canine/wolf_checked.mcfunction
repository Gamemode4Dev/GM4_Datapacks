# mark wolf as having been checked, wolf will not despawn until next check
# @s = wolf that belonged to the armor piece
# run from armor/active/canine/check

scoreboard players set $wolf gm4_ce_data 1
scoreboard players set @s gm4_ce_t_wolf 1
