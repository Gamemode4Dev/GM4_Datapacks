# stop the equip sound from playing when armor changes
# @s = player that is having their armor nbt change
# at unspecified
# run from any armor/slot/<SLOT>
# run from armor/modifier/type/link/process/set_max_health

stopsound @s player item.armor.equip_chain
stopsound @s player item.armor.equip_diamond
stopsound @s player item.armor.equip_generic
stopsound @s player item.armor.equip_gold
stopsound @s player item.armor.equip_iron
stopsound @s player item.armor.equip_leather
stopsound @s player item.armor.equip_netherite
stopsound @s player item.armor.equip_turtle

scoreboard players reset $change gm4_ce_data
