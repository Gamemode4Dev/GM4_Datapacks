# @s = trapped sign
# run from main

execute if entity @s[tag=!gm4_trapped_signs_completed] at @s run function gm4_trapped_signs:process_uncompleted

execute if entity @s[tag=gm4_trapped_signs_pulsed] at @s run function gm4_trapped_signs:deactivate
execute if entity @s[tag=gm4_trapped_signs_need_pulse] at @s run function gm4_trapped_signs:activate
