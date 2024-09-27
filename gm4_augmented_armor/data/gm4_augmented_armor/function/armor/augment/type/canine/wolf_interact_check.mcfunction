# check for interactions with canine wolves
# @s = player that interacted with a canine wolf
# at @s
advancement revoke @s only gm4_augmented_armor:augment/canine_interact

# give power to wolves that were fed
execute as @e[type=wolf,tag=gm4_aa_wolf,nbt={InLove:600}] run function gm4_augmented_armor:armor/augment/type/canine/wolf_fed_power

# check if wolves are wearing armor
execute as @e[type=wolf,tag=gm4_aa_wolf,nbt={body_armor_item:{}}] at @s run function gm4_augmented_armor:armor/augment/type/canine/wolf_remove_armor

# check if wolves are sitting
execute as @e[type=wolf,tag=gm4_aa_wolf,nbt={Sitting:1b}] run function gm4_augmented_armor:armor/augment/type/canine/wolf_stand_up
