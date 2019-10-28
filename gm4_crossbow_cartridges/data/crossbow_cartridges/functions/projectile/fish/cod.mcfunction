#run from check_projectile
# @s = player using the crossbow

#summon cod at player's location
summon minecraft:cod ~ ~1.2 ~ {FromBucket:1,Tags:["gm4_cb_proj"],ActiveEffects:[{Id:10,Amplifier:10,Duration:200,ShowParticles:0b}]}

#replace bucket of cod in player's offhand with water bucket
replaceitem entity @s[gamemode=!creative] weapon.offhand minecraft:water_bucket

#move motion of arrow to potion
function crossbow_cartridges:projectile/arrow_motion

#give player advancement for shooting a fish
advancement grant @s only gm4:crossbow_cartridges_fish
