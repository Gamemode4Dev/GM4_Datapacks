# set scores and stats for tamed horse
# @s = tamed horse
# at unspecified
# run from level/tame_horse

tag @s add gm4_horse.tamed

scoreboard players set @s gm4_horse.level 0
scoreboard players set @s gm4_horse.experience_to_level 60

# remove wild horse boost
attribute @s max_health modifier remove gm4_horse:untamed
attribute @s movement_speed modifier remove gm4_horse:untamed
