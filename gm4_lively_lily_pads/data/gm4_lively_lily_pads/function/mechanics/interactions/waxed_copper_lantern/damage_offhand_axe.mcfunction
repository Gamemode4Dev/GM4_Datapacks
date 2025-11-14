# damages axe
# @s = player holding axe
# at @s
# run from mechanics/interactions/waxed_copper_lantern/used_offhand_axe

execute store result score $damage gm4_llp.data run data get entity @s equipment.offhand.components."minecraft:damage"
execute store result storage gm4_llp:temp damage int 1 run scoreboard players add $damage gm4_llp.data 1
function gm4_lively_lily_pads:mechanics/interactions/waxed_copper_lantern/set_damage_offhand with storage gm4_llp:temp
