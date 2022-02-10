# @s = player who used a flint and steel in the nether
# run from tick

summon marker ~ ~ ~ {Tags:["gm4_soul_forge_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[type=marker,tag=gm4_soul_forge_ray,limit=1] ^ ^ ^ ~ ~
scoreboard players set $ray gm4_count 0
execute as @e[type=marker,tag=gm4_soul_forge_ray,limit=1] at @s run function gm4_orb_of_ankou:soul_forge/ray
execute unless score $found gm4_count matches 1 anchored eyes positioned ^ ^ ^ anchored feet run tp @e[type=marker,tag=gm4_soul_forge_ray,limit=1] ^ ^ ^ ~ ~
execute unless score $found gm4_count matches 1 as @e[type=marker,tag=gm4_soul_forge_ray,limit=1] at @s run function gm4_orb_of_ankou:soul_forge/ray_backup
execute at @e[type=marker,tag=gm4_ray_loc,limit=1] if predicate gm4_orb_of_ankou:has_multiblock align xyz positioned ~0.5 ~ ~0.5 unless entity @e[type=armor_stand,tag=gm4_soul_forge,limit=1,distance=..1] run function gm4_orb_of_ankou:soul_forge/create
kill @e[type=marker,tag=gm4_soul_forge_ray]
kill @e[type=marker,tag=gm4_ray_loc]
scoreboard players reset $ray gm4_count
scoreboard players reset $found gm4_count
