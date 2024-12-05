
scoreboard players add @s gm4_aa_augment.totemic.strength_effect 11
scoreboard players set @s[scores={gm4_aa_augment.totemic.strength_effect=15..}] gm4_aa_augment.totemic.strength_effect 14
attribute @s[scores={gm4_aa_augment.totemic.strength_effect=11}] attack_damage modifier add gm4_augmented_armor:strength_totem 1 add_value
attribute @s[scores={gm4_aa_augment.totemic.strength_effect=12}] attack_damage modifier add gm4_augmented_armor:strength_totem 2 add_value
attribute @s[scores={gm4_aa_augment.totemic.strength_effect=13}] attack_damage modifier add gm4_augmented_armor:strength_totem 3 add_value
attribute @s[scores={gm4_aa_augment.totemic.strength_effect=14}] attack_damage modifier add gm4_augmented_armor:strength_totem 4 add_value
execute at @s anchored eyes run particle trial_spawner_detection ^ ^-0.25 ^ 0.4 0.01 0.4 0 6
