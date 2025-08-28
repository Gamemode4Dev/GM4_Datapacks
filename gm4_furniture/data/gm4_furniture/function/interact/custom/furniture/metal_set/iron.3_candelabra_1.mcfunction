# process candle right click event
# @s = interacted furniture's item display
# at @s
# run from interact/custom/resolve_function

# attempt to light, update model, fail if already lit model, else change light and return
execute if score $holding_lighter gm4_furniture_data matches 1 store success score $ignited_candle gm4_furniture_data \
  run data modify entity @s item.components."minecraft:item_model" set value "gm4_furniture:metal_set/iron/3_candelabra_1_lit"
execute if score $ignited_candle gm4_furniture_data matches 0 run return fail
execute if score $holding_lighter gm4_furniture_data matches 1 run return run setblock ~ ~ ~ light[level=13]

# not holding lighter, extinguish
data modify entity @s item.components."minecraft:item_model" set value "gm4_furniture:metal_set/iron/3_candelabra_1"
setblock ~ ~ ~ light[level=0]

## NEEDS MODELS
