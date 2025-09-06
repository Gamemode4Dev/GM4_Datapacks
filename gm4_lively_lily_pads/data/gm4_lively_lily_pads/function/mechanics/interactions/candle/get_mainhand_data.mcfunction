# stores mainhand item data
# @s = player who right clicked on a candle
# at @s
# run from mechanics/interactions/candle/interact_rcd

scoreboard players set $mainhand gm4_llp.data 1

data modify storage gm4_llp:temp held_item set from entity @s SelectedItem.id

execute store success score $holding_lighter gm4_llp.data if items entity @s weapon.mainhand #gm4_lively_lily_pads:candle_igniters
execute store success score $holding_candle gm4_llp.data if items entity @s weapon.mainhand #minecraft:candles
