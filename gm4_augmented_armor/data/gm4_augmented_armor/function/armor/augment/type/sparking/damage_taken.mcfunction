# actiavate spark armor on wearer getting hit
# @s = player wearing armor
# at @s
# run from armor/augment/damage_taken

# get amount of static to apply
execute store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0]

# apply stacks unless damage came from self
tag @s add gm4_aa_self
execute on attacker unless entity @s[tag=gm4_aa_self] run function gm4_augmented_armor:armor/augment/type/sparking/add_static
tag @s remove gm4_aa_self
