# @template gm4:test_tube

summon zombified_piglin ~1.5 ~1 ~1.5
summon item ~1.5 ~2 ~1.5 {Item:{id:"golden_carrot"}}
summon potion ~1.5 ~3 ~1.5 {Item:{id:"splash_potion",components:{"minecraft:potion_contents":"minecraft:swiftness"}}}

await entity @e[type=pig] inside
assert not entity @e[type=zombified_piglin] inside
assert not entity @e[type=item] inside
