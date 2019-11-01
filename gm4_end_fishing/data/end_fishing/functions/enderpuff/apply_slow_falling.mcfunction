#@s = player with enderpuff in hand, not having levetation or slow falling yet
#run from enderpuff/track_inventory

# effect
effect give @s slow_falling 2 0

# sound
tag @s remove gm4_enderpuff_heard_puff
execute if entity @s[tag=!gm4_enderpuff_heard_depuff,tag=!gm4_hold_enderpuff] run playsound minecraft:entity.puffer_fish.blow_out player @a[distance=..8] ~ ~ ~ 0.7 0.3 0
tag @s[tag=!gm4_hold_enderpuff] add gm4_enderpuff_heard_depuff
