# @s = armor_stand to be modified
# at @s
# run from book/hold

summon minecraft:wandering_trader ~ ~-10000 ~ {CustomName:'"gm4_bas_detect_rightclick"',Tags:["gm4_trader","gm4_bas_arms_detect"],Team:"gm4_bas",Silent:1b,NoAI:1b,Invulnerable:1b,Offers:{},ActiveEffects:[{Id:14b,Amplifier:0b,Duration:10000000,ShowParticles:0b}]}
execute positioned ~ ~-10000 ~ run tp @e[type=wandering_trader,tag=gm4_bas_arms_detect,distance=..1,sort=nearest,limit=1] @s

tag @s add gm4_bas_no_arms
