# @template gm4:test_platform_large
# @timeout 150

summon armor_stand ~4.5 ~1 ~2.5
execute positioned ~4.5 ~1 ~2.5 run item replace entity @e[type=armor_stand,dx=0] armor.chest with minecraft:iron_chestplate[enchantments={binding_curse:1}]
execute positioned ~4.5 ~1 ~2.5 run item replace entity @e[type=armor_stand,dx=0] armor.head with minecraft:wither_skeleton_skull

await delay 1s

assert entity @e[type=armor_stand,tag=gm4_phantom_scarecrow] inside

summon phantom ~6.5 ~2.5 ~1.5 {Tags:[gm4_test_phantom]}

await not entity @e[type=phantom,tag=gm4_test_phantom,distance=..20]
