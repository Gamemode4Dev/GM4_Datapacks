#@s = player who reeled in the armor stand w/ fishing rod
#run from pulse_check

execute as @s[tag=gm4_ef_durability_main] run function gm4_end_fishing:durability/set_mainhand
execute as @s[tag=gm4_ef_durability_off] run function gm4_end_fishing:durability/set_offhand
