#removes one from every entity stock
#@s - console
#called by rituals:pulse_check

#audiovisuals
execute at @e[type=minecraft:area_effect_cloud,tag=gm4_rituals_altar] run particle minecraft:damage_indicator ~ ~ ~ .5 0 .5 0 10 normal @a

#if negative, reset stock scores
execute unless score $sheep gm4_rit_stock matches 0.. run scoreboard players reset $sheep gm4_rit_stock
execute unless score $pig gm4_rit_stock matches 0.. run scoreboard players reset $pig gm4_rit_stock
execute unless score $zombie gm4_rit_stock matches 0.. run scoreboard players reset $zombie gm4_rit_stock
execute unless score $drowned gm4_rit_stock matches 0.. run scoreboard players reset $drowned gm4_rit_stock
execute unless score $item_trident gm4_rit_stock matches 0.. run scoreboard players reset $item_trident gm4_rit_stock

#remove stock
execute if score $sheep gm4_rit_stock matches 1..15 run scoreboard players remove $sheep gm4_rit_stock 1
execute if score $sheep gm4_rit_stock matches 16..30 run scoreboard players remove $sheep gm4_rit_stock 15
execute if score $sheep gm4_rit_stock matches 31..45 run scoreboard players remove $sheep gm4_rit_stock 30
execute if score $sheep gm4_rit_stock matches 46..60 run scoreboard players remove $sheep gm4_rit_stock 45
execute if score $sheep gm4_rit_stock matches 61.. run scoreboard players remove $sheep gm4_rit_stock 60

execute if score $pig gm4_rit_stock matches 1..15 run scoreboard players remove $pig gm4_rit_stock 1
execute if score $pig gm4_rit_stock matches 16..30 run scoreboard players remove $pig gm4_rit_stock 15
execute if score $pig gm4_rit_stock matches 31..45 run scoreboard players remove $pig gm4_rit_stock 30
execute if score $pig gm4_rit_stock matches 46..60 run scoreboard players remove $pig gm4_rit_stock 45
execute if score $pig gm4_rit_stock matches 61.. run scoreboard players remove $pig gm4_rit_stock 60

execute if score $cow gm4_rit_stock matches 1..15 run scoreboard players remove $cow gm4_rit_stock 1
execute if score $cow gm4_rit_stock matches 16..30 run scoreboard players remove $cow gm4_rit_stock 15
execute if score $cow gm4_rit_stock matches 31..45 run scoreboard players remove $cow gm4_rit_stock 30
execute if score $cow gm4_rit_stock matches 46..60 run scoreboard players remove $cow gm4_rit_stock 45
execute if score $cow gm4_rit_stock matches 61.. run scoreboard players remove $cow gm4_rit_stock 60

execute if score $zombie gm4_rit_stock matches 1..15 run scoreboard players remove $zombie gm4_rit_stock 1
execute if score $zombie gm4_rit_stock matches 16..30 run scoreboard players remove $zombie gm4_rit_stock 15
execute if score $zombie gm4_rit_stock matches 31..45 run scoreboard players remove $zombie gm4_rit_stock 30
execute if score $zombie gm4_rit_stock matches 46..60 run scoreboard players remove $zombie gm4_rit_stock 45
execute if score $zombie gm4_rit_stock matches 61.. run scoreboard players remove $zombie gm4_rit_stock 60

execute if score $drowned gm4_rit_stock matches 1..15 run scoreboard players remove $drowned gm4_rit_stock 1
execute if score $drowned gm4_rit_stock matches 16..30 run scoreboard players remove $drowned gm4_rit_stock 15
execute if score $drowned gm4_rit_stock matches 31..45 run scoreboard players remove $drowned gm4_rit_stock 30
execute if score $drowned gm4_rit_stock matches 46..60 run scoreboard players remove $drowned gm4_rit_stock 45
execute if score $drowned gm4_rit_stock matches 61.. run scoreboard players remove $drowned gm4_rit_stock 60

execute if score $wither_skeleton gm4_rit_stock matches 1..15 run scoreboard players remove $wither_skeleton gm4_rit_stock 1
execute if score $wither_skeleton gm4_rit_stock matches 16..30 run scoreboard players remove $wither_skeleton gm4_rit_stock 15
execute if score $wither_skeleton gm4_rit_stock matches 31..45 run scoreboard players remove $wither_skeleton gm4_rit_stock 30
execute if score $wither_skeleton gm4_rit_stock matches 46..60 run scoreboard players remove $wither_skeleton gm4_rit_stock 45
execute if score $wither_skeleton gm4_rit_stock matches 61.. run scoreboard players remove $wither_skeleton gm4_rit_stock 60

#reset tick
scoreboard players set $removal_tick gm4_rit_stock 1200
