# calculate the damage guardian will take
# @s = player that was guarding
# at unspecified
# run from main

function gm4_combat_expanded:player/calculate_hp

# store damage in storage
execute store result storage gm4_combat_expanded:temp damage_player.damage int 1 run scoreboard players operation @s gm4_ce_guard /= #10 gm4_ce_data

# sound
execute at @s run playsound minecraft:item.shield.block player @s ~ ~ ~ 0.4 0

# damage player if they are alive
execute if score @s gm4_ce_guard < @s gm4_ce_health run function gm4_combat_expanded:player/damage with storage gm4_combat_expanded:temp damage_player

# kill player if health reached 0 (and player is alive)
execute if score @s gm4_ce_health matches 1.. if score @s gm4_ce_guard >= @s gm4_ce_health run function gm4_combat_expanded:armor/modifier/type/guardian/guard_death

# cleanup
data remove storage gm4_combat_expanded:temp damage_player.damage
