# @s = player on pig
# at @s
# Called from on_pig
tag @s[nbt={Inventory:[{id:"minecraft:diamond_hoe"}]}] add gm4_has_hoe
tag @s[nbt={Inventory:[{id:"minecraft:golden_hoe"}]}] add gm4_has_hoe
tag @s[nbt={Inventory:[{id:"minecraft:iron_hoe"}]}] add gm4_has_hoe
tag @s[nbt={Inventory:[{id:"minecraft:wooden_hoe"}]}] add gm4_has_hoe
tag @s[nbt={Inventory:[{id:"minecraft:stone_hoe"}]}] add gm4_has_hoe
advancement grant @s[tag=gm4_has_hoe] only gm4:pig_tractors
