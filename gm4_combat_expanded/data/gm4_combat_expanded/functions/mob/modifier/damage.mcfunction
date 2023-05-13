# boost mob stats from the (randomized) scores
# @s = mobs that can be buffed
# at @s
# run from mob/modifier/prep

# apply damage boost
# STEP SIZE = score*0.5
# MAX = +5.5 attack damage
execute if score $mob_damage gm4_ce_data matches 4.. run attribute @s generic.attack_damage modifier add 6d6d4eb0-a826-4697-9280-75cc603c68df "gm4_ce_modifier_damage_2" 2 add
execute if score $mob_damage gm4_ce_data matches 4.. run scoreboard players remove $mob_damage gm4_ce_data 4
execute if score $mob_damage gm4_ce_data matches 4.. run attribute @s generic.attack_damage modifier add cc1f816e-569d-4d21-b574-bee008e8459c "gm4_ce_modifier_damage_2" 2 add
execute if score $mob_damage gm4_ce_data matches 4.. run scoreboard players remove $mob_damage gm4_ce_data 4
execute if score $mob_damage gm4_ce_data matches 2.. run attribute @s generic.attack_damage modifier add 11b74080-88bc-494d-aea1-2f9e60d06e5d "gm4_ce_modifier_damage_1" 1 add
execute if score $mob_damage gm4_ce_data matches 2.. run scoreboard players remove $mob_damage gm4_ce_data 2
execute if score $mob_damage gm4_ce_data matches 1.. run attribute @s generic.attack_damage modifier add b4ba23c6-415f-4ff4-9016-7552eeb835f7 "gm4_ce_modifier_damage_0.5" 0.5 add
