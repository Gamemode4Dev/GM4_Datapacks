
# set scoreboard
scoreboard players set $found_ladder gm4_rol_data 1

# visuals
execute if block ~ ~ ~ ladder[facing=south] positioned ~ ~ ~-0.3 run function gm4_rope_ladders:mechanics/right_click_detection/display_particles
execute if block ~ ~ ~ ladder[facing=north] positioned ~ ~ ~0.3 run function gm4_rope_ladders:mechanics/right_click_detection/display_particles
execute if block ~ ~ ~ ladder[facing=west] positioned ~0.3 ~ ~ run function gm4_rope_ladders:mechanics/right_click_detection/display_particles
execute if block ~ ~ ~ ladder[facing=east] positioned ~-0.3 ~ ~ run function gm4_rope_ladders:mechanics/right_click_detection/display_particles

# spawn rcd
execute if block ~ ~ ~ ladder[facing=south] positioned ~ ~ ~-0.45 unless entity @e[type=villager,tag=gm4_rol_rcd_ladder,distance=..0.1] run function gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/spawn_rcd
execute if block ~ ~ ~ ladder[facing=north] positioned ~ ~ ~0.45 unless entity @e[type=villager,tag=gm4_rol_rcd_ladder,distance=..0.1] run function gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/spawn_rcd
execute if block ~ ~ ~ ladder[facing=west] positioned ~0.45 ~ ~ unless entity @e[type=villager,tag=gm4_rol_rcd_ladder,distance=..0.1] run function gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/spawn_rcd
execute if block ~ ~ ~ ladder[facing=east] positioned ~-0.45 ~ ~ unless entity @e[type=villager,tag=gm4_rol_rcd_ladder,distance=..0.1] run function gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/spawn_rcd
