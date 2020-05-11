#run from fell_LOGTYPE
#@s = tree feller aec
execute if entity @s[tag=gm4_acacia_feller] run summon item ~ ~ ~ {Item:{id:"acacia_log",Count:1b}}
execute if entity @s[tag=gm4_birch_feller] run summon item ~ ~ ~ {Item:{id:"birch_log",Count:1b}}
execute if entity @s[tag=gm4_dark_oak_feller] run summon item ~ ~ ~ {Item:{id:"dark_oak_log",Count:1b}}
execute if entity @s[tag=gm4_jungle_feller] run summon item ~ ~ ~ {Item:{id:"jungle_log",Count:1b}}
execute if entity @s[tag=gm4_oak_feller] run summon item ~ ~ ~ {Item:{id:"oak_log",Count:1b}}
execute if entity @s[tag=gm4_spruce_feller] run summon item ~ ~ ~ {Item:{id:"spruce_log",Count:1b}}
execute if entity @s[tag=gm4_mushroom_stem_feller] run summon item ~ ~ ~ {Item:{id:"mushroom_stem",Count:1b}}
execute if entity @s[tag=gm4_red_mushroom_feller] run summon item ~ ~ ~ {Item:{id:"red_mushroom_block",Count:1b}}
execute if entity @s[tag=gm4_brown_mushroom_feller] run summon item ~ ~ ~ {Item:{id:"brown_mushroom_block",Count:1b}}
scoreboard players remove @s gm4_arb_stat 1
execute if score @s gm4_arb_stat matches 1.. run function gm4_arborenda_shamir:drop_logs
