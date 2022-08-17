# Summon axolotl
# @s = player using the crossbow
# at arrow
# run from projectile/bucket

# replace arrow with axolotl and copy data
summon minecraft:axolotl ~ ~ ~ {FromBucket:1b,Tags:["gm4_cb_projectile"],ActiveEffects:[{Id:10,Amplifier:10,Duration:200,ShowParticles:0b}]}

data modify storage gm4_crossbow_cartridges:temp projectile.Variant set from entity @s Inventory[{Slot:-106b}].tag.Variant
execute as @e[type=minecraft:axolotl,tag=gm4_cb_projectile,limit=1,distance=..1] run function gm4_crossbow_cartridges:projectile/arrow_motion

# axolotl sound
playsound minecraft:entity.axolotl.idle_air player @a[distance=..15] ^ ^ ^1 2 .5

# shoot 2 more if using multishot
execute at @e[tag=gm4_cb_arrow,distance=..1,limit=2] run function gm4_crossbow_cartridges:projectile/bucket/multishot/axolotl
