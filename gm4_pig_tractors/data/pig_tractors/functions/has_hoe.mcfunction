# @s = @a[nbt={RootVehicle:{Entity:{id:"minecraft:pig"}}}]
# Called from check_pig
tag @s remove gm4_has_hoe
tag @s[nbt={Inventory:[{id:"minecraft:wooden_hoe"}]}] add gm4_has_hoe
tag @s[nbt={Inventory:[{id:"minecraft:stone_hoe"}]}] add gm4_has_hoe
tag @s[nbt={Inventory:[{id:"minecraft:golden_hoe"}]}] add gm4_has_hoe
tag @s[nbt={Inventory:[{id:"minecraft:iron_hoe"}]}] add gm4_has_hoe
tag @s[nbt={Inventory:[{id:"minecraft:diamond_hoe"}]}] add gm4_has_hoe
advancement grant @s[tag=gm4_has_hoe] only gm4:pig_tractors
