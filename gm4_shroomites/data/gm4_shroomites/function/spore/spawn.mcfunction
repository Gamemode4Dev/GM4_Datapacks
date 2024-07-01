# spawns a spore at the location this function is run at
# @s = shroomite_shroom ready to spawn a spore
# at @s
# run from gm4_shroomites:shroom/process

# spawn spore unless the global spore cap has been reached
execute if score $global_spore_count gm4_shroom_data < #global_spore_cap gm4_shroom_data run function gm4_shroomites:spore/initialize

# set this shroom on cooldown
scoreboard players operation @s gm4_shroom_data += #spore_placement_cooldown gm4_shroom_data

# particles and sounds
playsound minecraft:block.chorus_flower.grow hostile @a[distance=..16] ~ ~ ~ 0.2 0
particle minecraft:mycelium ~ ~-0.35 ~ 0.2 0.07 0.2 1 96
