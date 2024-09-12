# detect interaction on paintable furniture by a player holding a paintbrush
# @s = furniture's interacted interaction entity 
# at @s
# run from interact/process

# store color from paintbrush and process application if there is some
data modify storage gm4_furniture:temp color set from entity @p[tag=gm4_furniture_target] SelectedItem.components."minecraft:dyed_color".rgb
execute if data storage gm4_furniture:temp color run function gm4_furniture:interact/paint/process
data remove storage gm4_furniture:temp color
