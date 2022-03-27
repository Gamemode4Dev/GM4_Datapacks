# run from advancement interact_canine
# @s = player that interacted with a canine wolf
# at @s

advancement revoke @s only gm4_combat_evolved:interact_canine

# give power to wolves that were fed
execute as @e[type=wolf,tag=gm4_ce_wolf,nbt={InLove:600}] run function gm4_combat_evolved:armor/modifiers/type/canine/wolf_fed_power

# check if wolved are sitting
execute as @e[type=wolf,tag=gm4_ce_wolf,nbt={Sitting:1b}] run function gm4_combat_evolved:armor/modifiers/type/canine/wolf_stand_up
