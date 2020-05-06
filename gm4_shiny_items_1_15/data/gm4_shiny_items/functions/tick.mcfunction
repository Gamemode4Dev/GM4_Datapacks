
schedule function gm4_shiny_items:tick 1t

execute as @e[tag=gm4_can_become_shiny] at @s if entity @a[distance=..2] run function gm4_shiny_items:undo_item_progress
execute as @e[scores={gm4_absorbed_xp=1..}] at @s if entity @a[distance=..2] run function gm4_shiny_items:undo_item_progress

execute as @e[tag=gm4_can_become_shiny] at @s if block ~ ~-.6 ~ hopper run function gm4_shiny_items:undo_item_progress
execute as @e[scores={gm4_absorbed_xp=1..}] at @s if block ~ ~-6 ~ hopper run function gm4_shiny_items:undo_item_progress

