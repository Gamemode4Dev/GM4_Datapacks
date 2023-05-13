# boost mob stats from the (randomized) scores
# @s = mobs that can be buffed
# at @s
# run from mob/modifier/prep

# apply armor boost
# STEP SIZE = score*1
# MAX = +7 armor
execute if score $mob_armor gm4_ce_data matches 4.. run attribute @s generic.armor modifier add 71fb9281-7a7a-4dce-b1a3-b83cbb05dfe4 "gm4_ce_modifier_armor_4" 4 add
execute if score $mob_armor gm4_ce_data matches 4.. run scoreboard players remove $mob_armor gm4_ce_data 4
execute if score $mob_armor gm4_ce_data matches 2.. run attribute @s generic.armor modifier add 4ac607ec-4a92-4801-b20e-e58f15b307f9 "gm4_ce_modifier_armor_2" 2 add
execute if score $mob_armor gm4_ce_data matches 2.. run scoreboard players remove $mob_armor gm4_ce_data 2
execute if score $mob_armor gm4_ce_data matches 1.. run attribute @s generic.armor modifier add bd31a75f-85e5-48c0-a5ce-0b0b66b49bda "gm4_ce_modifier_armor_1" 1 add
