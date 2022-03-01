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
execute if score $comparison gm4_zc_data = $armor_boost gm4_zc_data run function gm4_zauber_cauldrons:player/armor/set_bonus/armor_boost
execute if score $comparison gm4_zc_data = $attack_boost gm4_zc_data run function gm4_zauber_cauldrons:player/armor/set_bonus/attack_boost
execute if score $comparison gm4_zc_data = $health_boost gm4_zc_data run function gm4_zauber_cauldrons:player/armor/set_bonus/health_boost
execute if score $comparison gm4_zc_data = $speed_boost gm4_zc_data run function gm4_zauber_cauldrons:player/armor/set_bonus/speed_boost

# reset storage and fake players
data remove storage gm4_zauber_cauldrons:temp/player/inventory gm4_zauber_cauldrons
scoreboard players reset $armor_boost gm4_zc_data
scoreboard players reset $attack_boost gm4_zc_data
scoreboard players reset $health_boost gm4_zc_data
scoreboard players reset $speed_boost gm4_zc_data
