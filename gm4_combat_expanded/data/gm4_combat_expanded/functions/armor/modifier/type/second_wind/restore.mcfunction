# restore stored health to player
# @s = player being checked
# at unspecified
# run from armor/modifier/type/second_wind/check

scoreboard players operation @s gm4_ce_second_wind /= #100 gm4_ce_data
scoreboard players operation @s gm4_ce_healstore += @s gm4_ce_second_wind

tag @s remove gm4_ce_second_wind.active
scoreboard players reset @s gm4_ce_second_wind
