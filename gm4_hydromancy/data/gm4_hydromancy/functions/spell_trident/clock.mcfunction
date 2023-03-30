# process spell tridents
# @s = undefined
# at undefined
# schedule from spell_trident/init_trident
# schedule from here

# process tridents every tick
execute as @e[type=trident,tag=gm4_hy_spell_trident.process_fast] at @s run function gm4_hydromancy:spell_trident/process_fast
# or every 16 ticks
scoreboard players add $trident_clock gm4_hy_data 1
execute if score $trident_clock gm4_hy_data matches 16.. as @e[type=trident,tag=gm4_hy_spell_trident.process_slow] at @s run function gm4_hydromancy:spell_trident/process_fast
execute if score $trident_clock gm4_hy_data matches 16.. run scoreboard players set $trident_clock gm4_hy_data 0

# continue processing as long as there is a process trident
execute if entity @e[type=trident,tag=gm4_hy_spell_trident.process] run schedule function gm4_hydromancy:spell_trident/clock 1t
