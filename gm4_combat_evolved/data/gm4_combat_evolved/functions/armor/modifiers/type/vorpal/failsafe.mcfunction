# run from armor/active/vorpal/tp_aec
# @s = vorpal marker
# at @s

# search for the correct height
execute store result score $y_pos gm4_ce_data run data get entity @s Pos[1]
execute if score $y_pos gm4_ce_data matches ..128 run function gm4_combat_evolved:armor/modifiers/type/vorpal/failsafe/-64_128
execute if score $y_pos gm4_ce_data matches 129.. run function gm4_combat_evolved:armor/modifiers/type/vorpal/failsafe/129_320

# teleport
function gm4_combat_evolved:armor/modifiers/type/vorpal/tp_player