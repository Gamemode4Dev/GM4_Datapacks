# run from breed_allay.json (advancement)
# @s = player who has bred a mob

execute if predicate gm4_gemini_shamir:holding_gemini as @e[type=allay,distance=..10,limit=1,sort=nearest,nbt={DuplicationCooldown:6000L}] at @s run summon allay ~ ~ ~ {DuplicationCooldown:6000L,CanDuplicate:0b}
advancement revoke @s only gm4_gemini_shamir:breed_allay
