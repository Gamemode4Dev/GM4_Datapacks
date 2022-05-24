execute if score gm4_machines load.status matches 1 if score gm4_machines_minor load.status matches 0 run function gm4_machines-1.0:load

execute unless score gm4_machines load.status matches 1 run schedule clear gm4_machines-1.0:main
execute if score gm4_machines load.status matches 1 unless score gm4_machines_minor load.status matches 0 run schedule clear gm4_machines-1.0:main
