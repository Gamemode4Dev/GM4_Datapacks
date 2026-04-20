# upgrade path, needs run before process
function gm4_smelteries:upgrade_paths/1.9
# process machine
execute as @e[type=marker,tag=gm4_smeltery] at @s run function gm4_smelteries:process

schedule function gm4_smelteries:main 16t
