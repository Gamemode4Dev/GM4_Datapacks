
scoreboard players set $change gm4_aa_data 1

# add 1 to stacks unless it is already 10
execute store result score $stacks gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.stacks
execute unless score $stacks gm4_aa_data matches 10.. run scoreboard players add $stacks gm4_aa_data 1
execute store result storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.stacks int 1 run scoreboard players get $stacks gm4_aa_data

# set timer to 12 seconds in the future
execute store result score $timer gm4_aa_data run time query gametime
execute store result storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.timer int 1 run scoreboard players add $timer gm4_aa_data 240

# multiply level by amount of stacks
execute store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0]
scoreboard players operation $level gm4_aa_data *= $stacks gm4_aa_data

# modify attribute
execute if score $slot gm4_aa_data matches 0 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:head.dynamic"}].amount float 0.0001 run scoreboard players get $level gm4_aa_data
execute if score $slot gm4_aa_data matches 1 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:chest.dynamic"}].amount float 0.0001 run scoreboard players get $level gm4_aa_data
execute if score $slot gm4_aa_data matches 2 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:legs.dynamic"}].amount float 0.0001 run scoreboard players get $level gm4_aa_data
execute if score $slot gm4_aa_data matches 3 store result storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:feet.dynamic"}].amount float 0.0001 run scoreboard players get $level gm4_aa_data

# use lib_lore to remove the old current bonus text
data modify storage gm4_lore:temp Source set from storage gm4_augmented_armor:temp components."minecraft:lore"
data modify storage gm4_lore:temp Target set value '{"color":"gray","fallback":"%s Augment:","italic":false,"translate":"item.gm4.augmented_armor.lore.augment","with":[{"fallback":"Flighty","translate":"item.gm4.augmented_armor.augment.flighty"}]}'
scoreboard players set $start gm4_lore 3
function #gm4_lore:remove

# use lib_lore to update the current bonus text
data modify storage gm4_lore:temp Target set value '{"color":"gray","fallback":"%s Augment:","italic":false,"translate":"item.gm4.augmented_armor.lore.augment","with":[{"fallback":"Flighty","translate":"item.gm4.augmented_armor.augment.flighty"}]}'
execute store result storage gm4_augmented_armor:temp stat.amount float 0.01 run scoreboard players get $level gm4_aa_data
function gm4_augmented_armor:armor/augment/type/flighty/eval_lore with storage gm4_augmented_armor:temp stat
data remove storage gm4_augmented_armor:temp stat.amount
scoreboard players set $start gm4_lore 3
function #gm4_lore:insert

# update
data modify storage gm4_augmented_armor:temp components."minecraft:lore" set from storage gm4_lore:temp Source
