# dispatches type
# @s = block display, tag=gm4_llp_light
# at @s
# run from tick

execute if entity @s[tag=gm4_llp_lit_candle] run return run function gm4_lively_lily_pads:mechanics/particles/candle_count

execute store result score $rand gm4_llp.data run random value 1..10
execute if entity @s[tag=gm4_llp_smoke_torch] \
  if score $rand gm4_llp.data matches 1..6 run particle smoke ~ ~.6 ~
execute if data entity @s {block_state:{Name:"minecraft:soul_torch"}} \
  if score $rand gm4_llp.data matches 1..9 run particle soul_fire_flame ~ ~.58 ~
execute if data entity @s {block_state:{Name:"minecraft:torch"}} \
  if score $rand gm4_llp.data matches 1..9 run particle flame ~ ~.58 ~
execute if data entity @s {block_state:{Name:"minecraft:copper_torch"}} \
  if score $rand gm4_llp.data matches 1..9 run particle copper_fire_flame ~ ~.58 ~
execute if data entity @s {block_state:{Name:"minecraft:redstone_torch"}} \
  if score $rand gm4_llp.data matches 1..8 run particle dust{color:[1,0,0],scale:0.8} ~ ~.58 ~

# refresh light block
execute if block ~ ~1 ~ light run setblock ~ ~1 ~ air
execute if entity @s[tag=gm4_llp_light.14] run setblock ~ ~1 ~ light[level=14] keep
execute if entity @s[tag=gm4_llp_light.9] run setblock ~ ~1 ~ light[level=9] keep
execute if entity @s[tag=gm4_llp_light.6] run setblock ~ ~1 ~ light[level=6] keep

# copper lantern oxidization
execute if entity @s[tag=gm4_llp_unwaxed_copper_lantern] run function gm4_lively_lily_pads:mechanics/interactions/unwaxed_copper_lantern/attempt_oxidization
