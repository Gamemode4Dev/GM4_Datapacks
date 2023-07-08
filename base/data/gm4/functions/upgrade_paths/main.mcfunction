
scoreboard players set $active_upgrade_paths gm4_data 0
execute as @a[limit=1] at @s run function #gm4_upgrade_paths:run
# if no paths run, disable further checks until next reload
execute if entity @a unless score $disable_upgrade_paths gm4_data matches 1 unless score $active_upgrade_paths gm4_data matches 1.. run scoreboard players set $disable_upgrade_paths gm4_data 2
execute unless score $disable_upgrade_paths gm4_data matches 1.. run schedule function gm4:upgrade_paths/main 300s
