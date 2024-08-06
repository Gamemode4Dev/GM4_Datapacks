# recharge the heal pulse armor piece when cooldown is over
# @s = player wearing soothing armour
# at @s
# run from armor/modifier/type/soothe/check

# mark for change
scoreboard players set $change gm4_aa_data 1

# add kills to the recharge
execute store result score $recharge gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.recharge
execute store result storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.recharge int 1 run scoreboard players operation $recharge gm4_aa_data += @s gm4_aa_kill

# update the lore
execute store result score $max_charge gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.max_charge
execute if score $recharge gm4_aa_data >= $max_charge gm4_aa_data run function gm4_augmented_armor:armor/modifier/type/soothe/recharge_fully
execute unless score $recharge gm4_aa_data >= $max_charge gm4_aa_data run function gm4_augmented_armor:armor/modifier/type/soothe/recharge_text with storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor
