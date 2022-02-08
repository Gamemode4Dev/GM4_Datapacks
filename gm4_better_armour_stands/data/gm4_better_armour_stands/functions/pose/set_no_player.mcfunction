# @s = armor_stand with no nearby tracked player
# at @s
# run from pose/check_no_player

# get current armor_stand id
scoreboard players operation $current gm4_bas_id = @s gm4_bas_id

# remove linked entities
execute as @e[type=marker,tag=gm4_bas_marker] if score @s gm4_bas_id = $current gm4_bas_id at @s run kill @s
execute as @e[type=wandering_trader,tag=gm4_bas_detect] if score @s gm4_bas_id = $current gm4_bas_id at @s run tp @s ~ -10000 ~

# reset tracking data
function gm4_better_armour_stands:pose/track/clear
