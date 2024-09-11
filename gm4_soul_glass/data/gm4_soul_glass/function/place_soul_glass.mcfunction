# @s = player that just placed a soul glass
# run from advancement place_soul_glass

advancement revoke @s only gm4_soul_glass:place_soul_glass
summon marker ~ ~ ~ {Tags:["gm4_soul_glass_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[tag=gm4_soul_glass_ray] ^ ^ ^ ~ ~
scoreboard players set gm4_ray_counter gm4_count 0
execute as @e[tag=gm4_soul_glass_ray] at @s run function gm4_soul_glass:ray
execute at @e[tag=gm4_soul_glass_ray] align xyz positioned ~0.5 ~0.5 ~0.5 unless entity @e[type=marker,distance=..0.1,tag=gm4_soul_glass,limit=1] run summon marker ~ ~ ~ {CustomName:'"gm4_soul_glass"',Tags:["gm4_soul_glass","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"]}
scoreboard players set @e[type=marker,tag=gm4_new_machine,distance=..6] gm4_entity_version 1
tag @e[type=marker,distance=..6] remove gm4_new_machine
kill @e[tag=gm4_soul_glass_ray]
