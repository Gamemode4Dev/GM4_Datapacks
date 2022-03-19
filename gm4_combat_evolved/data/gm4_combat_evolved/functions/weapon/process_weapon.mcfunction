# run from advancement used_strike_weapon
# @s = player that used a weapon with modifier
# at @s

advancement revoke @s only gm4_combat_evolved:used_strike_weapon

# store weapon item to shulker box and put in storage
item replace block 29999998 1 7134 container.0 from entity @s weapon.mainhand
data modify storage gm4_combat_evolved:temp tag set from block 29999998 1 7134 Items[{Slot:0b}].tag
# get modifier from storage
execute store result score $modifier gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.modifier

# identify items that are unidentified
execute if score $modifier gm4_ce_data matches 0 run function gm4_combat_evolved:weapon/identify/pick_mod

# process items with an active modifier
execute if score $modifier gm4_ce_data matches 101.. run function gm4_combat_evolved:weapon/check_modifier

# check sharpness level
execute store result score $current_sharpness gm4_ce_data run data get storage gm4_combat_evolved:temp tag.Enchantments[{id:"minecraft:sharpness"}].lvl
execute store result score $stored_sharpness gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.sharpness
execute unless score $stored_sharpness gm4_ce_data = $current_sharpness gm4_ce_data run function gm4_combat_evolved:weapon/update_sharpness
