# cap damage mobs can do
# @s = mob with gm4_sr_check_damage_cap tag
# at unspecified
# run from mob/init/modifier/check_damage_cap_schedule

tag @s remove gm4_sr_check_damage_cap

# check if damage did not exceed the cap, otherwise reduce to get back to it
execute if score $worlddiff gm4_sr_data matches ..2 store result score $mob_total_damage gm4_sr_data run attribute @s generic.attack_damage get 10
execute if score $worlddiff gm4_sr_data matches 3 store result score $mob_total_damage gm4_sr_data run attribute @s generic.attack_damage get 15
execute store result storage gm4_survival_refightalized:temp picked_stat.damage_capped float 0.1 run scoreboard players operation @s gm4_sr_damage_cap -= $mob_total_damage gm4_sr_data
execute if score @s gm4_sr_damage_cap matches ..-1 run function gm4_survival_refightalized:mob/init/stat/eval_damage_cap with storage gm4_survival_refightalized:temp picked_stat
data remove storage gm4_survival_refightalized:temp picked_stat
