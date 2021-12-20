# Summon cod
# @s = player using the crossbow
# at @s
# run from projectile/bucket

# replace arrow with cod and copy data
summon minecraft:cod ~ ~ ~ {FromBucket:1b,Tags:["gm4_cb_projectile"],ActiveEffects:[{Id:7,Amplifier:10,Duration:1}],Silent:1b,DeathLootTable:"minecraft:empty"}

execute as @e[type=minecraft:cod,tag=gm4_cb_projectile,limit=1,distance=..1] run function gm4_crossbow_cartridges:projectile/arrow_motion

# fish flop sound
playsound minecraft:entity.cod.flop player @a[distance=..15] ^ ^ ^1 2 .5
