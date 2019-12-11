# @s = player who placed a relocator player head
# run from advancement "place_relocator"

advancement revoke @s only relocators:place_relocator

summon area_effect_cloud ~ ~ ~ {Tags:["gm4_relocating_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[tag=gm4_relocating_ray] ^ ^ ^ ~ ~
scoreboard players set gm4_ray_counter gm4_rl_data 0
execute as @e[tag=gm4_relocating_ray] at @s run function relocators:relocating_ray
execute at @e[tag=gm4_relocating_ray] align xyz store result score location gm4_rl_data run data get block ~ ~ ~ y 100
scoreboard players remove location gm4_rl_data 100
execute at @e[tag=gm4_relocating_ray] align xyz positioned ~0.5 ~-1 ~0.5 run function relocators:found_machine

kill @e[tag=gm4_relocated_ray]
