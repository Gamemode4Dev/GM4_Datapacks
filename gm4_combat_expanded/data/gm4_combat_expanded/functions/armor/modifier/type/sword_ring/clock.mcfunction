# use this tick clock only when needed
# @s = unspecified
# at unspecified
# schedule from main
# schedule from here

scoreboard players set $keep_tick.sword_ring gm4_ce_data 0

tag @e[type=item_display,tag=gm4_ce_sword_ring.keep_sword] remove gm4_ce_sword_ring.keep_sword
execute as @a[predicate=gm4_combat_expanded:modified_armor/sword_ring,gamemode=!spectator] at @s run function gm4_combat_expanded:armor/modifier/type/sword_ring/prep
kill @e[type=item_display,tag=gm4_ce_sword_ring.sword,tag=!gm4_ce_sword_ring.keep_sword]

execute if score $keep_tick.sword_ring gm4_ce_data matches 1 run schedule function gm4_combat_expanded:armor/modifier/type/sword_ring/clock 1t
