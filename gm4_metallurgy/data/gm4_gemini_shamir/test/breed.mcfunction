# @template gm4:test_platform
# @dummy ~1.5 ~1 ~0.5

summon pig ~0.5 ~1 ~2.5 {Tags:[gm4_test_gemini_1]}
summon pig ~2.5 ~1 ~2.5 {Tags:[gm4_test_gemini_2]}

item replace entity @s weapon.offhand with minecraft:iron_hoe[custom_data={gm4_metallurgy:{has_shamir:1b,active_shamir:"gemini"}}]
item replace entity @s weapon.mainhand with minecraft:carrot 2

dummy @s use entity @e[type=pig,distance=..4,tag=gm4_test_gemini_1,limit=1]
dummy @s use entity @e[type=pig,distance=..4,tag=gm4_test_gemini_2,limit=1]

await delay 4s

scoreboard objectives add gm4_test dummy
execute store result score $babies gm4_test if entity @e[type=pig,distance=..4,predicate=gm4_gemini_shamir:test_is_baby]
assert score $babies gm4_test matches 2
