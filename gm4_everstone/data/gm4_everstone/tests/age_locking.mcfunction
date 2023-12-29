# @template gm4:test_tube

summon pig ~1.5 ~1 ~1.5 {Age:-40}
loot spawn ~1.5 ~2 ~1.5 loot gm4_everstone:everstone

await not entity @e[type=item,distance=..4]

scoreboard objectives add gm4_test dummy
execute store result score $age gm4_test run data get entity @e[type=pig,distance=..3,limit=1] Age
assert score $age gm4_test matches ..-1

await delay 3s

execute store result score $age gm4_test run data get entity @e[type=pig,distance=..3,limit=1] Age
assert score $age gm4_test matches ..-1
