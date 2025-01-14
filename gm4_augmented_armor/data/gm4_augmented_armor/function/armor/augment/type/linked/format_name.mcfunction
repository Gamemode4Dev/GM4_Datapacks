# format the link name to be purple and non-italic
# @s = player wearing link armor
# at @s
# run from armor/augment/type/linked/check

scoreboard players set $change gm4_aa_data 1

# replace the name with a formatted version
$data modify storage gm4_augmented_armor:temp components."minecraft:custom_name" set value '{"color":"light_purple","italic":false,"text":$(name)}'
data modify storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.augment.stored_name set from storage gm4_augmented_armor:temp components."minecraft:custom_name"

# use lib_lore to remove the linked text
data modify storage gm4_lore:temp Source set from storage gm4_augmented_armor:temp components."minecraft:lore"
data modify storage gm4_lore:temp Target set value '{"color":"gray","fallback":"%s Augment:","italic":false,"translate":"item.gm4.augmented_armor.lore.augment","with":[{"fallback":"Linked","translate":"item.gm4.augmented_armor.augment.linked"}]}'
scoreboard players set $start gm4_lore 3
function #gm4_lore:remove

# use lib_lore to update the linked text
data modify storage gm4_lore:temp Target set value '{"color":"gray","fallback":"%s Augment:","italic":false,"translate":"item.gm4.augmented_armor.lore.augment","with":[{"fallback":"Linked","translate":"item.gm4.augmented_armor.augment.linked"}]}'
$data modify storage gm4_lore:temp Input set value ['{"color":"dark_gray","fallback":"Link: %s","italic":true,"translate":"item.gm4.augmented_armor.lore.linked_3","with":[{"color":"blue","italic":true,"text":$(name)}]}']
scoreboard players set $start gm4_lore 3
function #gm4_lore:insert

# update
data modify storage gm4_augmented_armor:temp components."minecraft:lore" set from storage gm4_lore:temp Source

# cleanup
data remove storage gm4_augmented_armor:temp format_name_args
