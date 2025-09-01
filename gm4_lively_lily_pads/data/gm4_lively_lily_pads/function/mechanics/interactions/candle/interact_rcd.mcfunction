# candle right click
# @s = player who right clicked on a candle
# at @s
# run from advancement: candle_rcd

advancement revoke @s only gm4_lively_lily_pads:candle_rcd

# flags and player data
execute if entity @s[gamemode=adventure] run scoreboard players set $adventure gm4_llp.data 1
execute store success score $holding_lighter gm4_llp.data if items entity @s weapon.mainhand #gm4_lively_lily_pads:candle_igniters
execute store success score $holding_candle gm4_llp.data if items entity @s weapon.mainhand #minecraft:candles
data modify storage gm4_llp:temp held_item set from entity @s SelectedItem.id

# find interaction
execute as @e[type=interaction,tag=gm4_llp_candle_rcd,distance=..8] if data entity @s interaction at @s run function gm4_lively_lily_pads:mechanics/interactions/candle/process_interaction

# player effects
execute if score $ignited gm4_llp.data matches 1 if items entity @s weapon.mainhand fire_charge run function gm4_lively_lily_pads:mechanics/interactions/candle/used_fire_charge
execute if score $ignited gm4_llp.data matches 1 if items entity @s weapon.mainhand flint_and_steel run function gm4_lively_lily_pads:mechanics/interactions/candle/used_flint_and_steel
execute if entity @s[gamemode=!creative] if score $placement_success gm4_llp.data matches 1 run item modify entity @s weapon.mainhand {function:"minecraft:set_count",count:-1,add:1b}

# reset
scoreboard players reset $placement_success gm4_llp.data
