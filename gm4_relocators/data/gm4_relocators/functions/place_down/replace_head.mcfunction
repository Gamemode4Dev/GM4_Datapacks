# @s = fill replacing AEC
# run from self and place_down/summon_aec

function #gm4_relocators:place_down
tp @s ~ ~1 ~
scoreboard players add fill_counter gm4_rl_data 1
execute if score fill_success gm4_rl_data matches 0 unless score fill_counter gm4_rl_data matches 8.. at @s run function gm4_relocators:place_down/replace_head
