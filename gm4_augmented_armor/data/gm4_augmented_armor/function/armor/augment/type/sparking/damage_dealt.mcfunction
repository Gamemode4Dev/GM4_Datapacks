# actiavate spark armor on wearer getting hit
# @s = player wearing armor
# at @s
# run from armor/augment/damage_dealt

# get amount of static to apply
execute store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0]

# apply stacks
execute anchored eyes positioned ^ ^ ^3 as @e[type=!#gm4_augmented_armor:effect_immune,distance=..12,tag=!gm4_aa_self,tag=!smithed.strict,nbt={HurtTime:10s}] run function gm4_augmented_armor:armor/augment/type/sparking/add_static
