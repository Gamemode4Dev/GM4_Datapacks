# @s = armor_stand to be modified
# at @s
# run from holding_book

summon minecraft:villager ~ ~-1000 ~ {CustomName:'"gm4_bas_detect_rightclick"',Tags:["gm4_bas_arms_detect"],Team:"gm4_bas",Silent:1b,NoAI:1b,ActiveEffects:[{Id:14b,Amplifier:0b,Duration:10000000,ShowParticles:0b}]}
execute positioned ~ ~-1000 ~ run tp @e[type=villager,tag=gm4_bas_arms_detect,distance=..1,sort=nearest,limit=1] @s

tag @s add gm4_bas_no_arms
