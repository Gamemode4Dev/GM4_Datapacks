#check for activation
execute as @a[gamemode=!spectator,scores={gm4_rit_sneak=1..}] at @s if block ~ ~-1 ~ minecraft:redstone_block run function rituals:altar/check_spawn
#general altar checks
execute as @e[type=minecraft:area_effect_cloud,tag=gm4_altar] at @s run function rituals:altar/processes
