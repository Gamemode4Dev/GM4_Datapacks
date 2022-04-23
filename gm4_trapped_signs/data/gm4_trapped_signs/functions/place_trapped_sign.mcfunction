# @s = player that just placed a trapped sign
# run from advancement place_trapped_sign

advancement revoke @s only gm4_trapped_signs:place_trapped_sign
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_trapped_signs_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[tag=gm4_trapped_signs_ray] ^ ^ ^ ~ ~
scoreboard players set gm4_ray_counter gm4_count 0
execute as @e[tag=gm4_trapped_signs_ray] at @s run function gm4_trapped_signs:ray
execute as @e[tag=gm4_trapped_signs_ray] at @s align xyz positioned ~0.5 ~0.5 ~0.5 run function gm4_trapped_signs:machine/create_trapped_sign
