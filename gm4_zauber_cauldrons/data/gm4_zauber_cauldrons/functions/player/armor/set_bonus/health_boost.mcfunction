# applies a set bonus and displays some particles
# @s = player who's inventory changed and now has full health_boost armor
# at @s
# run from player/armor/apply_set_bonus

# attribute
attribute @s minecraft:generic.max_health modifier add 591ea7a8-12f8-413f-80c9-9f80702c961b gm4_zauber_cauldrons.armor.set_bonus.health_boost 4 add

# sounds and visuals
# count for particles must be 0 for RGB
particle minecraft:entity_effect ~.3 ~.8 ~.3 0.973 0.141 0.137 1 0
particle minecraft:entity_effect ~.3 ~.8 ~-.3 0.973 0.141 0.137 1 0
particle minecraft:entity_effect ~-.3 ~.8 ~-.3 0.973 0.141 0.137 1 0
particle minecraft:entity_effect ~-.3 ~.8 ~.3 0.973 0.141 0.137 1 0
particle minecraft:entity_effect ^ ^1.2 ^0.1 0.973 0.141 0.137 1 0
particle minecraft:entity_effect ^ ^1.2 ^-0.1 0.973 0.141 0.137 1 0
particle minecraft:entity_effect ^0.1 ^1.2 ^ 0.973 0.141 0.137 1 0
particle minecraft:entity_effect ^-0.1 ^1.2 ^ 0.973 0.141 0.137 1 0
playsound minecraft:block.beacon.power_select player @a[distance=..4] ~ ~ ~ 0.2 1.65
