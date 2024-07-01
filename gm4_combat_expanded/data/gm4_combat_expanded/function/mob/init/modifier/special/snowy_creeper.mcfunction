# replace enderman with a slime
# @s = enderman
# at @s
# run from mob/init/mob_type/enderman

execute store result score $zombie_or_skeleton gm4_ce_data run random value 1..2
execute if score $zombie_or_skeleton gm4_ce_data matches 1 run summon zombie ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if score $zombie_or_skeleton gm4_ce_data matches 2 run summon stray ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
tp @s ~ ~-2050 ~
kill @s
scoreboard players set $mob_extras gm4_ce_data 1
scoreboard players set $replaced_mob gm4_ce_data 1
