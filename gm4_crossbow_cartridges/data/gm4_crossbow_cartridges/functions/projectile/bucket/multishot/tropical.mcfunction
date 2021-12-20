# Summon tropical fish
# @s = player using the crossbow
# at @s
# run from projectile/bucket

# replace arrow with tropical fish and copy data
summon minecraft:tropical_fish ~ ~ ~ {FromBucket:1b,Tags:["gm4_cb_projectile"],ActiveEffects:[{Id:7,Amplifier:10,Duration:1}],Silent:1b,DeathLootTable:"minecraft:empty"}

execute as @e[type=minecraft:tropical_fish,tag=gm4_cb_projectile,limit=1,distance=..1] run function gm4_crossbow_cartridges:projectile/arrow_motion

# fish flop sound
playsound minecraft:entity.tropical_fish.flop player @a[distance=..15] ^ ^ ^1 2 .5
