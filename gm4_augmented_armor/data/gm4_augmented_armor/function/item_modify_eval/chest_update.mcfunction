# update chestplate with data in storage
# @s = player wearing the item
# at unspecified
# run from armor/augment/type/convert/update
# run from armor/augment/type/link/process/set_max_health
# run from armor/slot/chest

$item modify entity @s armor.chest {function:"minecraft:set_components",components:$(components)}
