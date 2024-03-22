# @template gm4:test_platform_large
# @timeout 150

summon armor_stand ~4.5 ~1 ~2.5
item replace entity @e[type=armor_stand,distance=..4] armor.chest with minecraft:iron_chestplate[enchantments={binding_curse:1}]
item replace entity @e[type=armor_stand,distance=..4] armor.head with minecraft:wither_skeleton_skull

await delay 1s

assert entity @e[type=armor_stand,tag=gm4_phantom_scarecrow] inside

summon phantom ~5 ~10 ~5 {Tags:[gm4_test_phantom]}

await not entity @e[type=phantom,tag=gm4_test_phantom,distance=..20]
