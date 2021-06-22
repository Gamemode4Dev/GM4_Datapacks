# @s = newly created wormhole item
# at @s align xyz of cauldron
# run from precise_wormhole/prepare and blurry_wormhole/prepare

# copy data onto item
data modify entity @s Item merge from storage gm4_zauber_cauldrons:temp/item/wormhole/common Item

# remove flag
tag @s remove gm4_zc_new_wormhole_bottle
