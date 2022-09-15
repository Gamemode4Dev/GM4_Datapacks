execute if score gm4_custom_crafters load.status matches 3 unless score gm4_custom_crafters_minor load.status matches 0.. run scoreboard players set gm4_custom_crafters_minor load.status 0

execute if score gm4_machines load.status matches 1 unless score gm4_custom_crafters load.status matches 3.. run scoreboard players set gm4_custom_crafters_minor load.status 0
execute if score gm4_machines load.status matches 1 unless score gm4_custom_crafters load.status matches 3.. run scoreboard players set gm4_custom_crafters load.status 3
