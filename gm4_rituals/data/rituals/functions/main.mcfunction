#check clock
execute as @e[type=minecraft:area_effect_cloud,tag=gm4_rituals_altar] at @s run function rituals:altar/check_clock
#check for activation
execute if score current_tick gm4_clock_tick = rituals gm4_clock_tick as @a[gamemode=!spectator,scores={gm4_rit_sneak=1..}] at @s if block ~ ~-1 ~ minecraft:redstone_block run function rituals:altar/check_spawn
