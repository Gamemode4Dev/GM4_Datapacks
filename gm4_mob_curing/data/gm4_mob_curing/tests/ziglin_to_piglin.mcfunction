# @template gm4:test_tube

summon zombified_piglin ~1.5 ~1 ~1.5
summon item ~1.5 ~2 ~1.5 {Item:{id:"golden_carrot",Count:1b}}
summon potion ~1.5 ~3 ~1.5 {Item:{id:"splash_potion",Count:1b,tag:{Potion:"weakness"}}}

await entity @e[type=piglin] inside
assert not entity @e[type=zombified_piglin] inside
assert not entity @e[type=item] inside
