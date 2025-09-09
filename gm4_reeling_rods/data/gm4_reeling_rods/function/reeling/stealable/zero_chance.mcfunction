# slot has a 0% drop chance, play sound and fail
# at @s
# run from reeling/stealable/steal_slot/*

playsound minecraft:item.spyglass.stop_using neutral @a[distance=16] ~ ~ ~
return fail
