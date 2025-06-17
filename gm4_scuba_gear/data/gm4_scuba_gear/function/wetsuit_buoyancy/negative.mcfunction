# increases player gravity when actively sinking
# @s = player wearing wetsuit, sneak input
# located at @s, in water
# run from enchant, gm4_scuba_gear:enchantment/wetsuit

item modify entity @s armor.legs gm4_scuba_gear:wetsuit_buoyancy/negative

tag @s remove gm4_sg_buoyancy_positive
tag @s remove gm4_sg_buoyancy_neutral
tag @s add gm4_sg_buoyancy_negative
