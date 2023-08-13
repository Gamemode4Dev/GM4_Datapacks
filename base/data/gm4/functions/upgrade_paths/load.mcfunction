scoreboard objectives add gm4_earliest_version dummy
scoreboard objectives add gm4_up_leave_game minecraft.custom:minecraft.leave_game
# if upgrade paths auto-disabled, let it reevaluate any new modules
execute if score $disable_upgrade_paths gm4_data matches 2 run scoreboard players reset $disable_upgrade_paths gm4_data
function gm4:upgrade_paths/main
