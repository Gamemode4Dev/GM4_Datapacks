# @s = master crafter which needs to be converted into a pulverizer
# run from master_recipe_check
data merge entity @s {CustomName:"\"gm4_pulverizer\"",Tags:[gm4_pulverizer,gm4_no_edit],ArmorItems:[{},{},{},{id:"minecraft:iron_block",Count:1b,tag:{Enchantments:[{id:"minecraft:protection",lvl:0}]}}],Pose:{Head:[0f,0f,0f]},Small:1b}
data merge block ~ ~ ~ {CustomName:"\"Pulverizer\"",Items:[]}

playsound block.anvil.place block @a[distance=..4] ~ ~ ~ 1 0.7 1

advancement grant @a[distance=..6] only gm4:pulverizers
