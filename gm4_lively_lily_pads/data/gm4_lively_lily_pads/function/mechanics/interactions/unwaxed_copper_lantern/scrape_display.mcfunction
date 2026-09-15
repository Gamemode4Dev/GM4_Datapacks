# @s = gm4_llp_unwaxed_copper_lantern block display
# at associated interaction
# run from mechanics/interactions/unwaxed_copper_lantern/process_display

# visuals
particle minecraft:scrape ~ ~.2 ~ 0.3 0.3 0.3 1 16
playsound item.axe.scrape block @a[distance=..16] ~ ~ ~

# modify
execute if data entity @s {block_state:{id:"minecraft:exposed_copper_lantern"}} run return run data modify entity @s block_state.id set value "minecraft:copper_lantern"
execute if data entity @s {block_state:{id:"minecraft:weathered_copper_lantern"}} run return run data modify entity @s block_state.id set value "minecraft:exposed_copper_lantern"
execute if data entity @s {block_state:{id:"minecraft:oxidized_copper_lantern"}} run return run data modify entity @s block_state.id set value "minecraft:weathered_copper_lantern"
