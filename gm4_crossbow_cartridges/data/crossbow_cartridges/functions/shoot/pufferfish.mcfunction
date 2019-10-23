# @s = player using the crossbow

#summon pufferfish at player's location
summon minecraft:pufferfish ~ ~1.2 ~ {FromBucket:1,Tags:["gm4_cb_proj"],ActiveEffects:[{Id:10,Amplifier:10,Duration:200,ShowParticles:0b}]}

#replace bucket of pufferfish in player's offhand with water bucket
execute unless entity @s[gamemode=creative] run replaceitem entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:pufferfish_bucket"}]}] weapon.offhand minecraft:water_bucket

#move motion of arrow to potion
function crossbow_cartridges:shoot/arrow_motion

#give player advancement for shooting a fish
advancement grant @s only gm4:crossbow_cartridges_fish
