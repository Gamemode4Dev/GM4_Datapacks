# Creates a Guardian from Prismarine Bricks
# @s = lightning bolt
# positioned 1 block above Prismarine Bricks
# run from lightning/check

setblock ~ ~ ~ air
summon guardian ~ ~ ~ {ActiveEffects:[{Id:10,Duration:20,Amplifier:10b,ShowParticles:0b}]}

# set fake player flag
scoreboard players set $found_block gm4_liab_data 1
