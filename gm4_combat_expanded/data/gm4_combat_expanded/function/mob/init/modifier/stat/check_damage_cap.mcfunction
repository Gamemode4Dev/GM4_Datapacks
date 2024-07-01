# cap damage mobs can do
# @s = mob with gm4_ce_check_damage_cap tag
# at unspecified
# run from mob/init/modifier/stat/check_damage_cap_schedule

# check if damage did not exceed the cap, otherwise reduce to get back to it
execute store result score $mob_total_damage gm4_ce_data run attribute @s generic.attack_damage get 10
execute store result storage gm4_combat_expanded:temp picked_stat.damage_capped float 0.1 run scoreboard players operation @s gm4_ce_damage_cap -= $mob_total_damage gm4_ce_data
execute if score @s gm4_ce_damage_cap matches ..-1 run function gm4_combat_expanded:mob/init/modifier/stat/eval_damage_cap with storage gm4_combat_expanded:temp picked_stat

# get world difficulty and remove the damage bonus from hard difficulty if needed (only done at the end as minecraft does not consider the damage bonus an attribute)
execute store result score $worlddiff gm4_ce_data run difficulty
execute if score $worlddiff gm4_ce_data matches 3 run attribute @s generic.attack_damage modifier add gm4_combat_expanded:stat_change.hard_difficulty_offset -0.333334 add_multiplied_total

tag @s remove gm4_ce_check_damage_cap
