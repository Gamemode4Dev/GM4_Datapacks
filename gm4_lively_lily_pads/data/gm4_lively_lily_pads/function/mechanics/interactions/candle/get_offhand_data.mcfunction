# stores offhand item data
# @s = player who right clicked on a candle
# at @s
# run from mechanics/interactions/candle/interact_rcd

scoreboard players set $offhand gm4_llp.data 1

data modify storage gm4_llp:temp held_item set from entity @s equipment.offhand.id

execute store success score $holding_lighter gm4_llp.data if items entity @s weapon.offhand #gm4_lively_lily_pads:candle_igniters
execute store success score $holding_candle gm4_llp.data if items entity @s weapon.offhand #minecraft:candles
