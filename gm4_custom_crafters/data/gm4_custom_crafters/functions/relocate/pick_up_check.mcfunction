# @s = player who placed a relocator player head
# located at the block the head was placed on
# run from #gm4_relocators:pick_up_check

execute if score valid_machine gm4_rl_data matches 0 store success score valid_machine gm4_rl_data if block ~ ~ ~ dropper{Items:[]} align xyz run tag @e[type=armor_stand,tag=gm4_custom_crafter,tag=!gm4_master_crafting,tag=!gm4_rl_selected,dx=0,dy=0,dz=0,limit=1] add gm4_rl_selected
execute align xyz if entity @e[type=armor_stand,tag=gm4_custom_crafter,tag=!gm4_master_crafting,tag=gm4_rl_selected,dx=0,dy=0,dz=0,limit=1] positioned ~.5 ~.5 ~.5 run loot spawn ~ ~ ~ loot gm4_custom_crafters:relocator
