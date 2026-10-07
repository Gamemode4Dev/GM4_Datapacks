schedule function gm4_swings:tick 1t

execute as @e[type=minecraft:item_display,tag=gm4_swings.ticking_swing] at @s run function gm4_swings:swing/tick
execute as @a[scores={gm4_swings.on_join=1..}] at @s run function gm4_swings:on_join
