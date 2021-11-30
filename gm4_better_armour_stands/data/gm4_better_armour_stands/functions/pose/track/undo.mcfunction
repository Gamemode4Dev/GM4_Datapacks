# @s = player modifying armor_stand
# at @s
# run from pose/track/select_armour_stand

# store initial pose, position, and rotation data from marker to storage
execute as @e[type=marker,tag=gm4_bas_player_offset] if score @s gm4_bas_id = @p[tag=gm4_bas_track] gm4_bas_id run data modify storage gm4_better_armour_stands:temp undo set from entity @s data

# copy data from storage to armor_stand
execute as @e[type=armor_stand,tag=gm4_bas_track] if score @s gm4_bas_id = @p[tag=gm4_bas_track] gm4_bas_id run data modify entity @s {} merge from storage gm4_better_armour_stands:temp undo
data remove storage gm4_better_armour_stands:temp undo

# stop tracking
function gm4_better_armour_stands:pose/set
