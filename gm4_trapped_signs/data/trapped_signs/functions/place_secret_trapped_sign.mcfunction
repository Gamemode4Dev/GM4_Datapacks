# @s = player that just placed a secret trapped sign
# run from advancement place_secret_trapped_sign

advancement revoke @s only trapped_signs:place_secret_trapped_sign
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_trapped_signs_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[tag=gm4_trapped_signs_ray] ^ ^ ^ ~ ~
scoreboard players set gm4_ray_counter gm4_count 0
execute as @e[tag=gm4_trapped_signs_ray] at @s run function trapped_signs:ray
execute at @e[tag=gm4_trapped_signs_ray] align xyz run summon armor_stand ~0.5 ~0.5 ~0.5 {Tags:["gm4_trapped_sign","gm4_secret_trapped_sign"],NoGravity:1b,Invisible:1b,Marker:1b}
kill @e[tag=gm4_trapped_signs_ray]
