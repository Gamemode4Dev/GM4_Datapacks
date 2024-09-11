# Deposit all levels
# @s = sneaking players on top of ender chest
# at @s
# run from deposit_mode_check and dump_all

function gm4_xp_storage:dump_level

# infinite recursion fail-safe
scoreboard players add xp_dump_all_counter gm4_xp_calc 1

# loop function until levels is 1
execute if score xp_dump_all_counter gm4_xp_calc matches 1..50 unless entity @s[level=0] run function gm4_xp_storage:dump_all
