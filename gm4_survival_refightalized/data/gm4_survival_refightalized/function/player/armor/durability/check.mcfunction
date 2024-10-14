# set damage on armor item
# @s = player wearing the item
# at unspecified
# 

# get item data
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_survival_refightalized:temp Items set from block 29999998 1 7134 Items

execute if items block 29999998 1 7134 container.0 * run function gm4_survival_refightalized:player/armor/durability/head/run
execute if items block 29999998 1 7134 container.1 * run function gm4_survival_refightalized:player/armor/durability/chest/run
execute if items block 29999998 1 7134 container.2 * run function gm4_survival_refightalized:player/armor/durability/legs/run
execute if items block 29999998 1 7134 container.3 * run function gm4_survival_refightalized:player/armor/durability/feet/run

# stopsounds
stopsound @s player item.armor.equip_chain
stopsound @s player item.armor.equip_diamond
stopsound @s player item.armor.equip_generic
stopsound @s player item.armor.equip_gold
stopsound @s player item.armor.equip_iron
stopsound @s player item.armor.equip_leather
stopsound @s player item.armor.equip_netherite
stopsound @s player item.armor.equip_turtle

# cleanup
data remove block 29999998 1 7134 Items
data remove storage gm4_survival_refightalized:temp Items
