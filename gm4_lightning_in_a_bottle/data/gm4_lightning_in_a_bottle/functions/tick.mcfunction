
execute as @e[type=potion,nbt={Item:{tag:{gm4_lightning_in_a_bottle:1b}}}] at @s run function gm4_lightning_in_a_bottle:potion_tracker/spawn_tracker

# kill lazy loaded markers
execute as @e[type=marker,tag=gm4_liab_potion_tracker] run function gm4_lightning_in_a_bottle:potion_tracker/kill

schedule function gm4_lightning_in_a_bottle:tick 1t
