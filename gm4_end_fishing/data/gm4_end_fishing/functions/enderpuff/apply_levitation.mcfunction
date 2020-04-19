#@s = player with enderpuff in hand, not having levitation or slow falling yet
#run from enderpuff/track_inventory

# effect
effect give @s levitation 180 1

#sound
tag @s remove gm4_enderpuff_heard_deflate
playsound minecraft:entity.puffer_fish.blow_up player @a[distance=..8] ~ ~ ~ 0.7 0.3 0
