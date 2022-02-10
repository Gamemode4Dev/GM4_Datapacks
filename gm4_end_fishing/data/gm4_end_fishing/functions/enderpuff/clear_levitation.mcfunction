# @s = player with enderpuff in inventory, but isn't holding it or is holding it, but ran out of levitation
# run from enderpuff/process

effect clear @s levitation
tag @s remove gm4_enderpuff_levitation

# sound
playsound minecraft:entity.puffer_fish.blow_out player @a[distance=..8] ~ ~ ~ 0.7 0.3 0
