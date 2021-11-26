execute if score gm4_custom_crafters load.status matches 2 if score gm4_custom_crafters_minor load.status matches 0 run function gm4_custom_crafters-2.0:load
execute unless score gm4_custom_crafters load.status matches 2 run schedule clear gm4_custom_crafters-2.0:main
execute unless score gm4_custom_crafters_minor load.status matches 0 run schedule clear gm4_custom_crafters-2.0:main
