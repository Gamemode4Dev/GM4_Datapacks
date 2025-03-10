# Action for reeled allay
# @s = allay
# at @s
# run from gm4_reeling_rods:fishing/allay/adv

data modify storage gm4_reeling_rods:temp item_data.Item set from entity @s HandItems[0]
data modify entity @s HandItems[0] set value {}
function gm4_reeling_rods:separate
