# manages shroom placement and shroom behavior
# @s = none
# at world spawn
# run from gm4_shroomites:fast_clock

# reset clock counter
scoreboard players set $slow_clock gm4_shroom_data 0

# handle shrooms
scoreboard players set $global_shroom_count gm4_shroom_data 0
execute as @e[type=marker,tag=gm4_shroomite_shroom,tag=!smithed.entity] run function gm4_shroomites:upgrade_path/smithed_compat
execute as @e[type=marker,tag=gm4_shroomite_shroom] at @s run function gm4_shroomites:shroom/check_structure

# handle mooshrooms placing shrooms
execute as @e[type=mooshroom,tag=!smithed.entity] at @s run function gm4_shroomites:mooshroom/process

# grant advancement if shroomite cap has been reached
execute if score $global_shroom_count gm4_shroom_data >= #global_shroom_cap gm4_shroom_data run advancement grant @a only gm4:shroomites
