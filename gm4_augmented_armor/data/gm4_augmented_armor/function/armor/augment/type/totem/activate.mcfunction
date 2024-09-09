# activate or spawn a totem
# @s = player that got the kill
# at @s
# run from armor/check_augment/killing

# if there's no totem nearby spawn a new one and start the clock
execute unless entity @e[type=armor_stand,tag=gm4_aa_totem,distance=..18,limit=1] run function gm4_augmented_armor:armor/augment/type/totem/spawn

# check which effect should be applied
execute store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0]
execute if score $level gm4_aa_data matches 1 as @n[type=armor_stand,tag=gm4_aa_totem,distance=..18] at @s run tag @s add gm4_aa_totem.healing
execute if score $level gm4_aa_data matches 2 as @n[type=armor_stand,tag=gm4_aa_totem,distance=..18] at @s run tag @s add gm4_aa_totem.haste
execute if score $level gm4_aa_data matches 3 as @n[type=armor_stand,tag=gm4_aa_totem,distance=..18] at @s run tag @s add gm4_aa_totem.freezing
execute if score $level gm4_aa_data matches 4 as @n[type=armor_stand,tag=gm4_aa_totem,distance=..18] at @s run tag @s add gm4_aa_totem.strength
