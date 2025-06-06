# light candle interact logic
# @s = player who wants to add a candle
# at @s
# run from advancement: add_candle_rcd

advancement revoke @s only gm4_lively_lily_pads:light_candle_rcd
scoreboard players reset $minus_one gm4_llp.data

# raycast
execute store result score $ray gm4_llp.data run attribute @s minecraft:block_interaction_range get 10
execute anchored eyes positioned ^ ^ ^ run function gm4_lively_lily_pads:mechanics/interactions/light_candle/ray

# return if not ignited
execute if score $ignited gm4_llp.data matches 0 run return fail

# item use (fire charge or flint and steel)
execute if entity @s[gamemode=!creative] if items entity @s weapon.mainhand fire_charge run \
  return run item modify entity @s weapon.mainhand {function:"minecraft:set_count",count:-1,add:1b}
execute if entity @s[gamemode=!creative] run function gm4_lively_lily_pads:mechanics/interactions/light_candle/unbreaking_damage
