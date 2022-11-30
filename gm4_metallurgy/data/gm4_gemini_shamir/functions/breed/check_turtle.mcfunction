# run from breed_turtle.json (advancement)
# @s = player who has bred a mob

execute if predicate gm4_gemini_shamir:holding_gemini run data modify entity @e[type=turtle,distance=..10,limit=1,sort=nearest,nbt=!{HasEgg:1b}] HasEgg set value 1b

advancement revoke @s only gm4_gemini_shamir:breed_turtle
