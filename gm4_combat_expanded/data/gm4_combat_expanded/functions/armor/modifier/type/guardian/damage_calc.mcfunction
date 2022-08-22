# calculate the damage guardian will take
# @s = player that was guarding
# at world spawn
# run from main

function gm4_combat_expanded:player/calculate_hp

# calculate amount of max_health to remove to get to new health
scoreboard players operation $remove_health gm4_ce_data = $max_health gm4_ce_data

scoreboard players operation $remove_health gm4_ce_data -= @s gm4_ce_health
scoreboard players operation @s gm4_ce_guard /= #10 gm4_ce_data
scoreboard players operation $remove_health gm4_ce_data += @s gm4_ce_guard

# sound
execute at @s run playsound minecraft:item.shield.block player @s ~ ~ ~ 0.4 0

# damage player if they are alive
execute if score $remove_health gm4_ce_data < $max_health gm4_ce_data run function gm4_combat_expanded:player/damage/apply

# kill player if health reached 0 (and player is alive)
execute if score @s gm4_ce_health matches 1.. if score $remove_health gm4_ce_data >= $max_health gm4_ce_data run function gm4_combat_expanded:armor/modifier/type/guardian/guard_death
