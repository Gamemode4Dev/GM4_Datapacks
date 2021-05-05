#run from check_projectile
# @s = player using the crossbow

#summon salmon at player's location
summon minecraft:salmon ~ ~1.2 ~ {FromBucket:1,Tags:["gm4_cb_proj"],ActiveEffects:[{Id:10,Amplifier:10,Duration:200,ShowParticles:0b}]}

#replace bucket of salmon in player's offhand with water bucket
replaceitem entity @s[gamemode=!creative] weapon.offhand minecraft:water_bucket

#copy motion of arrow to fish
function gm4_crossbow_cartridges:projectile/arrow_motion

#fish flop sound
playsound minecraft:entity.salmon.flop player @a[distance=..15] ~ ~ ~ 2 .5

#give player advancement for shooting a fish
advancement grant @s only gm4:crossbow_cartridges_fish
