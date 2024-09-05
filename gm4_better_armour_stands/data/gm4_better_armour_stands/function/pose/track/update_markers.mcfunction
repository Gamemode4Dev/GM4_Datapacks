# @s = @e[type=marker,tag=gm4_bas_player_offset]
# at @p[tag=gm4_bas_track]
# run from pose/track/update

# keep offset marker in front of player
tp @s ^ ^ ^2

# rotate joint marker to face offset marker and update rotation scores
execute at @e[type=marker,tag=gm4_bas_joint] if score @e[type=marker,tag=gm4_bas_joint,distance=..1,sort=nearest,limit=1] gm4_bas_id = @s gm4_bas_id run function gm4_better_armour_stands:pose/track/update_joint
