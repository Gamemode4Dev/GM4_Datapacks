# update mainhand with data in storage
# @s = player holding the item
# at unspecified
# run from weapon/convert_netherite
# run from weapon/update_sharpness
# run from weapon/modifier/swift/activate

$item modify entity @s weapon.mainhand {function:"minecraft:set_components",components:$(components)}
