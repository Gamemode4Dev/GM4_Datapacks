# @s = @a
# Called from main
tag @s remove gm4_on_pig
tag @s[nbt={RootVehicle:{Entity:{id:"minecraft:pig"}}}] add gm4_on_pig
execute as @s[tag=gm4_on_pig] run function pig_tractors:has_hoe
