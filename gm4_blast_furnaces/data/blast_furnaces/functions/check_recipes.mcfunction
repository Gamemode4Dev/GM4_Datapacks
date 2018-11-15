# Called from check_structure.mcfunction
# @s = valid structure at furnace

# Mark and display the ore
function #blast_furnaces:validate_recipe
execute if entity @s[tag=!gm4_bf_found, tag=gm4_bf_has_ore] run function blast_furnaces:ores/remove
tag @s remove gm4_bf_found
