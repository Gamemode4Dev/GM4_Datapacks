# @s = player who placed a relocator player head
# run from advancement "place_relocator_wall"

advancement revoke @s only relocators:place_relocator_wall

summon area_effect_cloud ~ ~ ~ {Tags:["gm4_relocating_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[tag=gm4_relocating_ray] ^ ^ ^ ~ ~
scoreboard players set gm4_ray_counter gm4_rl_data 0
execute as @e[tag=gm4_relocating_ray] at @s run function relocators:relocating_ray
execute at @e[tag=gm4_relocating_ray] if block ~ ~ ~ player_wall_head[facing=north] align xyz positioned ~0.5 ~ ~1.5 run function relocators:found_machine
execute at @e[tag=gm4_relocating_ray] if block ~ ~ ~ player_wall_head[facing=south] align xyz positioned ~0.5 ~ ~-0.5 run function relocators:found_machine
execute at @e[tag=gm4_relocating_ray] if block ~ ~ ~ player_wall_head[facing=east] align xyz positioned ~-0.5 ~ ~0.5 run function relocators:found_machine
execute at @e[tag=gm4_relocating_ray] if block ~ ~ ~ player_wall_head[facing=west] align xyz positioned ~1.5 ~ ~0.5 run function relocators:found_machine
kill @e[tag=gm4_relocated_ray]
