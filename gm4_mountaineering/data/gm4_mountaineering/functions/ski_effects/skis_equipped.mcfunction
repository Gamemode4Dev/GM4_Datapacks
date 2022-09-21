# Give skiing effects when ski requirements are met
# @s = player meeting ski requirements
# at @s
# run from main

# Give speed when wearing skis and on a snowy block
effect give @s[predicate=gm4_mountaineering:on_snowy_block] speed 2 0 true

# Give extra speed if descending
execute if block ~ ~-1.3 ~ minecraft:air run effect give @s speed 2 1 true

# Clear speed effects and apply slowness if standing on a non-snowy block
execute unless predicate gm4_mountaineering:on_snowy_block_or_air run effect clear @s minecraft:speed
execute unless predicate gm4_mountaineering:on_snowy_block_or_air run effect give @s slowness 3 0 true
