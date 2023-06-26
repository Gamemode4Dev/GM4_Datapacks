
scoreboard players set $active_upgrade_paths gm4_data 0
execute as @a at @s run function #gm4_upgrade_paths:run
execute if entity @a unless score $active_upgrade_paths gm4_data matches 1.. run scoreboard players set $disable_upgrade_paths gm4_data 1
execute unless score $disable_upgrade_paths gm4_data matches 1 run schedule function gm4:upgrade_paths/main 300s
