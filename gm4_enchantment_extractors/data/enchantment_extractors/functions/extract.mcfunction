scoreboard players add extract_chance gm4_ench_random 27
execute if score extract_chance gm4_ench_random matches 100.. run scoreboard players remove extract_chance gm4_ench_random 100
function enchantment_extractors:enchantment
playsound block.enchantment_table.use block @a[distance=..5] ~ ~ ~ 1 0.8 .5
particle enchant ~ ~1 ~ 0 0 0 .5 10
execute if block ~ ~ ~ dropper{Items:[]} run function enchantment_extractors:extract_failed
data merge entity @s {Tags:[],Item:{tag:{Enchantments:[]}}}
