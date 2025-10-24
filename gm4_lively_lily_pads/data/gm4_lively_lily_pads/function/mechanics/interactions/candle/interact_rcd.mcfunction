# candle right click
# @s = player who right clicked on a candle
# at @s
# run from advancement: candle_rcd

advancement revoke @s only gm4_lively_lily_pads:candle_rcd

# reset
scoreboard players set $mainhand gm4_llp.data 0
scoreboard players set $offhand gm4_llp.data 0
scoreboard players set $holding_lighter gm4_llp.data 0
scoreboard players set $holding_candle gm4_llp.data 0
scoreboard players set $ignited gm4_llp.data 0

# item information
execute if items entity @s weapon.mainhand #gm4_lively_lily_pads:candle_interactable run function gm4_lively_lily_pads:mechanics/interactions/candle/get_mainhand_data
execute unless score $mainhand gm4_llp.data matches 1 if items entity @s weapon.offhand #gm4_lively_lily_pads:candle_interactable run function gm4_lively_lily_pads:mechanics/interactions/candle/get_offhand_data

# find interaction
execute as @e[type=interaction,tag=gm4_llp_candle_rcd,distance=..8] if data entity @s interaction at @s run function gm4_lively_lily_pads:mechanics/interactions/candle/process_interaction

# player effects
execute if score $ignited gm4_llp.data matches 1 run function gm4_lively_lily_pads:mechanics/interactions/candle/find_igniter
execute if score $placement_success gm4_llp.data matches 1 if score $mainhand gm4_llp.data matches 1 run item modify entity @s[gamemode=!creative] weapon.mainhand {function:"minecraft:set_count",count:-1,add:1b}
execute if score $placement_success gm4_llp.data matches 1 if score $offhand gm4_llp.data matches 1 run item modify entity @s[gamemode=!creative] weapon.offhand {function:"minecraft:set_count",count:-1,add:1b}

# reset
scoreboard players reset $placement_success gm4_llp.data
