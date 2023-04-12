# process spell tridents
# @s = undefined
# at undefined
# schedule from spell_trident/init_trident
# schedule from here

# process tridents every tick
execute as @e[type=trident,tag=gm4_hy_spell_trident.process] at @s run function gm4_hydromancy:spell_trident/process

# continue processing as long as there is a process trident
execute if entity @e[type=trident,tag=gm4_hy_spell_trident.process] run schedule function gm4_hydromancy:spell_trident/clock 1t
