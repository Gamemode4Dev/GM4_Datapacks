# @s = beehive entity
# at @s
# run from main

# destroy broken hives
execute unless block ~ ~ ~ barrel run function ambrosia:hive/destroy_hive

# increment productivity timer
scoreboard players operation @s gm4_hive_timer += @s gm4_bees

# debug bee display. Enable this for easy debugging. For more debug displays view ambrosia:hive/find_flowers
#title @a[distance=..4] actionbar ["",{"text":"Bees: "},{"score":{"name":"@s","objective":"gm4_bees"}}]

# run actions at beehive once timer reaches max
execute if score @s gm4_hive_timer matches 1000.. run function ambrosia:hive/check_hive_health

# spawn bees if the hive is opened, unless there is a campfire beneath
execute if block ~ ~ ~ minecraft:barrel[open=true] unless block ~ ~-1 ~ campfire[lit=true] unless block ~ ~-2 ~ campfire[lit=true] unless block ~ ~-3 ~ campfire[lit=true] unless block ~ ~-4 ~ campfire[lit=true] run function ambrosia:beehavior/spawn_angry_bee
