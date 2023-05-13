# check for interactions with canine wolves
# @s = player that interacted with a canine wolf
# at @s
# run from advancement interact_canine

advancement revoke @s only gm4_combat_expanded:interact_canine

# give power to wolves that were fed
execute as @e[type=wolf,tag=gm4_ce_wolf,nbt={InLove:600}] run function gm4_combat_expanded:armor/modifier/type/canine/wolf_fed_power

# check if wolved are sitting
execute as @e[type=wolf,tag=gm4_ce_wolf,nbt={Sitting:1b}] run function gm4_combat_expanded:armor/modifier/type/canine/wolf_stand_up
