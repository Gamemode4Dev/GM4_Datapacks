
execute store result score $damage_dealt gm4_aa_data run attribute @s generic.attack_damage get 100

tag @s add gm4_aa_augment_damager
execute as @n[type=!#gm4_augmented_armor:augment_immune,distance=..12,tag=!gm4_aa_augment_damager,tag=!smithed.strict,nbt={HurtTime:10s}] run function gm4_augmented_armor:armor/augment/type/giantsbane/damage
tag @s remove gm4_aa_augment_damager

scoreboard players reset $augment.giantsbane_damage gm4_aa_data
