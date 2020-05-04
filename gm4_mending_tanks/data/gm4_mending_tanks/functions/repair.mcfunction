#@s = experience liquid tank with item in first slot
#run from mending_tanks:check_item


# we will repair min(Damage, repair_points, max_repair)
scoreboard players operation $repair gm4_lt_util = @s gm4_lt_value
execute if score $repair gm4_lt_util matches ..-1 run scoreboard players set $repair gm4_lt_util 0
## convert xp points to repair points
scoreboard players operation $repair gm4_lt_util *= #mt_repair_per_xp gm4_lt_util
scoreboard players operation $repair gm4_lt_util < $damage gm4_lt_util
scoreboard players operation $repair gm4_lt_util < #mt_max_repair gm4_lt_util

# subtract $repair from Damage
scoreboard players operation $damage gm4_lt_util -= $repair gm4_lt_util
execute store result block ~ ~ ~ Items[0].tag.Damage int 1 run scoreboard players get $damage gm4_lt_util

# convert repair cost to xp_points (rounded up) and add to value
scoreboard players remove $repair gm4_lt_util 1
scoreboard players operation $repair gm4_lt_util /= #mt_repair_per_xp gm4_lt_util
scoreboard players add $repair gm4_lt_util 1

scoreboard players operation @s gm4_lt_value -= $repair gm4_lt_util
