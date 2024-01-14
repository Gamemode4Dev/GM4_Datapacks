# revokes set bonuses from players that don't have a full set of zauber armor anymore 
# @s = player who's inventory changed and they don't have zauber armor on anymore, but used to have zauber armor on
# at @s
# run from advancement equipment/unequipped_armor

# revoke advancements
advancement revoke @s only gm4_zauber_cauldrons:equipment/has_full_armor
advancement revoke @s only gm4_zauber_cauldrons:equipment/unequipped_armor

# revoke set bonuses
attribute @s minecraft:generic.armor modifier remove b29259d8-1ac4-4791-9552-b944910cd435
attribute @s minecraft:generic.attack_damage modifier remove 81b8020f-c7f4-41d9-b99b-7a8d6b2d5a90
attribute @s minecraft:generic.max_health modifier remove 591ea7a8-12f8-413f-80c9-9f80702c961b
attribute @s minecraft:generic.movement_speed modifier remove 7a7ff3d6-8e01-4051-99fa-94c40b12fb9a

# sound
playsound minecraft:block.beacon.deactivate player @a[distance=..4] ~ ~ ~ 0.3 0.1
