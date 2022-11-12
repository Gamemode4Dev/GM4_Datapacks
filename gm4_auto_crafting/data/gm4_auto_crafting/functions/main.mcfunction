schedule function gm4_auto_crafting:main 4t

# process machine
execute as @e[type=marker,tag=gm4_auto_crafter,tag=!gm4_ac_full] at @s if block ~ ~ ~ dropper[triggered=false]{Items:[{}]} positioned ^ ^ ^-1 if block ^1 ^ ^ #gm4_auto_crafting:glass if block ^-1 ^ ^ #gm4_auto_crafting:glass if block ^ ^ ^-1 piston if block ^ ^1 ^ barrel{Items:[{}]} if predicate gm4_auto_crafting:has_multiblock at @s run function gm4_auto_crafting:auto_crafter/process_input
execute as @e[type=marker,tag=gm4_auto_crafter,tag=gm4_ac_full] at @s run particle minecraft:falling_dust redstone_block ^ ^ ^-0.6 0 0 0 1 1
