# @s = player who just changed dimension
# at @s
# run from gm4:upgrade_paths/changed_dimension advancement
advancement revoke @s only gm4:upgrade_paths/changed_dimension
tag @s add gm4_running_upgrade_path
function gm4:upgrade_paths/run_when_loaded
