# store weapon used to strike in storage and process
# @s = player that used a weapon with modifier
# at @s
advancement revoke @s only gm4_combat_expanded:used_strike_weapon
# run from advancement used_giant_weapon

# don't trigger this scoreboard multiple times
scoreboard players set @s gm4_ce_sword_hit_triggered 1

# store weapon item to shulker box and put in storage
item replace block 29999998 1 7134 container.0 from entity @s weapon.mainhand
data modify storage gm4_combat_expanded:temp components set from block 29999998 1 7134 Items[{Slot:0b}].components
# get modifier and current sharpness from storage
execute store result score $modifier gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.modifier
execute store result score $current_sharpness gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:enchantments".levels."minecraft:sharpness"

# process items with an active modifier
execute if score $modifier gm4_ce_data matches 101.. run function gm4_combat_expanded:weapon/check_modifier

# check sharpness level
execute store result score $stored_sharpness gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.sharpness
execute unless score $stored_sharpness gm4_ce_data = $current_sharpness gm4_ce_data run function gm4_combat_expanded:weapon/update_sharpness

# check netherite conversion
execute if predicate gm4_combat_expanded:technical/convert_netherite/weapon run function gm4_combat_expanded:weapon/convert_netherite

# advancement
advancement grant @s only gm4:combat_expanded_identify

data remove block 29999998 1 7134 Items
