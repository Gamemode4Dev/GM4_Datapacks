# set linked players health
# @s = linked player
# at unspecified
# run from armor/modifier/type/link/process/run_link

scoreboard players operation $health_change gm4_ce_data = $link_health gm4_ce_data
scoreboard players operation $health_change gm4_ce_data -= @s gm4_ce_health.current
scoreboard players operation @s gm4_ce_healstore += $health_change gm4_ce_data

execute if score @s gm4_ce_healstore matches 1.. run function gm4_combat_expanded:player/heal/heal_calc
execute if score @s gm4_ce_healstore matches ..-1 run function gm4_combat_expanded:armor/modifier/type/link/damage/activate

# cleanup
scoreboard players reset @s gm4_ce_healstore
