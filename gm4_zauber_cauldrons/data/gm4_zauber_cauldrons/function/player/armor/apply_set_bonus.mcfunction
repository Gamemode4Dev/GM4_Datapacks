# checks the players armor set for zauber flavor
# @s = player who's inventory changed and now has full armor
# at @s
# run from advancement equipment/has_full_armor

# advancement is not revoked as it is used as a flag for revoke set bonus in
# advancement equipment/unequipped_armor

# count flavors
# note: also checking for the armor amount because all zauber armor has +3 armor by default
execute store result score $armor_boost gm4_zc_data if items entity @s armor.* *[custom_data~{gm4_zauber_cauldrons:{item:"zauber_armor"}},attribute_modifiers~{modifiers:{contains:[{attribute:"minecraft:armor",amount:1d}]}}]
execute store result score $attack_boost gm4_zc_data if items entity @s armor.* *[custom_data~{gm4_zauber_cauldrons:{item:"zauber_armor"}},attribute_modifiers~{modifiers:{contains:[{attribute:"minecraft:attack_damage"}]}}]
execute store result score $health_boost gm4_zc_data if items entity @s armor.* *[custom_data~{gm4_zauber_cauldrons:{item:"zauber_armor"}},attribute_modifiers~{modifiers:{contains:[{attribute:"minecraft:max_health"}]}}]
execute store result score $speed_boost gm4_zc_data if items entity @s armor.* *[custom_data~{gm4_zauber_cauldrons:{item:"zauber_armor"}},attribute_modifiers~{modifiers:{contains:[{attribute:"minecraft:movement_speed"}]}}]

# check how many of the most prevalent flavor there are
scoreboard players set $comparison gm4_zc_data 0
scoreboard players operation $comparison gm4_zc_data > $armor_boost gm4_zc_data
scoreboard players operation $comparison gm4_zc_data > $attack_boost gm4_zc_data
scoreboard players operation $comparison gm4_zc_data > $health_boost gm4_zc_data
scoreboard players operation $comparison gm4_zc_data > $speed_boost gm4_zc_data

# give set boosts for the most prevalent flavors
execute if score $comparison gm4_zc_data = $armor_boost gm4_zc_data run function gm4_zauber_cauldrons:player/armor/set_bonus/armor_boost
execute if score $comparison gm4_zc_data = $attack_boost gm4_zc_data run function gm4_zauber_cauldrons:player/armor/set_bonus/attack_boost
execute if score $comparison gm4_zc_data = $health_boost gm4_zc_data run function gm4_zauber_cauldrons:player/armor/set_bonus/health_boost
execute if score $comparison gm4_zc_data = $speed_boost gm4_zc_data run function gm4_zauber_cauldrons:player/armor/set_bonus/speed_boost

# reset fake players
scoreboard players reset $armor_boost gm4_zc_data
scoreboard players reset $attack_boost gm4_zc_data
scoreboard players reset $health_boost gm4_zc_data
scoreboard players reset $speed_boost gm4_zc_data
