# Converts a string effect id to a matching numeric id, as scoreboard lookups are cheaper and this conversion only has to be done once when soul glass is first placed on a beacon
# @s = gm4_soul_glass marker
# at @s
# run from effect/update_effects

# convert id
execute if data storage gm4_soul_glass:temp {effect:"minecraft:speed"} run scoreboard players set @s gm4_sg_secondary 1
execute if data storage gm4_soul_glass:temp {effect:"minecraft:haste"} run scoreboard players set @s gm4_sg_secondary 3
execute if data storage gm4_soul_glass:temp {effect:"minecraft:strength"} run scoreboard players set @s gm4_sg_secondary 5
execute if data storage gm4_soul_glass:temp {effect:"minecraft:jump_boost"} run scoreboard players set @s gm4_sg_secondary 8
execute if data storage gm4_soul_glass:temp {effect:"minecraft:resistance"} run scoreboard players set @s gm4_sg_secondary 11
execute if data storage gm4_soul_glass:temp {effect:"minecraft:regeneration"} run scoreboard players set @s gm4_sg_secondary 10

# clean up storage
data remove storage gm4_soul_glass:temp effect
