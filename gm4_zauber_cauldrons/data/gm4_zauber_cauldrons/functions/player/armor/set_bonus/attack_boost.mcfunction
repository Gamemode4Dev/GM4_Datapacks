# applies a set bonus and displays some particles
# @s = player who's inventory changed and now has full attack_boost armor
# at @s
# run from player/armor/apply_set_bonus

# attribute
attribute @s minecraft:generic.attack_damage modifier add 81b8020f-c7f4-41d9-b99b-7a8d6b2d5a90 gm4_zauber_cauldrons.armor.set_bonus.attack_boost 1 add_value

# sounds and visuals
particle minecraft:entity_effect{color:[0.988,0.773,0.000,1.0]} ~.3 ~.8 ~.3 0 0 0 1 1
particle minecraft:entity_effect{color:[0.988,0.773,0.000,1.0]} ~.3 ~.8 ~-.3 0 0 0 1 1
particle minecraft:entity_effect{color:[0.988,0.773,0.000,1.0]} ~-.3 ~.8 ~-.3 0 0 0 1 1
particle minecraft:entity_effect{color:[0.988,0.773,0.000,1.0]} ~-.3 ~.8 ~.3 0 0 0 1 1
particle minecraft:entity_effect{color:[0.988,0.773,0.000,1.0]} ^ ^1.2 ^0.1 0 0 0 1 1
particle minecraft:entity_effect{color:[0.988,0.773,0.000,1.0]} ^ ^1.2 ^-0.1 0 0 0 1 1
particle minecraft:entity_effect{color:[0.988,0.773,0.000,1.0]} ^0.1 ^1.2 ^ 0 0 0 1 1
particle minecraft:entity_effect{color:[0.988,0.773,0.000,1.0]} ^-0.1 ^1.2 ^ 0 0 0 1 1
playsound minecraft:block.beacon.power_select player @a[distance=..4] ~ ~ ~ 0.2 1.6
