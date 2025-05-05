# @s = player who reeled in the armor stand
# run from advancement "reel_rod"

advancement revoke @s only gm4_end_fishing:reel_rod
execute if entity @s[gamemode=!creative] if items entity @s weapon.mainhand minecraft:fishing_rod run function gm4_end_fishing:durability/prep_mainhand
execute if entity @s[gamemode=!creative] unless items entity @s weapon.mainhand minecraft:fishing_rod if items entity @s weapon.offhand minecraft:fishing_rod run function gm4_end_fishing:durability/prep_offhand
