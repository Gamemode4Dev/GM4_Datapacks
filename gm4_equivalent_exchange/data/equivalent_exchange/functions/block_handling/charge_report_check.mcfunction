#@s = player looking at alchemical crafter positioned as alchemical crafter stand
#run from block_handling/charge_report_ray

title @s actionbar ["",{"text":"Transmutation Stone Charge: ","color":"dark_gray"},{"score":{"name":"@e[type=armor_stand,tag=gm4_alchemical_crafter,distance=..0.5]","objective":"gm4_ee_charge"},"color":"blue"},{"text":"%","color":"blue"}]
tag @s add gm4_ee_found_altar