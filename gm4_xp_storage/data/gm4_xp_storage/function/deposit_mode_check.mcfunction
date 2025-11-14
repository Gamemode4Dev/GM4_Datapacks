# Check if player dumps 1 or all levels
# @s = players on top of ender chest
# at @s
# run from main

# players who were not sneaking on an ender-chest last pulse and are now sneaking run dump-all
execute if entity @s[predicate=gm4_xp_storage:sneaking] run scoreboard players set xp_dump_all_counter gm4_xp_calc 1
execute if entity @s[predicate=gm4_xp_storage:sneaking,level=1..] run function gm4_xp_storage:dump_all

# players who are not sneaking deposit a single level
execute if entity @s[predicate=!gm4_xp_storage:sneaking,level=1..] run function gm4_xp_storage:dump_level
