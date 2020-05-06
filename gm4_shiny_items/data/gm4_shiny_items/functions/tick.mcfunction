
schedule function gm4_shiny_items:tick 1t

execute as @e[scores={gm4_absorbed_xp=0..}] at @s run function gm4_shiny_items:check_for_stop
