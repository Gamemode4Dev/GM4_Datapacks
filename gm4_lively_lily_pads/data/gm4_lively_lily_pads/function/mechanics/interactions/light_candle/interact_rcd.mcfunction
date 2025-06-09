# light candle interact logic
# @s = player who wants to light a candle
# at @s
# run from advancement: light_candle_rcd

advancement revoke @s only gm4_lively_lily_pads:light_candle_rcd

# return if adventure
execute if entity @s[gamemode=adventure] run return fail

# raycast
scoreboard players reset $minus_one gm4_llp.data
execute store result score $ray gm4_llp.data run attribute @s minecraft:block_interaction_range get 10
execute anchored eyes positioned ^ ^ ^ run function gm4_lively_lily_pads:mechanics/interactions/light_candle/ray

# return if not ignited
execute if score $ignited gm4_llp.data matches 0 run return fail

# item use (fire charge or flint and steel)
execute if items entity @s weapon.mainhand fire_charge run return \
  run function gm4_lively_lily_pads:mechanics/interactions/light_candle/used_fire_charge
execute run function gm4_lively_lily_pads:mechanics/interactions/light_candle/used_flint_and_steel
