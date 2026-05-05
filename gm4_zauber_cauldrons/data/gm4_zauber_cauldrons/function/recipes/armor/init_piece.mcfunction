# @s = result item
# at center of cauldron block
# run from recipes/armor/{{piece}}/{{flavor}}
# with $components: the initial item components of the armor piece

$data modify entity @s Item.components merge value $(components)
