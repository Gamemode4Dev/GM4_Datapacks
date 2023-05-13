# store weapon used to strike in storage and process
# @s = player that used a weapon with modifier
# at @s
# run from advancement used_strike_weapon

advancement revoke @s only gm4_combat_expanded:used_strike_weapon

# store weapon item to shulker box and put in storage
item replace block 29999998 1 7134 container.0 from entity @s weapon.mainhand
data modify storage gm4_combat_expanded:temp tag set from block 29999998 1 7134 Items[{Slot:0b}].tag
# get modifier and current sharpness from storage
execute store result score $modifier gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.modifier
execute store result score $current_sharpness gm4_ce_data run data get storage gm4_combat_expanded:temp tag.Enchantments[{id:"minecraft:sharpness"}].lvl

# identify items that are unidentified
execute if score $modifier gm4_ce_data matches 0 run function gm4_combat_expanded:weapon/identify/pick_mod

# process items with an active modifier
execute if score $modifier gm4_ce_data matches 101.. run function gm4_combat_expanded:weapon/check_modifier

# check sharpness level
execute store result score $stored_sharpness gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.sharpness
execute unless score $stored_sharpness gm4_ce_data = $current_sharpness gm4_ce_data run function gm4_combat_expanded:weapon/update_sharpness

# check netherite conversion
execute if predicate gm4_combat_expanded:technical/convert_netherite/weapon run function gm4_combat_expanded:weapon/convert_netherite
