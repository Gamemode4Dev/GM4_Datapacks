# @s = player with enderpuff in hand, not having levitation or slow falling yet
# run from enderpuff/track_inventory

# sound
execute unless entity @s[tag=gm4_enderpuff_levitation] run playsound minecraft:entity.puffer_fish.blow_up player @a[distance=..8] ~ ~ ~ 0.7 0.3 0

# effect
tag @s add gm4_enderpuff_levitation
tag @s add gm4_enderpuff_used
effect give @s levitation 180 1
