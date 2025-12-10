# @template gm4:test_platform
# @dummy ~1 ~1 ~1
# @timeout 200

summon bat ~1 ~2 ~1 {Tags:[gm4_test_bat]}

await not entity @e[tag=gm4_test_bat,dx=2,dy=2,dz=2]
