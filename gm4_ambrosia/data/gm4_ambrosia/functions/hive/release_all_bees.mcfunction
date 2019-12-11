# @s = beehive entity without barrel at it's location
# at @s
# run from hive/destroy_hive

# spawns the number in bees in the hive as angry bee entities

# spawn bee
function gm4_ambrosia:beehavior/spawn_angry_bee

# reduce bee score
scoreboard players remove @s gm4_bees 5

# loop
execute if score @s gm4_bees matches 1.. run function gm4_ambrosia:hive/release_all_bees
