execute unless score blasting_maces gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Blasting Maces"}
execute unless score blasting_maces gm4_earliest_version < blasting_maces gm4_modules run scoreboard players operation blasting_maces gm4_earliest_version = blasting_maces gm4_modules
scoreboard players set blasting_maces gm4_modules 1

# scoreboards for module data
scoreboard objectives add gm4_blast_data dummy

# scoreboard for tracking mace usage
scoreboard objectives add gm4_blast_use_mace used:mace

# scoreboards for player rotation
scoreboard objectives add gm4_blast_pitch dummy
scoreboard objectives add gm4_blast_yaw dummy

# schedule main loop
schedule function gm4_blasting_maces:tick 1t
