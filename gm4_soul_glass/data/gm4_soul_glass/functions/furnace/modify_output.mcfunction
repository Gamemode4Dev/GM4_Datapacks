#@s = none
#run from finish_smelt

execute at @e[tag=gm4_sg_smelted] run data modify block ~ ~ ~ Items[{Slot:2b}].tag set value {CustomModelData:2,gm4_soul_glass:1b,Enchantments:[{}],display:{Name:'{"translate":"%1$s%3427655$s","with":["Soul Glass",{"translate":"item.gm4.soul_glass"}],"italic":false}'}}
execute as @e[tag=gm4_sg_disabled] run data merge entity @s {Enabled:1b,Tags:[]}
