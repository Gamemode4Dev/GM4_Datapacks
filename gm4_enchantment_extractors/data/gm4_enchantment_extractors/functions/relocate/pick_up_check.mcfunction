# @s = player who placed a relocator player head
# located at the block the head was placed on
# run from #gm4_relocators:pick_up_check

execute if score valid_machine gm4_rl_data matches 0 store success score valid_machine gm4_rl_data if block ~ ~ ~ dropper{Items:[]} align xyz positioned ~ ~-1 ~ run tag @e[type=armor_stand,tag=gm4_enchantment_extractor,tag=!gm4_rl_selected,dx=0,dy=0,dz=0,limit=1] add gm4_rl_selected
execute align xyz positioned ~ ~-1 ~ if entity @e[type=armor_stand,tag=gm4_enchantment_extractor,tag=gm4_rl_selected,dx=0,dy=0,dz=0,limit=1] positioned ~.5 ~1.5 ~.5 run loot spawn ~ ~ ~ loot gm4_enchantment_extractors:items/relocator
