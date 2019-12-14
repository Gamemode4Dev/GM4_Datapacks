# @s = valid pig tractor above farmland with air above
# at @s
# Called from has_hoe

function gm4_pig_tractors:check_mainhand

execute if block ~ ~ ~ air run function gm4_pig_tractors:check_offhand

execute if block ~ ~ ~ air run function gm4_pig_tractors:check_inventory
