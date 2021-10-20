# Creates a Guardian from Prismarine Bricks
# @s = lightning bolt
# positioned 1 block above Prismarine Bricks
# run from lightning/check

setblock ~ ~-1 ~ air
summon guardian ~ ~-1 ~ {ActiveEffects:[{Id:10b,Duration:20,Amplifier:10b,ShowParticles:0b}]}
