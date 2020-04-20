# @s=newly spawned potion item
# at @s of cauldron
# run from craft

data modify entity @s Item merge from storage gm4_zauber_cauldrons:temp/item/potion/common Item
tag @s remove gm4_zc_new_potion
