# @template gm4:test_tube

summon cow ~1.5 ~1 ~1.5
summon item ~1.5 ~2 ~1.5 {Item:{id:"red_mushroom",Count:1b}}
summon item ~1.5 ~2 ~1.5 {Item:{id:"brown_mushroom",Count:1b}}
summon potion ~1.5 ~3 ~1.5 {Item:{id:"splash_potion",Count:1b,tag:{Potion:"slowness"}}}

await entity @e[type=mooshroom] inside
assert not entity @e[type=cow] inside
assert not entity @e[type=item] inside
