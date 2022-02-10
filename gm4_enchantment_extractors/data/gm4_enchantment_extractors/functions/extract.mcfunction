# @s = item to have enchantments extracted
# located at the enchantment extractor below it
# run from enchantment_extractors:process

data modify entity @e[tag=gm4_enchantment_extractor,limit=1,sort=nearest,distance=..0.01] HandItems[0] set from entity @s Item

# if cursed extract only the curse
execute if entity @e[tag=gm4_enchantment_extractor,limit=1,sort=nearest,distance=..0.01,predicate=gm4_enchantment_extractors:vanishing_curse] run function gm4_enchantment_extractors:extract_vanishing
execute if entity @e[tag=gm4_enchantment_extractor,limit=1,sort=nearest,distance=..0.01,predicate=gm4_enchantment_extractors:binding_curse] run function gm4_enchantment_extractors:extract_binding

# extract
execute unless entity @s[tag=gm4_ench_extracted] as @e[tag=gm4_enchantment_extractor,limit=1,sort=nearest,distance=..0.01] run loot insert ~ ~1 ~ fish gm4_enchantment_extractors:extract/check ~ ~ ~ mainhand

# visuals
playsound block.enchantment_table.use block @a[distance=..5] ~ ~1 ~ 1 0.8 .5
particle enchant ~ ~2 ~ 0 0 0 .5 10

data modify storage gm4_enchantment_extractors:temp/extractor Items set from block ~ ~1 ~ Items

# failed extraction
execute if data storage gm4_enchantment_extractors:temp/extractor Items run function gm4_enchantment_extractors:extract_failed

#grant mending advancement
execute if data storage gm4_enchantment_extractors:temp/extractor {tag:{Enchantments:[{id:"minecraft:mending"}]}} unless data storage gm4_enchantment_extractors:temp/extractor {tag:{Enchantments:[{id:"minecraft:mending"},{id:"minecraft:vanishing_curse"}]}} run advancement grant @a[distance=..5] only gm4:enchantment_extractors_mending

# clean up
data remove entity @e[tag=gm4_enchantment_extractor,limit=1,sort=nearest,distance=..0.01] HandItems[0]
data remove entity @s Item.tag.Enchantments
data remove storage gm4_enchantment_extractors:temp/extractor Items
