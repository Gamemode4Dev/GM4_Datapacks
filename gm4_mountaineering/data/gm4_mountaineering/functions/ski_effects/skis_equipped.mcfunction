# Give skiing effects when ski requirements are met
# @s = player meeting ski requirements
# at @s
# run from main

# Give speed when wearing skis and on a snowy block
effect give @s[predicate=gm4_mountaineering:ski_requirements] speed 3 0 true

# Give extra speed if descending
execute at @a if block ~ ~-1.1 ~ minecraft:air run effect give @s[predicate=gm4_mountaineering:descending] speed 2 1 true

# Clear speed effects and apply slowness if standing on a non-snowy block
execute at @a unless predicate gm4_mountaineering:on_snowy_block run effect clear @s[predicate=gm4_mountaineering:wearing_skis] minecraft:speed
execute at @a unless predicate gm4_mountaineering:on_snowy_block run effect give @s[predicate=gm4_mountaineering:wearing_skis] slowness 2 0 true
