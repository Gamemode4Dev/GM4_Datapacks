# update leggings with data in storage
# @s = player wearing the item
# at unspecified
# run from armor/augment/type/hearty/update
# run from armor/augment/type/link/process/set_max_health
# run from armor/slot/legs

$item modify entity @s armor.legs {function:"minecraft:set_components",components:$(components)}
function gm4_augmented_armor:armor/silence_equip_sound
