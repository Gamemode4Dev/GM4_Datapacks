# use this tick clock only when needed
# @s = unspecified
# at unspecified
# schedule from main
# schedule from here

scoreboard players set $keep_tick.sword_ring gm4_ce_keep_tick 0

scoreboard players add $check.sword_ring gm4_ce_keep_tick 1
execute as @a[predicate=gm4_combat_expanded:modified_armor/sword_ring,gamemode=!spectator] at @s run function gm4_combat_expanded:armor/modifier/type/sword_ring/prep
execute as @e[type=item_display,tag=gm4_ce_sword_ring.sword] unless score @s gm4_ce_keep_tick = $check.sword_ring gm4_ce_keep_tick run kill @s

execute if score $keep_tick.sword_ring gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/sword_ring 1t
