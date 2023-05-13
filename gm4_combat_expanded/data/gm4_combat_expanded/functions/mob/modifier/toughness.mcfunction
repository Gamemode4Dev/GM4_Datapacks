# boost mob stats from the (randomized) scores
# @s = mobs that can be buffed
# at @s
# run from mob/modifier/prep

# apply toughness boost
# STEP SIZE = score*5
# MAX = +35 armor toughness
execute if score $mob_toughness gm4_ce_data matches 4.. run attribute @s generic.armor_toughness modifier add 444fe678-a6d3-4909-9014-abfa49235594 "gm4_ce_modifier_toughness_20" 20 add
execute if score $mob_toughness gm4_ce_data matches 4.. run scoreboard players remove $mob_toughness gm4_ce_data 4
execute if score $mob_toughness gm4_ce_data matches 2.. run attribute @s generic.armor_toughness modifier add 2423a504-3aa1-4d36-88cc-67d47c81308a "gm4_ce_modifier_toughness_10" 10 add
execute if score $mob_toughness gm4_ce_data matches 2.. run scoreboard players remove $mob_toughness gm4_ce_data 2
execute if score $mob_toughness gm4_ce_data matches 1.. run attribute @s generic.armor_toughness modifier add c5f5a588-0c3e-4086-875f-26fe632c675c "gm4_ce_modifier_toughness_5" 5 add
