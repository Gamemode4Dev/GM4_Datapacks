# merges the boat and chest minecart
# @s = boat that meets the conditions: valid chest minecart within 2 blocks, no passengers on boat, no players on boat
# at @s
# run from gm4_chest_boats:main


# grant advancement
advancement grant @a[distance=..5] only gm4:chest_boats

# modify old boat
function gm4_chest_boats:manage/old_boat

# summon new boat
summon boat ~ ~ ~ {Tags:["gm4_cb_new_boat"],Passengers:[{id:"minecraft:chest_minecart",Tags:["gm4_cb_new_chest"]}]}

# modify new boat
execute as @e[type=boat,tag=gm4_cb_new_boat,limit=1] run function gm4_chest_boats:manage/new_boat

# update old chest
execute as @e[type=chest_minecart,tag=!gm4_cb_new_chest,limit=1,sort=nearest] run function gm4_chest_boats:manage/old_chest

# update new chest
execute as @e[type=chest_minecart,tag=gm4_cb_new_chest,limit=1] run function gm4_chest_boats:manage/new_chest
