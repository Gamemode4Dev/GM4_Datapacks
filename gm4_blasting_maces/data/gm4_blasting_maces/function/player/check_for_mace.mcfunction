# Checks whether the player has used a blasting mace
# @s = player
# at world spawn
# run from gm4_blasting_maces:tick

execute if entity @s[scores={gm4_blast_use_mace=1..},predicate=gm4_blasting_maces:blasting_level_1] at @s run function gm4_blasting_maces:player/blast

# reset mace use score
scoreboard players reset @s gm4_blast_use_mace
