# applies a set bonus and displays some particles
# @s = player who's inventory changed and now has full speed_boost armor
# at @s
# run from player/armor/apply_set_bonus

# attribute
attribute @s minecraft:movement_speed modifier add gm4_zauber_cauldrons:speed_boost 0.12 add_multiplied_base

# sounds and visuals
particle minecraft:entity_effect{color:[0.486,0.686,0.776,1.0]} ~.3 ~.8 ~.3 0 0 0 1 1
particle minecraft:entity_effect{color:[0.486,0.686,0.776,1.0]} ~.3 ~.8 ~-.3 0 0 0 1 1
particle minecraft:entity_effect{color:[0.486,0.686,0.776,1.0]} ~-.3 ~.8 ~-.3 0 0 0 1 1
particle minecraft:entity_effect{color:[0.486,0.686,0.776,1.0]} ~-.3 ~.8 ~.3 0 0 0 1 1
particle minecraft:entity_effect{color:[0.486,0.686,0.776,1.0]} ^ ^1.2 ^0.1 0 0 0 1 1
particle minecraft:entity_effect{color:[0.486,0.686,0.776,1.0]} ^ ^1.2 ^-0.1 0 0 0 1 1
particle minecraft:entity_effect{color:[0.486,0.686,0.776,1.0]} ^0.1 ^1.2 ^ 0 0 0 1 1
particle minecraft:entity_effect{color:[0.486,0.686,0.776,1.0]} ^-0.1 ^1.2 ^ 0 0 0 1 1
playsound minecraft:block.beacon.power_select player @a[distance=..4] ~ ~ ~ 0.2 1.7
