# generic candle right click
# @s = player who right clicked on a candle
# at @s
# run from advancement: candle_rcd

advancement revoke @s only gm4_lively_lily_pads:candle_rcd

# early returns
execute if entity @s[gamemode=adventure] run return fail
execute if items entity @s weapon.mainhand #minecraft:candles run return fail

# check if holding lighter
execute store success score $holding_lighter gm4_llp.data if items entity @s weapon.mainhand #minecraft:creeper_igniters

# raycast
scoreboard players reset $ignited gm4_llp.data
execute store result score $ray gm4_llp.data run attribute @s minecraft:block_interaction_range get 2
execute anchored eyes positioned ^ ^ ^ run function gm4_lively_lily_pads:mechanics/interactions/candle_rc/ray

# return if not ignited
execute unless score $ignited gm4_llp.data matches 1 run return fail

# item use (fire charge or flint and steel)
execute if items entity @s weapon.mainhand fire_charge run return \
  run function gm4_lively_lily_pads:mechanics/interactions/candle_rc/used_fire_charge
function gm4_lively_lily_pads:mechanics/interactions/candle_rc/used_flint_and_steel
