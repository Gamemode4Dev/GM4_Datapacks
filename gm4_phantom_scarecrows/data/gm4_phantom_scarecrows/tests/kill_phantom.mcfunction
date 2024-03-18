# @template gm4:test_platform_large
# @timeout 150

summon armor_stand ~4.5 ~1 ~2.5 {ArmorItems:[{},{},{id:"iron_chestplate",Count:1b,tag:{Enchantments:[{id:"minecraft:binding_curse",lvl:1s}]}},{id:"minecraft:wither_skeleton_skull",Count:1b}]}

await delay 1s

assert entity @e[type=armor_stand,tag=gm4_phantom_scarecrow] inside

summon phantom ~5 ~10 ~5 {Tags:[gm4_test_phantom]}

await not entity @e[type=phantom,tag=gm4_test_phantom,distance=..20]
