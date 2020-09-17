# @s = player who placed a relocator player head
# located at the block the head was placed on
# run from #gm4_relocators:pick_up

execute if score valid_machine gm4_rl_data matches 0 store success score valid_machine gm4_rl_data if block ~ ~ ~ hopper{Items:[]} align xyz run tag @e[type=armor_stand,tag=gm4_liquid_tank,dx=0,dy=-.1,dz=0,limit=1] add gm4_rl_selected
execute align xyz if entity @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_rl_selected,dx=0,dy=-.1,dz=0,limit=1] positioned ~.5 ~.5 ~.5 run loot spawn ~ ~ ~ loot gm4_liquid_tanks:relocator
