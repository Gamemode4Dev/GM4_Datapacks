#@s = none
#run from finish_smelt

execute at @e[tag=gm4_sg_smelted] run data modify block ~ ~ ~ Items[{Slot:2b}].components set value {"minecraft:custom_model_data":"item/soul_glass","minecraft:custom_data":{gm4_soul_glass:1b},"minecraft:enchantment_glint_override":true,"minecraft:custom_name":'{"translate":"item.gm4.soul_glass","fallback":"Soul Glass","italic":false}'}
execute as @e[tag=gm4_sg_disabled] run data merge entity @s {Enabled:1b,Tags:[]}
