# use this tick clock only when needed
# @s = unspecified
# at unspecified
# schedule from main
# schedule from here

scoreboard players set $keep_tick.beacon gm4_ce_keep_tick 0

tag @e[type=block_display,tag=gm4_ce_beacon.keep] remove gm4_ce_beacon.keep
execute as @a[predicate=gm4_combat_expanded:modified_armor/beacon,gamemode=!spectator] at @s run function gm4_combat_expanded:armor/modifier/type/beacon/prep
execute as @e[type=block_display,tag=gm4_ce_beacon,tag=!gm4_ce_beacon.keep] at @s run function gm4_combat_expanded:armor/modifier/type/beacon/remove 

execute if score $keep_tick.beacon gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:armor/modifier/type/beacon/clock 1t
