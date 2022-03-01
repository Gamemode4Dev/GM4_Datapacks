# @s = armor_stand to be modified
# at @s
# run from pose/set

scoreboard players reset @s gm4_bas_id
scoreboard players reset @s gm4_bas_mode

tag @s remove gm4_bas_track
tag @s remove gm4_bas_mirror
tag @s remove gm4_bas_alt
tag @s remove gm4_bas_invert

data remove entity @s DisabledSlots
data remove entity @s Glowing

playsound minecraft:entity.armor_stand.fall block @a[distance=..6] ~ ~ ~ 0.5 1

# undo changes if ran from pose/undo
execute if score $undo gm4_bas_data matches 1 run data modify entity @s {} merge from storage gm4_better_armour_stands:temp Undo
