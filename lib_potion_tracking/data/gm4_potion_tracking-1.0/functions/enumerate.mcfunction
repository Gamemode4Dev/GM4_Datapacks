execute if score gm4_potion_tracking load.status matches 1 unless score gm4_potion_tracking_minor load.status matches 0.. run scoreboard players set gm4_potion_tracking_minor load.status 0

execute if score gm4_forceload load.status matches 1 if score gm4_forceload_minor load.status matches 1.. unless score gm4_potion_tracking load.status matches 1.. run scoreboard players set gm4_potion_tracking_minor load.status 0
execute if score gm4_forceload load.status matches 1 if score gm4_forceload_minor load.status matches 1.. unless score gm4_potion_tracking load.status matches 1.. run scoreboard players set gm4_potion_tracking load.status 1
