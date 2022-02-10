# decides which damage level to degrade to
# @s = varies; an item used in the smooshing process
# at align xyz in anvil
# run from gm4_metallurgy:smooshing/anvil/use

# degrade anvil block
execute if block ~ ~ ~ minecraft:damaged_anvil run setblock ~ ~ ~ air replace
execute if block ~ ~ ~ minecraft:chipped_anvil run function gm4_metallurgy:smooshing/anvil/degrade/chipped_anvil
execute if block ~ ~ ~ minecraft:anvil run function gm4_metallurgy:smooshing/anvil/degrade/anvil

# particles
particle minecraft:block minecraft:anvil ~0.5 ~1 ~0.5 0.2 0 0.2 0 5
