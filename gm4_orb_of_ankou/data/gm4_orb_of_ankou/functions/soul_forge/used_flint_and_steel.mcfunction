# @s = player who used a flint and steel in the nether
# run from tick

summon area_effect_cloud ~ ~ ~ {Tags:["gm4_soul_forge_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[tag=gm4_soul_forge_ray] ^ ^ ^ ~ ~
scoreboard players set gm4_ray_counter gm4_count 0
execute as @e[tag=gm4_soul_forge_ray] at @s run function gm4_orb_of_ankou:soul_forge/ray
execute at @e[tag=gm4_soul_forge_ray] if predicate gm4_orb_of_ankou:has_multiblock align xyz positioned ~0.5 ~ ~0.5 unless entity @e[type=armor_stand,tag=gm4_soul_forge,limit=1,distance=..1] run function gm4_orb_of_ankou:soul_forge/create
kill @e[tag=gm4_soul_forge_ray]
