# @s = valid pig tractor above farmland with air above
# at @s
# Called from has_hoe

function pig_tractors:check_mainhand

execute if block ~ ~ ~ #pig_tractors:air run function pig_tractors:check_offhand

execute if block ~ ~ ~ #pig_tractors:air run function pig_tractors:check_inventory
