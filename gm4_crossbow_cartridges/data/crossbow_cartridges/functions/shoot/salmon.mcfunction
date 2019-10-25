# @s = player using the crossbow

#summon salmon at player's location
summon minecraft:salmon ~ ~1.2 ~ {FromBucket:1,Tags:["gm4_cb_proj"],ActiveEffects:[{Id:10,Amplifier:10,Duration:200,ShowParticles:0b}]}

#replace bucket of salmon in player's offhand with water bucket
execute unless entity @s[gamemode=creative] run replaceitem entity @s weapon.offhand minecraft:water_bucket

#move motion of arrow to potion
function crossbow_cartridges:shoot/arrow_motion

#give player advancement for shooting a fish
advancement grant @s only gm4:crossbow_cartridges_fish
