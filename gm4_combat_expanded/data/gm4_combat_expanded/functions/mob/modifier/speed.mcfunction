# boost mob stats from the (randomized) scores
# @s = mobs that can be buffed
# at @s
# run from mob/modifier/prep

# apply speed boost
# STEP SIZE = score*0.02 (multiply_base)
# MAX = +30% movement speed
execute if score $mob_speed gm4_ce_data matches 8.. run attribute @s generic.movement_speed modifier add 873a5399-42e3-46b1-b5f8-12cf22caf6c6 "gm4_ce_modifier_speed_16%" 0.16 multiply_base
execute if score $mob_speed gm4_ce_data matches 8.. run scoreboard players remove $mob_speed gm4_ce_data 8
execute if score $mob_speed gm4_ce_data matches 4.. run attribute @s generic.movement_speed modifier add 3b3ead66-b4f5-4f66-9286-129910be37fc "gm4_ce_modifier_speed_8%" 0.08 multiply_base
execute if score $mob_speed gm4_ce_data matches 4.. run scoreboard players remove $mob_speed gm4_ce_data 4
execute if score $mob_speed gm4_ce_data matches 2.. run attribute @s generic.movement_speed modifier add 51df70a7-6fe9-4684-9892-87712cb335d0 "gm4_ce_modifier_speed_4%" 0.04 multiply_base
execute if score $mob_speed gm4_ce_data matches 2.. run scoreboard players remove $mob_speed gm4_ce_data 2
execute if score $mob_speed gm4_ce_data matches 1.. run attribute @s generic.movement_speed modifier add 7fd33986-e6dc-40e6-b6d0-712280a87f99 "gm4_ce_modifier_speed_2%" 0.02 multiply_base
