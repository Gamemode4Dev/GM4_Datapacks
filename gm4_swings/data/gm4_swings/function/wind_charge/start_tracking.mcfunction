# Track a wind charge, placing a marker on it
# @s = Wind charge, one that has not been marked previously
# at @s
# run from gm4_swings:tick

tag @s add gm4_swings.tracked_wind_charge

# summon and mount tracker
summon minecraft:marker ~ ~ ~ {Tags:["gm4_swings.wind_charge_tracker"]}
ride @n[type=minecraft:marker,tag=gm4_swings.wind_charge_tracker,predicate=!gm4_swings:vehicle,distance=..0.1] mount @s
