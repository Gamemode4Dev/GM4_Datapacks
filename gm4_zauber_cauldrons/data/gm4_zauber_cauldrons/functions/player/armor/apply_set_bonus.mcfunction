# checks the players armor set for zauber flavor
# @s = player who's inventory changed and now has full armor
# at @s
# run from advancement equipment/has_full_armor

# advancement is not revoked as it is used as a flag for revoke set bonus in
# advancement equipment/unequipped_armor

# count flavors
data modify storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.Items set from entity @s Inventory
data modify storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.Armor append from storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.Items[{Slot:100b}]
data modify storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.Armor append from storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.Items[{Slot:101b}]
data modify storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.Armor append from storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.Items[{Slot:102b}]
data modify storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.Armor append from storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.Items[{Slot:103b}]
data modify storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.boosts.armor append from storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.Armor[{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Name:"gm4_zauber_cauldrons.armor.armor_boost"}]}}]
data modify storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.boosts.attack append from storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.Armor[{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Name:"gm4_zauber_cauldrons.armor.attack_boost"}]}}]
data modify storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.boosts.health append from storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.Armor[{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Name:"gm4_zauber_cauldrons.armor.health_boost"}]}}]
data modify storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.boosts.speed append from storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.Armor[{tag:{gm4_zauber_cauldrons:{item:"zauber_armor"},AttributeModifiers:[{Name:"gm4_zauber_cauldrons.armor.speed_boost"}]}}]
execute store result score $armor_boost gm4_zc_data run data get storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.boosts.armor
execute store result score $attack_boost gm4_zc_data run data get storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.boosts.attack
execute store result score $health_boost gm4_zc_data run data get storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.boosts.health
execute store result score $speed_boost gm4_zc_data run data get storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons.boosts.speed

# check how many of the most prevalent flavor there are
scoreboard players set $comparison gm4_zc_data 0
scoreboard players operation $comparison gm4_zc_data > $armor_boost gm4_zc_data
scoreboard players operation $comparison gm4_zc_data > $attack_boost gm4_zc_data
scoreboard players operation $comparison gm4_zc_data > $health_boost gm4_zc_data
scoreboard players operation $comparison gm4_zc_data > $speed_boost gm4_zc_data

# give set boosts for the most prevalent flavors
execute if score $comparison gm4_zc_data = $armor_boost gm4_zc_data run attribute @s minecraft:generic.armor modifier add b29259d8-1ac4-4791-9552-b944910cd435 gm4_zauber_cauldrons.armor.set_bonus.armor_boost 1 add
execute if score $comparison gm4_zc_data = $attack_boost gm4_zc_data run attribute @s minecraft:generic.attack_damage modifier add 81b8020f-c7f4-41d9-b99b-7a8d6b2d5a90 gm4_zauber_cauldrons.armor.set_bonus.attack_boost 1 add
execute if score $comparison gm4_zc_data = $health_boost gm4_zc_data run attribute @s minecraft:generic.max_health modifier add 591ea7a8-12f8-413f-80c9-9f80702c961b gm4_zauber_cauldrons.armor.set_bonus.health_boost 4 add
execute if score $comparison gm4_zc_data = $speed_boost gm4_zc_data run attribute @s minecraft:generic.movement_speed modifier add 7a7ff3d6-8e01-4051-99fa-94c40b12fb9a gm4_zauber_cauldrons.armor.set_bonus.speed_boost 0.12 multiply_base

# reset storage and fake players
data remove storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons
#scoreboard players reset $armor_boost gm4_zc_data
#scoreboard players reset $attack_boost gm4_zc_data
#scoreboard players reset $health_boost gm4_zc_data
#scoreboard players reset $speed_boost gm4_zc_data
