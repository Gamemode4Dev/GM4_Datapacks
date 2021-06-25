# run from gm4_gemini_shamir:breed/check_rabbit
# @s = recently bred bun

summon rabbit ~ ~ ~ {Tags:["gm4_gemini_tamed"],Age:-23999}
data modify entity @e[type=rabbit,tag=gm4_gemini_tamed,distance=..2,sort=nearest,limit=1] RabbitType set from entity @s RabbitType
tag @e[type=rabbit,tag=gm4_gemini_tamed,distance=..0.01,sort=nearest,limit=1] remove gm4_gemini_tamed
