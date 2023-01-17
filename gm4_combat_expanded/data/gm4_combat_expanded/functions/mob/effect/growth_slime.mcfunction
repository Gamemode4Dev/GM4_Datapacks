# spawn additional slimes
# @s = slime
# at @s
# run from mob/mob_type/slime

summon slime ~ ~ ~0.15 {Tags:["gm4_ce_extra_mob"],Size:0}
execute if score $size gm4_ce_data matches 2.. run summon slime ~0.15 ~ ~-0.15 {Tags:["gm4_ce_extra_mob"],Size:1}
execute if score $size gm4_ce_data matches 3.. run summon slime ~-0.15 ~ ~-0.15 {Tags:["gm4_ce_extra_mob"],Size:0}
execute if score $size gm4_ce_data matches 4.. run summon slime ~-0.15 ~ ~-0.15 {Tags:["gm4_ce_extra_mob"],Size:1}
scoreboard players set $mob_extras gm4_ce_data 1
