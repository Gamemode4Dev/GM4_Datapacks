# Summon axolotl
# @s = player using the crossbow
# at @s
# run from projectile/bucket

# replace arrow with axolotl and copy data
summon minecraft:axolotl ~ ~ ~ {FromBucket:1b,Tags:["gm4_cb_projectile"],ActiveEffects:[{Id:7,Amplifier:10,Duration:1}],Silent:1b,DeathLootTable:"minecraft:empty"}

execute as @e[type=minecraft:axolotl,tag=gm4_cb_projectile,limit=1,distance=..1] run function gm4_crossbow_cartridges:projectile/arrow_motion

# axolotl sound
playsound minecraft:entity.axolotl.idle_air player @a[distance=..15] ^ ^ ^1 2 .5
