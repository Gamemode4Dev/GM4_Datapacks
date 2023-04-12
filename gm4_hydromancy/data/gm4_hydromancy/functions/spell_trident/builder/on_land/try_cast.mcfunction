# try to cast the spell
# @s = spell trident
# at @s
# run from spell_trident/builder/process

# attempt to start the spell cast
execute if block ~ ~ ~ #gm4:replaceable run function gm4_hydromancy:spell_trident/builder/on_land/cast

# return to owner and allow picking up of stored blocks
data modify entity @s Trident.tag.Enchantments set value [{id:"minecraft:loyalty",lvl:3s}]
execute on passengers run data modify entity @s PickupDelay set value 1

# stop processing
tag @s remove gm4_hy_spell_trident.process
