#@s = larvae on top of barrel
# at @s
#run from main

# get current game time and harvest time and pull them into a scoreboard
execute store result score gametime gm4_bee_data run time query gametime
scoreboard players operation gametime gm4_bee_data /= #10 gm4_bee_data

execute store result score harvest_time gm4_bee_data run data get entity @s Item.tag.gm4_ambrosia.harvest_time

scoreboard players operation gametime gm4_bee_data -= harvest_time gm4_bee_data

execute if score gametime gm4_bee_data matches ..192000 run function ambrosia:hive/create_hive
execute if score gametime gm4_bee_data matches 192001.. run data merge entity @s {Item:{tag:{display:{Name:'"Dead larvae"'}}}}
