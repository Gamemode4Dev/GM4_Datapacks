# merges the boat and chest minecart
# @s = boat that meets the conditions: valid chest minecart within 2 blocks, no passengers on boat, no players on boat
# at @s
# run from gm4_chest_boats:main


# grant advancement
advancement grant @a[gamemode=!spectator,distance=..5] only gm4:chest_boats

# summon chest boat
summon boat ~ ~ ~ {Tags:["gm4_cb_new_boat"],Passengers:[{id:"minecraft:chest_minecart",Tags:["gm4_cb_new_chest"]}]}

# update boat data
data modify entity @e[type=boat,tag=gm4_cb_new_boat,limit=1] {} merge from entity @s
tag @e[type=boat] remove gm4_cb_new_boat
kill @s

# update chest data
tag @e[type=chest_minecart,distance=..2,predicate=!gm4_chest_boats:is_passenger,sort=nearest,limit=1] add gm4_cb_old_chest
data modify entity @e[type=chest_minecart,tag=gm4_cb_new_chest,limit=1] {} merge from entity @e[type=chest_minecart,tag=gm4_cb_old_chest,limit=1]
tag @e[type=chest_minecart] remove gm4_cb_new_chest

# Kill old chest
data merge entity @e[type=chest_minecart,tag=gm4_cb_old_chest,limit=1] {Items:[]}
kill @e[type=chest_minecart,tag=gm4_cb_old_chest,limit=1]
