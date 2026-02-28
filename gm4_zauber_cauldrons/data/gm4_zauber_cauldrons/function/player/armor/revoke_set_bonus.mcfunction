# revokes set bonuses from players that don't have a full set of zauber armor anymore 
# @s = player who's inventory changed and they don't have zauber armor on anymore, but used to have zauber armor on
# at @s
# run from advancement equipment/unequipped_armor

# revoke advancements
advancement revoke @s only gm4_zauber_cauldrons:equipment/has_full_armor
advancement revoke @s only gm4_zauber_cauldrons:equipment/unequipped_armor

# revoke set bonuses
attribute @s minecraft:armor modifier remove gm4_zauber_cauldrons:armor_boost
attribute @s minecraft:attack_damage modifier remove gm4_zauber_cauldrons:attack_boost
attribute @s minecraft:max_health modifier remove gm4_zauber_cauldrons:health_boost
attribute @s minecraft:movement_speed modifier remove gm4_zauber_cauldrons:speed_boost

# sound
playsound minecraft:block.beacon.deactivate player @a[distance=..4] ~ ~ ~ 0.3 0.1
