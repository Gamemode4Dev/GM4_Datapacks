# @s = player modifying armor_stand
# at @s
# run from pose/track/select_armour_stand

# store initial pose, position, and rotation data from marker to storage
execute as @e[type=marker,tag=gm4_bas_player_offset] if score @s gm4_bas_id = $current gm4_bas_id at @s as @e[type=armor_stand,tag=gm4_bas_track] if score @s gm4_bas_id = $current gm4_bas_id run data modify entity @s {} merge from entity @e[type=marker,tag=gm4_bas_player_offset,distance=..1,sort=nearest,limit=1] data

# stop tracking
function gm4_better_armour_stands:pose/set
playsound minecraft:entity.armor_stand.hit block @s ~ ~ ~ 0.5 1
