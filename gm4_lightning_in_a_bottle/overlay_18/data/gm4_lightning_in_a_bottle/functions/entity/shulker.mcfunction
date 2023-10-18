# Creates a Shulker from a Purpur Block
# @s = lightning bolt
# positioned 1 block above a Purpur Block
# run from lightning/check

setblock ~ ~ ~ air
summon shulker ~ ~-.49 ~ {ActiveEffects:[{Id:10,Duration:20,Amplifier:10b,ShowParticles:0b}],Color:16,DeathLootTable:"gm4_lightning_in_a_bottle:entities/shulker"}

advancement grant @a[distance=..5,gamemode=!spectator] only gm4:lightning_in_a_bottle_shulker

# set fake player flag
scoreboard players set $found_block gm4_liab_data 1
