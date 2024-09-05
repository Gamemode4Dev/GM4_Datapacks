# store portion of damage taken in score
# @s = player being checked
# at @s
# run from armor/modifier/type/second_wind/check

execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.level2 2

scoreboard players operation $store_health gm4_ce_data = @s gm4_ce_hurt
scoreboard players operation $store_health gm4_ce_data *= $level gm4_ce_data
scoreboard players operation @s gm4_ce_second_wind += $store_health gm4_ce_data

playsound minecraft:item.bottle.empty player @s ~ ~ ~ 0.6 2
