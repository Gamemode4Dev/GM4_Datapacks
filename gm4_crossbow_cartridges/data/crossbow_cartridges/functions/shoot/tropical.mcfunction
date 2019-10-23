# @s = player using the crossbow

#summon tropical fish at player's location and copy variant
summon minecraft:tropical_fish ~ ~1.2 ~ {FromBucket:1,Tags:["gm4_cb_proj"],ActiveEffects:[{Id:10,Amplifier:10,Duration:200,ShowParticles:0b}]}
data modify entity @e[type=minecraft:tropical_fish,tag=gm4_cb_proj,distance=..2,limit=1] Variant set from entity @s Inventory[{Slot:-106b}].tag.BucketVariantTag

#replace bucket of tropical fish in player's offhand with water bucket
execute unless entity @s[gamemode=creative] run replaceitem entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:tropical_fish_bucket"}]}] weapon.offhand minecraft:water_bucket

#move motion of arrow to potion
function crossbow_cartridges:shoot/arrow_motion

#give player advancement for shooting a fish
advancement grant @s only gm4:crossbow_cartridges_fish
