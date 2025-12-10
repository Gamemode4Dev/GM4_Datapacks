# simple oxidization logic with just a probability
# @s = block display, tag=gm4_llp_light, tag=gm4_llp_unwaxed_copper_lantern
# at @s
# run from mechanics/particles/select_type

# this is only run once per entity every 8 ticks (0.4 seconds)
# with a 1/6500 chance every 0.4 seconds, in 30 minutes there will be a ~50% chance of oxidization
execute store result score $rand gm4_llp.data run random value 1..6500
execute if score $rand gm4_llp.data matches 2.. run return fail

# oxidize
execute if data entity @s {block_state:{Name:"minecraft:copper_lantern"}} run return run data modify entity @s block_state.Name set value "minecraft:exposed_copper_lantern"
execute if data entity @s {block_state:{Name:"minecraft:exposed_copper_lantern"}} run return run data modify entity @s block_state.Name set value "minecraft:weathered_copper_lantern"
execute if data entity @s {block_state:{Name:"minecraft:weathered_copper_lantern"}} run return run data modify entity @s block_state.Name set value "minecraft:oxidized_copper_lantern"
