# executes at the nearest ladder block in front of the player
# @s = player holding ladder
# at position of ladder block, align xyz positioned ~.5 ~ ~.5
# run from function: gm4_rope_ladders:mechanics/right_click_detection/detect_ladder_raycast/ray

# store player id
scoreboard players operation $player gm4_rol_id = @s gm4_rol_id

# visuals
execute if block ~ ~ ~ ladder[facing=south] positioned ~ ~ ~-0.35 run function gm4_rope_ladders:mechanics/right_click_detection/display_particles
execute if block ~ ~ ~ ladder[facing=north] positioned ~ ~ ~0.35 run function gm4_rope_ladders:mechanics/right_click_detection/display_particles
execute if block ~ ~ ~ ladder[facing=west] positioned ~0.35 ~ ~ run function gm4_rope_ladders:mechanics/right_click_detection/display_particles
execute if block ~ ~ ~ ladder[facing=east] positioned ~-0.35 ~ ~ run function gm4_rope_ladders:mechanics/right_click_detection/display_particles

# spawn rcd
execute if block ~ ~ ~ ladder[facing=south] positioned ~ ~ ~-0.39 positioned ~ ~-0.05 ~ unless entity @e[type=interaction,tag=gm4_rol_rcd_ladder,distance=..0.1] positioned ~ ~0.05 ~ summon interaction run function gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/create_rcd
execute if block ~ ~ ~ ladder[facing=north] positioned ~ ~ ~0.39 positioned ~ ~-0.05 ~ unless entity @e[type=interaction,tag=gm4_rol_rcd_ladder,distance=..0.1] positioned ~ ~0.05 ~ summon interaction run function gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/create_rcd
execute if block ~ ~ ~ ladder[facing=west] positioned ~0.39 ~ ~ positioned ~ ~-0.05 ~ unless entity @e[type=interaction,tag=gm4_rol_rcd_ladder,distance=..0.1] positioned ~ ~0.05 ~ summon interaction run function gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/create_rcd
execute if block ~ ~ ~ ladder[facing=east] positioned ~-0.39 ~ ~ positioned ~ ~-0.05 ~ unless entity @e[type=interaction,tag=gm4_rol_rcd_ladder,distance=..0.1] positioned ~ ~0.05 ~ summon interaction run function gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/create_rcd
