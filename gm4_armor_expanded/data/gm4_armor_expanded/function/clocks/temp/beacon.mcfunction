# use this tick clock only when needed
# @s = unspecified
# at unspecified
# schedule from main
# schedule from here

scoreboard players set $keep_tick.beacon gm4_ae_keep_tick 0

scoreboard players add $check.beacon gm4_ae_keep_tick 1
execute as @a[predicate=gm4_armor_expanded:modified_armor/beacon,gamemode=!spectator] at @s run function gm4_armor_expanded:armor/modifier/type/beacon/prep
execute as @e[type=block_display,tag=gm4_ae_beacon] unless score @s gm4_ae_keep_tick = $check.beacon gm4_ae_keep_tick at @s run function gm4_armor_expanded:armor/modifier/type/beacon/remove

execute if score $keep_tick.beacon gm4_ae_keep_tick matches 1 run schedule function gm4_armor_expanded:clocks/temp/beacon 1t
