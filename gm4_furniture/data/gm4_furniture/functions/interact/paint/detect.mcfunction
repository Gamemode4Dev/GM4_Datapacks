
data modify storage gm4_furniture:temp color set from entity @s SelectedItem.tag.display.color
execute if data storage gm4_furniture:temp color as @e[type=interaction,tag=gm4_furniture.dyable,distance=..8] if data entity @s interaction at @s run function gm4_furniture:interact/paint/process
data remove storage gm4_furniture:temp color
