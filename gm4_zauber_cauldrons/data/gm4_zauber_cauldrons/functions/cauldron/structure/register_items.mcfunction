# @s = boiling cauldron with valid structure
# at @s align xyz
# run from cauldron/structure/valid
# counts items in cauldron and virtualizes them

# count item
scoreboard players add @e[type=marker,tag=gm4_zauber_cauldron,tag=gm4_current_zauber_cauldron,limit=1] gm4_zc_fullness 1

# register item
data modify storage gm4_zauber_cauldrons:temp/cauldron/ingredients Item set from entity @s Item
execute unless data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Item.tag.gm4_zauber_cauldrons.item run data modify storage gm4_zauber_cauldrons:temp/cauldron/ingredients Item.tag.gm4_zauber_cauldrons.item set from entity @s Item.id
data modify storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items append from storage gm4_zauber_cauldrons:temp/cauldron/ingredients Item
