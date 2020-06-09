# @s = smeltry about to finishing smelting a valid item
# run from check_ore

tag @s add gm4_bf_could_smelt

#start short-term ticking clock
scoreboard players set ticking_counter gm4_bf_data 16
schedule function gm4_smelteries:limited_tick 1t

#first run of ticking clock happens now
function gm4_smelteries:limited_tick
