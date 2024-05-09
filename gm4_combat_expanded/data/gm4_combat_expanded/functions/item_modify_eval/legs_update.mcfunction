# update leggings with data in storage
# @s = player wearing the item
# at unspecified
# run from armor/modifier/type/convert/update
# run from armor/modifier/type/link/process/set_max_health
# run from armor/slot/legs

$item modify entity @s armor.legs {function:"minecraft:set_components",components:$(components)}
