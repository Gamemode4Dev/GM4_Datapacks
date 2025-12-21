# @s = gm4_llp_waxed_copper_lantern block display
# at associated gm4_llp_waxed_copper_rcd rcd
# run from mechanics/interactions/waxed_copper_lantern/process_interaction

# update tags
tag @s remove gm4_llp_waxed_copper_lantern
tag @s add gm4_llp_unwaxed_copper_lantern

# modify
execute if data entity @s {block_state:{Name:"minecraft:waxed_copper_lantern"}} run return run data modify entity @s block_state.Name set value "minecraft:copper_lantern"
execute if data entity @s {block_state:{Name:"minecraft:waxed_exposed_copper_lantern"}} run return run data modify entity @s block_state.Name set value "minecraft:exposed_copper_lantern"
execute if data entity @s {block_state:{Name:"minecraft:waxed_weathered_copper_lantern"}} run return run data modify entity @s block_state.Name set value "minecraft:weathered_copper_lantern"
execute if data entity @s {block_state:{Name:"minecraft:waxed_oxidized_copper_lantern"}} run return run data modify entity @s block_state.Name set value "minecraft:oxidized_copper_lantern"
