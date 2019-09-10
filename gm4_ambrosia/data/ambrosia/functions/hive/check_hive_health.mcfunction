# @s = beehive that is ready to produce
# at @s
# run from process_hive

# kill a bee
scoreboard players remove @s[scores={gm4_bees=1..}] gm4_bees 1

# Look for flowers nearby and try to spawn hive loot if there are any. This creates additional bees if flowers are present.
function ambrosia:hive/find_flowers

# kill hives without bees
execute if score @s gm4_bees matches 0 run function ambrosia:hive/abandon_hive

# reset hive timer
scoreboard players set @s gm4_hive_timer 0
