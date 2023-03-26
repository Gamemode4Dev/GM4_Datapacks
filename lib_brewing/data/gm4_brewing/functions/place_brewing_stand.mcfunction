# @s = player that just placed a brewing stand
# run from advancement place_brewing_stand

# revoke advancement
advancement revoke @s only gm4_brewing:place_brewing_stand

# raycast
summon marker ~ ~ ~ {Tags:["gm4_brewing_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[type=marker,tag=gm4_brewing_ray,limit=1] ^ ^ ^ ~ ~
scoreboard players set $ray gm4_count 0
execute as @e[type=marker,tag=gm4_brewing_ray,limit=1] at @s run function gm4_brewing-1.0:ray
execute unless score $found gm4_count matches 1 anchored eyes positioned ^ ^ ^ anchored feet run tp @e[type=marker,tag=gm4_brewing_ray,limit=1] ^ ^ ^ ~ ~
execute unless score $found gm4_count matches 1 as @e[type=marker,tag=gm4_brewing_ray,limit=1] at @s run function gm4_brewing:ray_backup

kill @e[type=marker,tag=gm4_brewing_ray]
scoreboard players reset $ray gm4_count
scoreboard players reset $found gm4_count
