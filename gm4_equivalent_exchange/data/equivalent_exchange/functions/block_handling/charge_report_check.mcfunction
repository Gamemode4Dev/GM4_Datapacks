#@s = player looking at alchemical crafter positioned as alchemical crafter stand
#run from block_handling/charge_report_ray

title @s actionbar ["",{"translate":"%1$s%3427655$s","with":["Transmutation Stone Charge: ",{"translate":"item.gm4.ee_crafter_charge_display"}],"color":"light_purple"},{"score":{"name":"@e[type=armor_stand,tag=gm4_alchemical_crafter,distance=..0.5]","objective":"gm4_ee_charge"},"color":"blue"},{"text":"%","color":"blue"}]
tag @s add gm4_ee_found_altar
