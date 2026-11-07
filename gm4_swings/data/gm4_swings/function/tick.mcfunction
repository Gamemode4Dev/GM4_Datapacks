schedule function gm4_swings:tick 1t

execute as @e[type=minecraft:item_display,tag=gm4_swings.ticking_swing] at @s run function gm4_swings:swing/tick
execute as @a[scores={gm4_swings.on_join=1..}] at @s run function gm4_swings:on_join

# wind charge detection
execute as @e[type=minecraft:wind_charge,tag=!gm4_swings.tracked_wind_charge] at @s run function gm4_swings:wind_charge/start_tracking
execute as @e[type=minecraft:marker,tag=gm4_swings.wind_charge_tracker,predicate=!gm4_swings:vehicle] at @s run function gm4_swings:wind_charge/explode
