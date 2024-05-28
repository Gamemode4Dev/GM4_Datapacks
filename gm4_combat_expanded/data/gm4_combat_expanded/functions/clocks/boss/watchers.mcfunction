# use this tick clock only when needed
# @s = unspecified
# at unspecified
# schedule from main
# schedule from boss/watchers/activation/spawn/head
# schedule from here

scoreboard players set $keep_tick.boss gm4_ce_keep_tick 0
execute as @e[type=shulker,tag=gm4_ce_boss.watcher.main] at @s run function gm4_combat_expanded:boss/watchers/tick

scoreboard players add @e[tag=gm4_ce_boss.watcher.temp_display] gm4_ce_boss.tick_delay 1
kill @e[tag=gm4_ce_boss.watcher.temp_display,scores={gm4_ce_boss.tick_delay=9..}]

execute if score $keep_tick.boss gm4_ce_keep_tick matches 0 run kill @e[tag=gm4_ce_boss.watcher.temp_display]
execute if score $keep_tick.boss gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/boss/watchers 1t
