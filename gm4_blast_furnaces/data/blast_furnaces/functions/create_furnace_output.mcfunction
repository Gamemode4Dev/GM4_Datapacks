# Called from recipe_check.mcfunction

setblock ~ ~ ~ hopper{CustomName:"{\"text\":\" Blast Furnace\"}"}
data merge entity @s {Invsiible:1b,CustomName:"\"Blast Furnace\"",ArmorItems:[{},{},{},{}],Tags:[gm4_bf_output,gm4_no_edit]}
playsound minecraft:block.anvil.use block @a[distance=..10] ~ ~ ~ 5 2
