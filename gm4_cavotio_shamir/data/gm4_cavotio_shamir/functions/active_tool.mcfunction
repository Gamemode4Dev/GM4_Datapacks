# @s = players holding an Cavotio tool
# at @s
# run from tick

effect give @s haste 1 255 true
effect give @s weakness 1 4 true

execute if score @s gm4_use_pick_net matches 1.. positioned ^ ^ ^3 as @e[type=item,distance=..3.5,nbt={Age:0s}] run kill @s
execute if score @s gm4_use_pick_dia matches 1.. positioned ^ ^ ^3 as @e[type=item,distance=..3.5,nbt={Age:0s}] run kill @s
execute if score @s gm4_use_pick_gol matches 1.. positioned ^ ^ ^3 as @e[type=item,distance=..3.5,nbt={Age:0s}] run kill @s
execute if score @s gm4_use_pick_iro matches 1.. positioned ^ ^ ^3 as @e[type=item,distance=..3.5,nbt={Age:0s}] run kill @s
execute if score @s gm4_use_pick_sto matches 1.. positioned ^ ^ ^3 as @e[type=item,distance=..3.5,nbt={Age:0s}] run kill @s
execute if score @s gm4_use_pick_woo matches 1.. positioned ^ ^ ^3 as @e[type=item,distance=..3.5,nbt={Age:0s}] run kill @s
