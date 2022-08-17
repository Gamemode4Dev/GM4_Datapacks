execute if score gm4_machines load.status matches 1 if score gm4_machines_minor load.status matches 1 run function gm4_machines-1.1:load

execute unless score gm4_machines load.status matches 1 run schedule clear gm4_machines-1.1:main
execute if score gm4_machines load.status matches 1 unless score gm4_machines_minor load.status matches 1 run schedule clear gm4_machines-1.1:main
