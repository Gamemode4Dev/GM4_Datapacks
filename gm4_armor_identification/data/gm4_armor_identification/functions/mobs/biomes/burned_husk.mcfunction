# run from mobs/husk
# @s = husk
# at @s

attribute @s generic.max_health modifier add 34931bf4-2d02-4700-bb16-097bc669d313 "gm4_ai_modifier_burned" -0.4 multiply
attribute @s generic.attack_damage modifier add 96ee68f2-4150-4350-af04-e4230fcd2cec "gm4_ai_modifier_burned" -0.25 multiply
execute if entity @s[tag=!gm4_ai_extra_mob] if block ~1 ~1 ~ #gm4:no_collision run summon husk ~1 ~ ~ {Tags:["gm4_ai_extra_mob"]}
execute if entity @s[tag=!gm4_ai_extra_mob] if block ~-1 ~1 ~ #gm4:no_collision run summon husk ~-1 ~ ~ {Tags:["gm4_ai_extra_mob"]}
execute if entity @s[tag=!gm4_ai_extra_mob] if block ~ ~1 ~1 #gm4:no_collision run summon husk ~ ~ ~1 {Tags:["gm4_ai_extra_mob"]}
execute if entity @s[tag=!gm4_ai_extra_mob] if block ~ ~1 ~-1 #gm4:no_collision run summon husk ~ ~ ~-1 {Tags:["gm4_ai_extra_mob"]}
execute if entity @s[tag=!gm4_ai_extra_mob] if block ~1 ~1 ~1 #gm4:no_collision run summon husk ~1 ~ ~1 {Tags:["gm4_ai_extra_mob"]}
execute if entity @s[tag=!gm4_ai_extra_mob] if block ~-1 ~1 ~-1 #gm4:no_collision run summon husk ~-1 ~ ~-1 {Tags:["gm4_ai_extra_mob"]}
scoreboard players set $mob_extras gm4_ai_data 1
