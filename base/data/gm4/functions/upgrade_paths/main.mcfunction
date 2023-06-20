
schedule function gm4:upgrade_paths/main 300s
execute as @a at @s run function #gm4_upgrade_paths:run
# TODO unscheduling if no upgrade paths would ever run