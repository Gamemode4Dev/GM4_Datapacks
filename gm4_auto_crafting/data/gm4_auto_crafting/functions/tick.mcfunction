schedule function gm4_auto_crafting:tick 1t

# check when the piston gets powered
execute as @e[type=marker,tag=gm4_auto_crafter,tag=gm4_ac_full] at @s if block ^ ^ ^-1 moving_piston run function gm4_auto_crafting:auto_crafter/process_output
