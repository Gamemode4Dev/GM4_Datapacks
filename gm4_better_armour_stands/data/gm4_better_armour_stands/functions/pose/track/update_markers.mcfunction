# @s = @e[type=marker,tag=gm4_bas_player_offset]
# at @p[tag=gm4_bas_track] positioned ^ ^ ^2
# run from pose/track/new

tp @s ~ ~ ~
execute at @e[type=marker,tag=gm4_bas_joint] if score @e[type=marker,tag=gm4_bas_joint,distance=..1,sort=nearest,limit=1] gm4_bas_id = @s gm4_bas_id run tp @e[type=marker,tag=gm4_bas_joint,distance=..1,sort=nearest,limit=1] ~ ~ ~ facing entity @s
