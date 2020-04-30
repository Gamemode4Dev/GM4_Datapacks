# @s = player that just placed a soul glass
# run from advancement place_soul_glass

advancement revoke @s only gm4_soul_glass:place_soul_glass
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_soul_glass_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[tag=gm4_soul_glass_ray] ^ ^ ^ ~ ~
scoreboard players set gm4_ray_counter gm4_count 0
execute as @e[tag=gm4_soul_glass_ray] at @s run function gm4_soul_glass:ray
execute at @e[tag=gm4_soul_glass_ray] align xyz unless entity @e[type=area_effect_cloud,dx=0,dy=0,dz=0,tag=gm4_soul_glass] run summon area_effect_cloud ~0.5 ~0.5 ~0.5 {Radius:0,Age:-2147483648,CustomName:'"gm4_soul_glass"',Tags:["gm4_soul_glass"],Particle:"block air"}
kill @e[tag=gm4_soul_glass_ray]
