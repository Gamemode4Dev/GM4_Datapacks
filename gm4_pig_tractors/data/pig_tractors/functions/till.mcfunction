# Called from pulse_check.mcfunction
# @s = player using pig tractors

setblock ~ ~ ~ farmland
playsound minecraft:item.hoe.till block @a[distance=..5] ~ ~ ~ 1.2 1.2
function pig_tractors:add_damage
