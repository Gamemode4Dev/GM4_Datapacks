
attribute @s minecraft:attack_damage modifier remove gm4_augmented_armor:strength_totem
scoreboard players remove @s gm4_aa_augment.totemic.strength_effect 10
scoreboard players set @s[scores={gm4_aa_augment.totemic.strength_effect=..-1}] gm4_aa_augment.totemic.strength_effect 0
