# stack the attack speed
# @s = player wielding the weapon
# at @s
# run from weapon/check_modifier

execute store result score $timeout gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.timeout
execute store result score $curr_time gm4_ce_data run time query gametime

# get item level, x100 because x10 lead to rounding errors
execute store result score $curr_level gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{name:"gm4_combat_expanded"}].amount 100
execute store result score $base_level gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{name:"gm4_ce_base_attack_speed"}].amount 100

execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.level 10
scoreboard players operation $curr_level gm4_ce_data += $level gm4_ce_data

scoreboard players set $max_level gm4_ce_data 400
scoreboard players operation $max_level gm4_ce_data -= $base_level gm4_ce_data
scoreboard players operation $curr_level gm4_ce_data < $max_level gm4_ce_data

execute if score $curr_time gm4_ce_data > $timeout gm4_ce_data run scoreboard players set $curr_level gm4_ce_data 0

execute store result storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{name:"gm4_combat_expanded"}].amount float 0.01 run scoreboard players get $curr_level gm4_ce_data
execute store result storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.timeout int 1 run scoreboard players add $curr_time gm4_ce_data 121

# get digits seperate
scoreboard players operation $curr_level gm4_ce_data += $base_level gm4_ce_data
scoreboard players add $curr_level gm4_ce_data 5
scoreboard players operation $curr_level gm4_ce_data /= #10 gm4_ce_data
scoreboard players operation $atkspeed_10 gm4_ce_data = $curr_level gm4_ce_data
scoreboard players operation $atkspeed_10 gm4_ce_data /= #10 gm4_ce_data
scoreboard players operation $atkspeed_01 gm4_ce_data = $curr_level gm4_ce_data
scoreboard players operation $atkspeed_01 gm4_ce_data %= #10 gm4_ce_data

# get new lore lines
# slots 0 is reserved for the weapon, slot 1 is reserved for the modifier
loot replace block 29999998 1 7134 container.2 loot gm4_combat_expanded:technical/swift_lore

# update lore
data modify storage gm4_lore:temp Source set from storage gm4_combat_expanded:temp components."minecraft:lore"
data modify storage gm4_lore:temp Target set value '{"color":"gray","italic":false,"translate":"item.modifiers.mainhand"}'
scoreboard players set $start gm4_lore 2
function #gm4_lore:remove
data modify storage gm4_lore:temp Input set from block 29999998 1 7134 Items[{Slot:2b}].components."minecraft:lore"
scoreboard players set $start gm4_lore 1
function #gm4_lore:insert
data modify storage gm4_combat_expanded:temp components."minecraft:lore" set from storage gm4_lore:temp Source

function gm4_combat_expanded:item_modify_eval/mainhand_update with storage gm4_combat_expanded:temp
