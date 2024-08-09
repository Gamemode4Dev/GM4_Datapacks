# clock totem processing
# @s = unspecified
# at unspecified
# scheduled from armor/augment/type/totem/activate
# scheduled from here

execute as @e[type=armor_stand,tag=gm4_aa_totem] at @s run function gm4_augmented_armor:armor/augment/type/totem/process

execute if entity @e[type=armor_stand,tag=gm4_aa_totem,limit=1] run schedule function gm4_augmented_armor:clocks/temp/totem 5s
