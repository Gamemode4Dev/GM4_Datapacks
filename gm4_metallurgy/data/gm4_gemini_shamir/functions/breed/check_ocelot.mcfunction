#run from breed_ocelot.json (advancement)
#@s = player who has bred a mob

execute if predicate gm4_gemini_shamir:holding_gemini as @e[type=ocelot,distance=..10,limit=1,sort=nearest,nbt=!{InLove:0}] at @s run summon ocelot ~ ~ ~ {Tags:["gm4_gemini_tamed"],Age:-23999}
execute as @e[type=ocelot,tag=gm4_gemini_tamed,distance=..0.01,sort=nearest,limit=1] run function gm4_gemini_shamir:breed/trust_ocelot

advancement revoke @s only gm4_gemini_shamir:breed_ocelot
