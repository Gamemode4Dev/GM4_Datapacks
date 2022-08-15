# tag spore item as spore
# @s = spore item
# at world spawn
# run from mob/effect/spores/check

tag @s add gm4_ce_spore
data merge entity @s {Age:-32768,PickupDelay:32767,Motion:[0.0,-1.0,0.0]}
