# @s=bottled_vex item in zauber cauldron
# at @s align xyz of cauldron
# run from blurry_wormhole/prepare

# pull coordinates from bottled_vex into scoreboard
execute store result score x gm4_zc_data run data get entity @s Item.tag.gm4_zauber_cauldrons.cauldron_pos.x
execute store result score y gm4_zc_data run data get entity @s Item.tag.gm4_zauber_cauldrons.cauldron_pos.y
execute store result score z gm4_zc_data run data get entity @s Item.tag.gm4_zauber_cauldrons.cauldron_pos.z

# pull dimension
data modify storage gm4_zauber_cauldrons:temp/item/wormhole/common Item.tag.gm4_zauber_cauldrons.cauldron_pos.dimension set from entity @s Item.tag.gm4_zauber_cauldrons.cauldron_pos.dimension
