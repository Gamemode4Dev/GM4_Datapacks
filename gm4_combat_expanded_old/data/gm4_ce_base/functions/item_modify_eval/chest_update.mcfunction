# update chestplate with data in storage
# @s = player wearing the item
# at unspecified
# run from armor/modifier/type/convert/update
# run from armor/modifier/type/link/process/set_max_health
# run from armor/slot/chest

$item modify entity @s armor.chest {function:"minecraft:set_components",components:$(components)}
