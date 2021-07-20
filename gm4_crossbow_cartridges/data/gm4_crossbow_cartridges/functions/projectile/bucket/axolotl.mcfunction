# Summon axolotl
# @s = player using the crossbow
# at @s
# run from projectile/bucket

# summon axolotl at player's location and copy variant
summon minecraft:axolotl ~ ~1.2 ~ {FromBucket:1b,Tags:["gm4_cb_proj"],ActiveEffects:[{Id:10,Amplifier:10,Duration:200,ShowParticles:0b}]}
data modify entity @e[type=minecraft:axolotl,tag=gm4_cb_proj,distance=..2,limit=1] Variant set from entity @s Inventory[{Slot:-106b}].tag.Variant

# axolotl sound
playsound minecraft:entity.axolotl.idle_air player @a[distance=..15] ~ ~ ~ 2 .5
