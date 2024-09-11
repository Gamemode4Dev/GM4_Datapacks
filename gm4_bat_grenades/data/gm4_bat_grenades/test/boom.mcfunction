# @template gm4:test_box
# @dummy ~3 ~1 ~3
# @timeout 200

summon bat ~3 ~2 ~3 {Tags:[gm4_test_bat]}

await not entity @e[tag=gm4_test_bat,distance=..10]
