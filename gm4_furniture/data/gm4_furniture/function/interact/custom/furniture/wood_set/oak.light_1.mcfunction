# process candle right click event
# @s = interacted furniture's item display
# at @s
# run from interact/custom/resolve_function

# attempt to light, update model, fail if already lit model, else change light and return
execute if score $holding_lighter gm4_furniture_data matches 1 store success score $ignited_candle gm4_furniture_data \
  run data modify entity @s item.components merge value {"minecraft:item_model":"gm4_furniture:wood_set/oak/light_1_lit","minecraft:custom_data":{gm4_furniture:{block_id:"light[level=15]"}}}
execute if score $ignited_candle gm4_furniture_data matches 0 run return fail
execute if score $holding_lighter gm4_furniture_data matches 1 run return run setblock ~ ~ ~ light[level=15]

# not holding lighter, extinguish
data modify entity @s item.components merge value {"minecraft:item_model":"gm4_furniture:wood_set/oak/light_1","minecraft:custom_data":{gm4_furniture:{block_id:"light[level=0]"}}}
setblock ~ ~ ~ light[level=0]
