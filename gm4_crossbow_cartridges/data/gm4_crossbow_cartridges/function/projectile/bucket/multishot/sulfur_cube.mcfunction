# Summon sulfur cube
# @s = player using the crossbow
# at @s
# run from projectile/bucket

# replace arrow with sulfur cube and copy data
summon minecraft:sulfur_cube ~ ~ ~ {from_bucket:1b,Size:1,Tags:["gm4_cb_projectile"],active_effects:[{id:'minecraft:instant_damage',amplifier:10,duration:1}],Silent:1b,DeathLootTable:"gm4:empty"}

execute as @e[type=minecraft:sulfur_cube,tag=gm4_cb_projectile,limit=1,distance=..1] run function gm4_crossbow_cartridges:projectile/arrow_motion

# sulfur cube sound
playsound minecraft:entity.sulfur_cube.squish player @a[distance=..15] ^ ^ ^1 2 1
