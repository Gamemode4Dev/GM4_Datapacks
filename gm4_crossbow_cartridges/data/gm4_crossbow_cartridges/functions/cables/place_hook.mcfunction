# Place tripwire hook at end of tripwire
# @s = player using the crossbow
# at end of tripwire line, align xyz positioned ~0.5 ~ ~0.5
# run from cables/unspool_string

# check direction and place tripwire hook
execute if block ~1 ~ ~ minecraft:tripwire[east=true,attached=false] positioned ~-1 ~ ~ if predicate gm4_crossbow_cartridges:check_block/west run setblock ~1 ~ ~ minecraft:tripwire_hook[facing=east] destroy
execute if block ~-1 ~ ~ minecraft:tripwire[west=true,attached=false] positioned ~1 ~ ~ if predicate gm4_crossbow_cartridges:check_block/east run setblock ~-1 ~ ~ minecraft:tripwire_hook[facing=west] destroy
execute if block ~ ~ ~1 minecraft:tripwire[south=true,attached=false] positioned ~ ~ ~-1 if predicate gm4_crossbow_cartridges:check_block/north run setblock ~ ~ ~1 minecraft:tripwire_hook[facing=south] destroy
execute if block ~ ~ ~-1 minecraft:tripwire[north=true,attached=false] positioned ~ ~ ~1 if predicate gm4_crossbow_cartridges:check_block/south run setblock ~ ~ ~-1 minecraft:tripwire_hook[facing=north] destroy

execute if block ~ ~ ~ tripwire_hook run function gm4_crossbow_cartridges:cables/hook_success
