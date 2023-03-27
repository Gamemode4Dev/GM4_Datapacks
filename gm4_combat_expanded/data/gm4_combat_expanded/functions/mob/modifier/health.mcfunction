# boost mob stats from the (randomized) scores
# @s = mobs that can be buffed
# at @s
# run from mob/modifier/prep

# apply health boost
# STEP SIZE = score*1
# MAX = +15 max health
execute if score $mob_health gm4_ce_data matches 8.. run attribute @s generic.max_health modifier add e1d4262d-fa9d-47e7-a98e-e83ad748796e "gm4_ce_modifier_health_8" 8 add
execute if score $mob_health gm4_ce_data matches 8.. run scoreboard players remove $mob_health gm4_ce_data 8
execute if score $mob_health gm4_ce_data matches 4.. run attribute @s generic.max_health modifier add 561834b0-62b8-47db-b78a-306833084b5b "gm4_ce_modifier_health_4" 4 add
execute if score $mob_health gm4_ce_data matches 4.. run scoreboard players remove $mob_health gm4_ce_data 4
execute if score $mob_health gm4_ce_data matches 2.. run attribute @s generic.max_health modifier add 391abce3-2f01-4c4c-9288-a94cec58f560 "gm4_ce_modifier_health_2" 2 add
execute if score $mob_health gm4_ce_data matches 2.. run scoreboard players remove $mob_health gm4_ce_data 2
execute if score $mob_health gm4_ce_data matches 1.. run attribute @s generic.max_health modifier add 631702c1-507d-4e75-8e19-2b127af24ed5 "gm4_ce_modifier_health_1" 1 add
