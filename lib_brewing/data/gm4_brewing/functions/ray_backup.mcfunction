# @s = marker ray used to find the brewing stand
# run from gm4_brewing-1.0:place_brewing_stand

# check blocks around the marker ray
scoreboard players set $found gm4_count 0
execute store success score $found gm4_count align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ brewing_stand unless entity @e[type=marker,distance=..0.1,tag=gm4_brewing_stand,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_brewing_stand"],CustomName:'"gm4_brewing_stand"'}
execute if score $found gm4_count matches 0 store success score $found gm4_count align xyz positioned ~0.5 ~1.5 ~0.5 if block ~ ~ ~ brewing_stand unless entity @e[type=marker,distance=..0.1,tag=gm4_brewing_stand,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_brewing_stand"],CustomName:'"gm4_brewing_stand"'}
execute if score $found gm4_count matches 0 store success score $found gm4_count align xyz positioned ~0.5 ~-0.5 ~0.5 if block ~ ~ ~ brewing_stand unless entity @e[type=marker,distance=..0.1,tag=gm4_brewing_stand,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_brewing_stand"],CustomName:'"gm4_brewing_stand"'}
execute if score $found gm4_count matches 0 store success score $found gm4_count align xyz positioned ~1.5 ~0.5 ~0.5 if block ~ ~ ~ brewing_stand unless entity @e[type=marker,distance=..0.1,tag=gm4_brewing_stand,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_brewing_stand"],CustomName:'"gm4_brewing_stand"'}
execute if score $found gm4_count matches 0 store success score $found gm4_count align xyz positioned ~-0.5 ~0.5 ~0.5 if block ~ ~ ~ brewing_stand unless entity @e[type=marker,distance=..0.1,tag=gm4_brewing_stand,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_brewing_stand"],CustomName:'"gm4_brewing_stand"'}
execute if score $found gm4_count matches 0 store success score $found gm4_count align xyz positioned ~0.5 ~0.5 ~1.5 if block ~ ~ ~ brewing_stand unless entity @e[type=marker,distance=..0.1,tag=gm4_brewing_stand,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_brewing_stand"],CustomName:'"gm4_brewing_stand"'}
execute if score $found gm4_count matches 0 store success score $found gm4_count align xyz positioned ~0.5 ~0.5 ~-0.5 if block ~ ~ ~ brewing_stand unless entity @e[type=marker,distance=..0.1,tag=gm4_brewing_stand,limit=1] run summon marker ~ ~ ~ {Tags:["gm4_brewing_stand"],CustomName:'"gm4_brewing_stand"'}

# move forward
scoreboard players remove $ray gm4_count 1
tp @s ^ ^ ^0.01
execute if score $ray gm4_count matches 0..500 at @s unless score $found gm4_count matches 1 run function gm4_brewing:ray_backup
