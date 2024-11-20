# @s = armor_stand to be modified
# at @p[tag=gm4_bas_track] positioned ~ ~1.6 ~
# run from pose/track/update

# rotate armor_stand towards marker
execute at @s run tp @s ~ ~ ~ facing entity @e[type=marker,tag=gm4_bas_player_offset,sort=nearest,limit=1]

# round up rotation to multiples of 15 degrees
execute if entity @p[tag=gm4_bas_track,predicate=gm4_better_armour_stands:sneaking] run function gm4_better_armour_stands:pose/snap/rotation
