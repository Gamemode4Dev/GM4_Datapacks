#@s = player with enderpuff in hand, not having levetation or slow falling yet
#run from enderpuff/track_inventory

# effect
effect give @s levitation 180 1

# sound
tag @s remove gm4_enderpuff_heard_depuff
execute if entity @s[tag=!gm4_enderpuff_heard_puff] run playsound minecraft:entity.puffer_fish.blow_up player @a[distance=..8] ~ ~ ~ 0.7 0.3 0
tag @s add gm4_enderpuff_heard_puff
