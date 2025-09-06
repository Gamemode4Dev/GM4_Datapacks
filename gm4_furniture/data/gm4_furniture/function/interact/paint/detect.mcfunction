# detect interaction on paintable furniture by a player holding a paintbrush
# @s = player holding paintbrush
# at furniture's interacted interaction entity
# run from interact/process

# store color from paintbrush and process application if there is some
execute if predicate gm4_furniture:holding_paintbrush_offhand run data modify storage gm4_furniture:temp color set from entity @s equipment.offhand.components."minecraft:dyed_color"
execute if predicate gm4_furniture:holding_paintbrush_mainhand run data modify storage gm4_furniture:temp color set from entity @s SelectedItem.components."minecraft:dyed_color"
execute if data storage gm4_furniture:temp color run function gm4_furniture:interact/paint/process
data remove storage gm4_furniture:temp color
