# @s = gm4_llp_unwaxed_copper_lantern block display
# at associated interaction
# run from mechanics/interactions/unwaxed_copper_lantern/process_display

# visuals
particle minecraft:wax_on ~ ~.2 ~ 0.3 0.3 0.3 1 16
playsound item.honeycomb.wax_on block @a[distance=..16] ~ ~ ~

# update tags
tag @s remove gm4_llp_unwaxed_copper_lantern
tag @s add gm4_llp_waxed_copper_lantern

# modify
execute if data entity @s {block_state:{Name:"minecraft:copper_lantern"}} run return run data modify entity @s block_state.Name set value "minecraft:waxed_copper_lantern"
execute if data entity @s {block_state:{Name:"minecraft:exposed_copper_lantern"}} run return run data modify entity @s block_state.Name set value "minecraft:waxed_exposed_copper_lantern"
execute if data entity @s {block_state:{Name:"minecraft:weathered_copper_lantern"}} run return run data modify entity @s block_state.Name set value "minecraft:waxed_weathered_copper_lantern"
execute if data entity @s {block_state:{Name:"minecraft:oxidized_copper_lantern"}} run return run data modify entity @s block_state.Name set value "minecraft:waxed_oxidized_copper_lantern"
