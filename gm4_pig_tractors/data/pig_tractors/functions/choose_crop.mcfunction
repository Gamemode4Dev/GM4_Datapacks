# Called from on_pig

function pig_tractors:check_mainhand

execute if block ~ ~ ~ air run function pig_tractors:check_offhand

execute if block ~ ~ ~ air run function pig_tractors:check_inv