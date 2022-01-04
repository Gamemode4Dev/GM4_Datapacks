# initializes potion with an id and potion tracker marker
# @s = new custom potion
# located at @s
# run from gm4_potion_tracking-1.0:track/potion

# give potion a score based on their UUID
execute store result score @s gm4_potion_id run data get entity @s UUID[3]

# summon potion tracker marker
summon marker ~ ~ ~ {Tags:["gm4_potion_tracker","gm4_potion_tracker_new"]}

# match potion tracker id to potion id
scoreboard players operation @e[type=marker,tag=gm4_potion_tracker_new,limit=1] gm4_potion_id = @s gm4_potion_id

# store entire potion data into marker data
data modify entity @e[type=marker,tag=gm4_potion_tracker_new,limit=1] data.gm4_potion set from storage gm4_potion_tracking:temp entity_data

# clean up
tag @e[type=marker] remove gm4_potion_tracker_new
data remove storage gm4_potion_tracking:temp entity_data
