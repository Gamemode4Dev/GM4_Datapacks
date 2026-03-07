# process candle right click event
# @s = interacted furniture's item display
# at @s
# run from interact/custom/resolve_function

# attempt to light
execute if score $holding_lighter gm4_furniture_data matches 1 store success score $ignited_candle gm4_furniture_data \
  run data modify entity @s item.components merge value {"minecraft:item_model":"gm4_furniture:metal_set/iron/3_candelabra_1_lit","minecraft:custom_data":{gm4_furniture:{block_id:"light[level=13]"}}}
execute if score $ignited_candle gm4_furniture_data matches 0 unless score $offhand_candle_igniter gm4_furniture_data matches 1 run return run scoreboard players reset $ignited_candle gm4_furniture_data
execute if score $ignited_candle gm4_furniture_data matches 1 run return run setblock ~ ~ ~ light[level=13]

# extinguish
data modify entity @s item.components merge value {"minecraft:item_model":"gm4_furniture:metal_set/iron/3_candelabra_1","minecraft:custom_data":{gm4_furniture:{block_id:"light[level=0]"}}}
setblock ~ ~ ~ light[level=0]
playsound block.candle.extinguish block @a[distance=..16]
