#@s = sneaking players on an ender chest
#run from deposit_mode_check

function gm4_xp_storage:dump_level

#infinite recursion fail-safe
scoreboard players add xp_dump_all_counter gm4_xp_calc 1

#loop function until levels is 1
execute if score xp_dump_all_counter gm4_xp_calc matches 1..50 unless entity @s[level=0] run function gm4_xp_storage:dump_all
