#run from breed_llama.json (advancement)
#@s = player who has bred a mob

data modify storage gm4_gemini_shamir:temp/uuid UUID set from entity @s UUID
execute if predicate gm4_gemini_shamir:holding_gemini as @e[type=llama,distance=..10,limit=1,sort=nearest,nbt=!{InLove:0}] at @s run function gm4_gemini_shamir:breed/color_llama
data remove storage gm4_gemini_shamir:temp/uuid UUID

advancement revoke @s only gm4_gemini_shamir:breed_llama
