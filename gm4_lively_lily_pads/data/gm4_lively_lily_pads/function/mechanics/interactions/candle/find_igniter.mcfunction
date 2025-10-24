# @s = player who ignited candle
# at @s
# run from mechanics/interactions/candle/interact_rcd

scoreboard players reset $ignited gm4_llp.data

execute if score $mainhand gm4_llp.data matches 1 if items entity @s weapon.mainhand fire_charge run function gm4_lively_lily_pads:mechanics/interactions/candle/used_mainhand_fire_charge
execute if score $mainhand gm4_llp.data matches 1 if items entity @s weapon.mainhand flint_and_steel run function gm4_lively_lily_pads:mechanics/interactions/candle/used_mainhand_flint_and_steel
execute if score $offhand gm4_llp.data matches 1 if items entity @s weapon.offhand fire_charge run function gm4_lively_lily_pads:mechanics/interactions/candle/used_offhand_fire_charge
execute if score $offhand gm4_llp.data matches 1 if items entity @s weapon.offhand flint_and_steel run function gm4_lively_lily_pads:mechanics/interactions/candle/used_offhand_flint_and_steel
