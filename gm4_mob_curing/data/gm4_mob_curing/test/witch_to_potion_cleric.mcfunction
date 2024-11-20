# @template gm4:test_tube

summon witch ~1.5 ~1 ~1.5
summon item ~1.5 ~2 ~1.5 {Item:{id:"golden_apple"}}
summon potion ~1.5 ~3 ~1.5 {Item:{id:"splash_potion",components:{"minecraft:potion_contents":"minecraft:weakness"}}}

await entity @e[type=villager] inside
assert not entity @e[type=zombified_piglin] inside
assert not entity @e[type=item] inside
