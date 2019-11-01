# @s = beehive entity without barrel at it's location
# at @s
# run from hive/process_hive

# spawn angry bees
execute if score @s gm4_bees matches 1.. run function ambrosia:hive/release_all_bees

# kill hive entity
kill @s
