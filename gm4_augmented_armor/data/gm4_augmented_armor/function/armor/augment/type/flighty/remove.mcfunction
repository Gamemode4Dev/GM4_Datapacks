
scoreboard players set $change gm4_aa_data 1

# modify attribute
execute if score $slot gm4_aa_data matches 0 run data modify storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:head.dynamic"}].amount set value 0
execute if score $slot gm4_aa_data matches 1 run data modify storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:chest.dynamic"}].amount set value 0
execute if score $slot gm4_aa_data matches 2 run data modify storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:legs.dynamic"}].amount set value 0
execute if score $slot gm4_aa_data matches 3 run data modify storage gm4_augmented_armor:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_augmented_armor:feet.dynamic"}].amount set value 0

# set stacks to 0
data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.stacks set value 0

# set timer so this is not checked again
data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.timer set value -1

# use lib_lore to remove the old current bonus text
data modify storage gm4_lore:temp Source set from storage gm4_augmented_armor:temp components."minecraft:lore"
data modify storage gm4_lore:temp Target set value '{"color":"gray","fallback":"%s Augment:","italic":false,"translate":"item.gm4.augmented_armor.lore.augment","with":[{"fallback":"Flighty","translate":"item.gm4.augmented_armor.augment.flighty"}]}'
scoreboard players set $start gm4_lore 3
function #gm4_lore:remove

# use lib_lore to update the current bonus text
data modify storage gm4_lore:temp Target set value '{"color":"gray","fallback":"%s Augment:","italic":false,"translate":"item.gm4.augmented_armor.lore.augment","with":[{"fallback":"Flighty","translate":"item.gm4.augmented_armor.augment.flighty"}]}'
data modify storage gm4_lore:temp Input set value ['{"color":"dark_gray","fallback":"Currently %s","italic":true,"translate":"item.gm4.augmented_armor.lore.flighty_3","with":[{"color":"blue","italic":true,"translate":"attribute.modifier.equals.1","with":["0",{"translate":"attribute.name.movement_speed"}]}]}']
scoreboard players set $start gm4_lore 3
function #gm4_lore:insert

# update
data modify storage gm4_augmented_armor:temp components."minecraft:lore" set from storage gm4_lore:temp Source
