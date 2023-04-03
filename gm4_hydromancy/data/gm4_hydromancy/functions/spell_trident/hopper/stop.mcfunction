# TODO

# update mana
scoreboard players operation @s gm4_hy_mana_used < @s gm4_hy_charge
function gm4_hydromancy:spell_trident/update_mana

# return to owner
data modify entity @s Trident.tag.Enchantments set value [{id:"minecraft:loyalty",lvl:2s}]

# stop processing
tag @s remove gm4_hy_spell_trident.process
tag @s remove gm4_hy_spell_trident.process_fast
