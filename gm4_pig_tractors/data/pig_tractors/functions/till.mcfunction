# @s = @a[tag=gm4_on_pig,tag=gm4_has_hoe]
# Called from pulse_check

# Break/ Replant crop
execute if block ~ ~ ~ minecraft:beetroots[age=3] run function pig_tractors:crops/beetroots
execute if block ~ ~ ~ minecraft:carrots[age=7] run function pig_tractors:crops/carrots
execute if block ~ ~ ~ minecraft:potatoes[age=7] run function pig_tractors:crops/potatoes
execute if block ~ ~ ~ minecraft:wheat[age=7] run function pig_tractors:crops/wheat
