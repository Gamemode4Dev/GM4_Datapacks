# candle right click
# @s = player who right clicked on a candle
# at @s
# run from advancement: candle_rcd

advancement revoke @s only gm4_lively_lily_pads:candle_rcd

# flags and player data
execute if entity @s[gamemode=adventure] run scoreboard players set $adventure gm4_llp.data 1

# item information
execute store success score $mainhand gm4_llp.data if items entity @s weapon.mainhand #gm4_lively_lily_pads:candle_interactable run function gm4_lively_lily_pads:mechanics/interactions/candle/get_mainhand_data
execute store success score $offhand gm4_llp.data if score $mainhand gm4_llp.data matches 0 if items entity @s weapon.offhand #gm4_lively_lily_pads:candle_interactable run function gm4_lively_lily_pads:mechanics/interactions/candle/get_offhand_data
execute if score $mainhand gm4_llp.data matches 0 if score $offhand gm4_llp.data matches 0 run scoreboard players set $holding_lighter gm4_llp.data 0
execute if score $mainhand gm4_llp.data matches 0 if score $offhand gm4_llp.data matches 0 run scoreboard players set $holding_candle gm4_llp.data 0

# find interaction
execute as @e[type=interaction,tag=gm4_llp_candle_rcd,distance=..8] if data entity @s interaction at @s run function gm4_lively_lily_pads:mechanics/interactions/candle/process_interaction

# player effects
execute if score $ignited gm4_llp.data matches 1 run function gm4_lively_lily_pads:mechanics/interactions/candle/find_igniter
execute if score $placement_success gm4_llp.data matches 1 if score $mainhand gm4_llp.data matches 1 if entity @s[gamemode=!creative] run item modify entity @s weapon.mainhand {function:"minecraft:set_count",count:-1,add:1b}
execute if score $placement_success gm4_llp.data matches 1 if score $offhand gm4_llp.data matches 1 if entity @s[gamemode=!creative] run item modify entity @s weapon.offhand {function:"minecraft:set_count",count:-1,add:1b}

# reset
scoreboard players reset $placement_success gm4_llp.data
