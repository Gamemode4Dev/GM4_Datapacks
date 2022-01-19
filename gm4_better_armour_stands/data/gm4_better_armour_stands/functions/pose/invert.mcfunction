# @s = player hitting armor_stand
# at @s
# run from advancement pose/invert

advancement revoke @a only gm4_better_armour_stands:pose/invert

# get current player id
scoreboard players operation $current gm4_bas_id = @s gm4_bas_id

# toggle invert mode
execute as @e[type=armor_stand,tag=gm4_bas_track,distance=..6] if score @s gm4_bas_id = $current gm4_bas_id store success score $invert gm4_bas_data run tag @s remove gm4_bas_invert
execute if score $invert gm4_bas_data matches 0 as @e[type=armor_stand,tag=gm4_bas_track,distance=..6] if score @s gm4_bas_id = $current gm4_bas_id run tag @s add gm4_bas_invert
