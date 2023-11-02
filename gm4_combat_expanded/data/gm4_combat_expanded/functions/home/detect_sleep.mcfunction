# run when a player sleeps in a bed
# @s = sleeping player
# at @s
# run from player/process

# check if this is the first sleep of the night, if it is process it
execute store result score $day gm4_ce_data run time query day
execute unless score $day gm4_ce_data = @s gm4_ce_last_sleep run function gm4_combat_expanded:home/process_sleep

scoreboard players reset @s gm4_ce_sleep
