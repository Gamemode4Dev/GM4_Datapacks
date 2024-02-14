
scoreboard players set $keep_tick.boss gm4_ce_keep_tick 0
execute as @e[type=shulker,tag=gm4_ce_boss.main] at @s run function gm4_combat_expanded:boss/tick

scoreboard players add @e[tag=gm4_ce_boss.temp_display] gm4_ce_boss.tick_delay 1
kill @e[tag=gm4_ce_boss.temp_display,scores={gm4_ce_boss.tick_delay=9..}]

execute if score $keep_tick.boss gm4_ce_keep_tick matches 0 run kill @e[tag=gm4_ce_boss.temp_display]
execute if score $keep_tick.boss gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:boss/clock 1t
