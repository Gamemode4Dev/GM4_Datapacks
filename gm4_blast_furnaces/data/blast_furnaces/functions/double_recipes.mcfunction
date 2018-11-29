# Called from #execute_recipe
# @s = @e[tag=gm4_bf_has_raw]

execute if entity @s[tag=gm4_bf_raw_iron] run summon item ~ ~.4 ~ {Item:{id:"minecraft:iron_ingot",Count:1b}}
execute if entity @s[tag=gm4_bf_raw_gold] run summon item ~ ~.4 ~ {Item:{id:"minecraft:gold_ingot",Count:1b}}
execute if entity @s[tag=gm4_bf_raw_sand] run summon item ~ ~.4 ~ {Item:{id:"minecraft:glass",Count:1b}}
execute if entity @s[tag=gm4_bf_raw_rsand] run summon item ~ ~.4 ~ {Item:{id:"minecraft:glass",Count:1b}}
execute if entity @s[tag=gm4_bf_raw_chorus] run summon item ~ ~.4 ~ {Item:{id:"minecraft:popped_chorus_fruit",Count:1b}}
