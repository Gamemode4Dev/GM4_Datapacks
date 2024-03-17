# @template gm4:test_tube

summon zoglin ~1.5 ~1 ~1.5
summon item ~1.5 ~2 ~1.5 {Item:{id:"golden_carrot",Count:1b}}
summon potion ~1.5 ~3 ~1.5 {Item:{id:"splash_potion",Count:1b,tag:{Potion:"swiftness"}}}

await entity @e[type=hoglin] inside
assert not entity @e[type=zoglin] inside
assert not entity @e[type=item] inside
