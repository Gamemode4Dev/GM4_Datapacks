# Summon salmon
# @s = player using the crossbow
# at @s
# run from projectile/bucket

# replace arrow with salmon and copy data
summon minecraft:salmon ~ ~ ~ {FromBucket:1b,Tags:["gm4_cb_projectile"],ActiveEffects:[{Id:7,Amplifier:10,Duration:1}],Silent:1b,DeathLootTable:"minecraft:empty"}

execute as @e[type=minecraft:salmon,tag=gm4_cb_projectile,limit=1,distance=..1] run function gm4_crossbow_cartridges:projectile/arrow_motion

# fish flop sound
playsound minecraft:entity.salmon.flop player @a[distance=..15] ^ ^ ^1 2 .5
