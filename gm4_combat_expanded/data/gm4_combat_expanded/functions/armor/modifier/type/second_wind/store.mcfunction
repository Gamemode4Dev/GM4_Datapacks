# store portion of damage taken in score
# @s = player being checked
# at unspecified
# run from armor/modifier/type/second_wind/check

execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level

scoreboard players operation $store_health gm4_ce_data = @s gm4_ce_hurt
scoreboard players operation $store_health gm4_ce_data *= $level gm4_ce_data
scoreboard players operation @s gm4_ce_second_wind += $store_health gm4_ce_data
