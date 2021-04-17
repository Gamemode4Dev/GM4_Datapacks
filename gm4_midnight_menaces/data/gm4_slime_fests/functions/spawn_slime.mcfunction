# @s = slimeball item on the ground
# at @s
# called by event

summon slime ~ ~ ~ {Size:0,DeathLootTable:"minecraft:empty",ActiveEffects:[{Id:9,Amplifier:1,Duration:30}]}

playsound block.slime_block.hit hostile @a[distance=..16] ~ ~ ~ .6 .8
function gm4_slime_fests:absorb_slime_ball
