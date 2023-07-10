#@s = none
#run from finish_smelt

execute at @e[tag=gm4_sg_smelted] run data modify block ~ ~ ~ Items[{Slot:2b}].tag set value {CustomModelData:3420002,gm4_soul_glass:1b,Enchantments:[{id:"minecraft:protection",lvl:0s}],HideFlags:1,display:{Name:'{"translate":"item.gm4.soul_glass","fallback":"Soul Glass","italic":false}'}}
execute as @e[tag=gm4_sg_disabled] run data merge entity @s {Enabled:1b,Tags:[]}
