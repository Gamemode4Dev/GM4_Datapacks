# applies a set bonus and displays some particles
# @s = player who's inventory changed and now has full attack_boost armor
# at @s
# run from player/armor/apply_set_bonus

# attribute
attribute @s minecraft:generic.attack_damage modifier add 81b8020f-c7f4-41d9-b99b-7a8d6b2d5a90 gm4_zauber_cauldrons.armor.set_bonus.attack_boost 1 add

# sounds and visuals
# count for particles must be 0 for RGB
particle minecraft:entity_effect ~.3 ~.8 ~.3 0.6 0.271 0.227 1 0
particle minecraft:entity_effect ~.3 ~.8 ~-.3 0.6 0.271 0.227 1 0
particle minecraft:entity_effect ~-.3 ~.8 ~-.3 0.6 0.271 0.227 1 0
particle minecraft:entity_effect ~-.3 ~.8 ~.3 0.6 0.271 0.227 1 0
particle minecraft:entity_effect ^ ^1.2 ^0.1 0.6 0.271 0.227 1 0
particle minecraft:entity_effect ^ ^1.2 ^-0.1 0.6 0.271 0.227 1 0
particle minecraft:entity_effect ^0.1 ^1.2 ^ 0.6 0.271 0.227 1 0
particle minecraft:entity_effect ^-0.1 ^1.2 ^ 0.6 0.271 0.227 1 0
playsound minecraft:block.beacon.power_select player @a[distance=..4] ~ ~ ~ 0.2 1.6
