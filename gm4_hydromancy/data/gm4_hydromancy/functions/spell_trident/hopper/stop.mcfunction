# stop the spell, return trident to owner
# @s = spell trident
# at @s
# run from spell_trident/hopper/process

# update mana
scoreboard players operation @s gm4_hy_mana_used < @s gm4_hy_charge
function gm4_hydromancy:spell_trident/update_mana

# return to owner
data modify entity @s Trident.tag.Enchantments set value [{id:"minecraft:loyalty",lvl:3s}]

# allow picking up of items
execute on passengers run data modify entity @s PickupDelay set value 1

# stop processing
tag @s remove gm4_hy_spell_trident.process
