# update boots with data in storage
# @s = player wearing the item
# at unspecified
# run from armor/modifier/type/convert/update
# run from armor/modifier/type/link/process/set_max_health
# run from armor/slot/feet

$item modify entity @s armor.feet {function:"minecraft:set_components",components:$(components)}
