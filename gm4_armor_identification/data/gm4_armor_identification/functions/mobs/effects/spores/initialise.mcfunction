# run from mobs/effects/spores/check
# @s = spore item

tag @s add gm4_ai_spore
data merge entity @s {Age:-32768,PickupDelay:32767,Motion:[0.0,-1.0,0.0]}
