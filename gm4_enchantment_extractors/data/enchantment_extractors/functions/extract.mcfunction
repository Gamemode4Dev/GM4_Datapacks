#@s = item to have enchantments extracted
#run from enchantment_extractors:process

function enchantment_extractors:next_random
scoreboard players operation extract_chance gm4_ench_random = result gm4_ench_random
function enchantment_extractors:enchantment
playsound block.enchantment_table.use block @a[distance=..5] ~ ~ ~ 1 0.8 .5
particle enchant ~ ~1 ~ 0 0 0 .5 10
execute if block ~ ~ ~ dropper{Items:[]} run function enchantment_extractors:extract_failed
data merge entity @s {Tags:[],Item:{tag:{Enchantments:[]}}}
