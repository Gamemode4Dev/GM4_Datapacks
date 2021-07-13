# @s = player that just used an axe with arborenda
# run from main

scoreboard players set success gm4_ml_data 0
execute if score success gm4_ml_data matches 0 store success score success gm4_ml_data at @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:oak_log"}}] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score success gm4_ml_data matches 0 store success score success gm4_ml_data at @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:spruce_log"}}] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score success gm4_ml_data matches 0 store success score success gm4_ml_data at @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:acacia_log"}}] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score success gm4_ml_data matches 0 store success score success gm4_ml_data at @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:birch_log"}}] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score success gm4_ml_data matches 0 store success score success gm4_ml_data at @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:jungle_log"}}] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute if score success gm4_ml_data matches 0 store success score success gm4_ml_data at @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:dark_oak_log"}}] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}

scoreboard players set chop_count gm4_ml_data -1
scoreboard players set current_depth gm4_ml_data 0
execute if score success gm4_ml_data matches 1 run function gm4_arborenda_shamir:next_depth
execute if score chop_count gm4_ml_data matches 1.. run function gm4_arborenda_shamir:modify_axe_durability
execute if score chop_count gm4_ml_data matches 1.. run schedule function gm4_arborenda_shamir:destroy_trunk 2t
