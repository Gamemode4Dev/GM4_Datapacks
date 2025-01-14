# stop the equip sound from playing when armor changes
# @s = player that is having their armor nbt change
# at unspecified
# run from armor/augment/type/convert/update
# run from armor/augment/type/linked/process/set_max_health
# run from armor/augment/type/psychic/damage_dealt/apply_durability
# run from item_modify_eval/chest_update
# run from item_modify_eval/feet_update
# run from item_modify_eval/head_update
# run from item_modify_eval/legs_update
# run from item_modify_eval/set_damage

stopsound @s player item.armor.equip_chain
stopsound @s player item.armor.equip_diamond
stopsound @s player item.armor.equip_generic
stopsound @s player item.armor.equip_gold
stopsound @s player item.armor.equip_iron
stopsound @s player item.armor.equip_leather
stopsound @s player item.armor.equip_netherite
stopsound @s player item.armor.equip_turtle

scoreboard players reset $change gm4_aa_data
