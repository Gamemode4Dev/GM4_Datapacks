# @s = player modifying armor_stand
# at @s
# run from pose/track/select_armour_stand

# move undo data from marker to storage
execute as @e[type=marker,tag=gm4_bas_player_offset] if score @s gm4_bas_id = $current gm4_bas_id run data modify storage gm4_better_armour_stands:temp Undo set from entity @s data

# stop tracking
scoreboard players set $undo gm4_bas_data 1
function gm4_better_armour_stands:pose/set
playsound minecraft:entity.armor_stand.hit block @s ~ ~ ~ 0.5 1

# reset undo data
scoreboard players reset $undo gm4_bas_data
data remove storage gm4_better_armour_stands:temp Undo
