# @s = area effect cloud ray used to detect the fire block
# run from soul_forge/used_flint_and_steel

scoreboard players add gm4_ray_counter gm4_count 1
tp @s ^ ^ ^0.01
execute if score gm4_ray_counter gm4_count matches 0..500 at @s unless block ~ ~ ~ soul_fire run function gm4_orb_of_ankou:soul_forge/ray
