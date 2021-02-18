# @s = armor_stand used to detect the machine block
# run from backwards_compatibility/placed_machine_block

scoreboard players add gm4_ray_counter gm4_rl_data 1
tp @s ^ ^ ^0.01
execute at @s unless block ~ ~ ~ #gm4:air run loot replace entity @s weapon.mainhand mine ~ ~ ~ minecraft:diamond_pickaxe{Enchantments:[{id:"minecraft:silk_touch",lvl:1}]}
execute at @s unless block ~ ~ ~ #gm4:air store success score @s gm4_rl_data run data modify entity @s HandItems[0].id set from entity @s HandItems[1].id
execute if score gm4_ray_counter gm4_rl_data matches 0..500 unless score @s gm4_rl_data matches 0 at @s run function gm4_relocators:backwards_compatibility/ray
execute if score gm4_ray_counter gm4_rl_data matches 0..500 if score @s gm4_rl_data matches 0 at @s if entity @e[type=armor_stand,tag=!gm4_relocated_ray,distance=..1,nbt={Invisible:1b,NoGravity:1b,Marker:1b}] run function gm4_relocators:backwards_compatibility/ray
