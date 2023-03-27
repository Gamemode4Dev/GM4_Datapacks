# apply mountain effects to zombie and variants
# @s = zombie (or zombie variant)
# at @s
# run from mob/mob_type/drowned
# run from mob/mob_type/husk
# run from mob/mob_type/zombie

scoreboard players add $mob_toughness gm4_ce_data 6
attribute @s generic.attack_knockback modifier add 049693ea-5ae7-4a23-b075-407c65e0b103 "gm4_ce_modifier_mountainous" 2 add
attribute @s zombie.spawn_reinforcements modifier add 8650cbae-ca74-423f-96c6-eba2c1c8e80e "gm4_ce_modifier_mountainous" -1 multiply
