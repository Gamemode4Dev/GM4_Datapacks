# applies a set bonus and displays some particles
# @s = player who's inventory changed and now has full health_boost armor
# at @s
# run from player/armor/apply_set_bonus

# attribute
attribute @s minecraft:generic.max_health modifier add minecraft:591ea7a8-12f8-413f-80c9-9f80702c961b 4 add_value

# sounds and visuals
particle minecraft:entity_effect{color:[0.973,0.141,0.137,1.0]} ~.3 ~.8 ~.3 0 0 0 1 1
particle minecraft:entity_effect{color:[0.973,0.141,0.137,1.0]} ~.3 ~.8 ~-.3 0 0 0 1 1
particle minecraft:entity_effect{color:[0.973,0.141,0.137,1.0]} ~-.3 ~.8 ~-.3 0 0 0 1 1
particle minecraft:entity_effect{color:[0.973,0.141,0.137,1.0]} ~-.3 ~.8 ~.3 0 0 0 1 1
particle minecraft:entity_effect{color:[0.973,0.141,0.137,1.0]} ^ ^1.2 ^0.1 0 0 0 1 1
particle minecraft:entity_effect{color:[0.973,0.141,0.137,1.0]} ^ ^1.2 ^-0.1 0 0 0 1 1
particle minecraft:entity_effect{color:[0.973,0.141,0.137,1.0]} ^0.1 ^1.2 ^ 0 0 0 1 1
particle minecraft:entity_effect{color:[0.973,0.141,0.137,1.0]} ^-0.1 ^1.2 ^ 0 0 0 1 1
playsound minecraft:block.beacon.power_select player @a[distance=..4] ~ ~ ~ 0.2 1.65
