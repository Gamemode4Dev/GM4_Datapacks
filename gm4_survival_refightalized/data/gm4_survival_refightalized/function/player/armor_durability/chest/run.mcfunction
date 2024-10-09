
# if unbreakable don't run
execute if data storage gm4_survival_refightalized:temp Items[{Slot:1b}].components."minecraft:unbreakable" run return 0

# calculate incoming damage based on unbreaking
execute store result score $unbreaking_level gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:1b}].components."minecraft:enchantments".levels."minecraft:unbreaking"
scoreboard players add $unbreaking_level gm4_sr_data 1
scoreboard players set $damage_chance gm4_sr_data 100
scoreboard players operation $damage_chance gm4_sr_data /= $unbreaking_level gm4_sr_data
scoreboard players set $damage_opportunities gm4_sr_data 1
execute store result score $incoming_damage gm4_sr_data run loot spawn 29999998 1 7133 loot gm4_survival_refightalized:technical/roll_damage
# TODO: remove (spigot bug)
execute positioned 29999998 1 7133 run kill @e[type=item,distance=..2]

# if no damage is going to be applied cancel function
execute unless score $incoming_damage gm4_sr_data matches 1.. run return 0

# find the total durability of this item
execute store result score $total_durability gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:1b}].components."minecraft:max_damage"
execute if score $total_durability gm4_sr_data matches 0 store result score $total_durability gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_augmented_armor.durability
execute if score $total_durability gm4_sr_data matches 0 store result score $total_durability gm4_sr_data run function gm4_survival_refightalized:player/armor_durability/chest/find_durability
execute if score $total_durability gm4_sr_data matches 0 run return 0

# add incoming damage to the current damage
execute store result score $current_damage gm4_sr_data run data get storage gm4_survival_refightalized:temp Items[{Slot:1b}].components."minecraft:damage"
scoreboard players operation $current_damage gm4_sr_data += $incoming_damage gm4_sr_data
execute if score $current_damage gm4_sr_data > $total_durability gm4_sr_data run return run function gm4_survival_refightalized:player/armor_durability/chest/break

# apply to armor
execute store result storage gm4_survival_refightalized:temp set.damage int 1 run scoreboard players get $current_damage gm4_sr_data
function gm4_survival_refightalized:player/armor_durability/chest/eval with storage gm4_survival_refightalized:temp set

# cleanup
data remove storage gm4_survival_refightalized:temp set
