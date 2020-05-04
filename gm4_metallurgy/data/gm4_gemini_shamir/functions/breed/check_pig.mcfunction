#run from breed_pig.json (advancement)
#@s = player who has bred a mob

execute if predicate gm4_gemini_shamir:holding_gemini as @e[distance=..10,type=pig,limit=1,sort=nearest,nbt=!{InLove:0}] at @s run summon pig ~ ~ ~ {Age:-23999}

advancement revoke @s only gm4_gemini_shamir:breed_pig
