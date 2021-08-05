# @s = gm4_gv_analyzer that has been broken
# run from gm4_garden_variety:custom_crafters/update

# add scanning tag
tag @s add gm4_gv_analyzing

# increase timer
scoreboard players add @s gm4_gv_analyze 1

# audio
playsound minecraft:entity.villager.work_cartographer block @a[distance=..20]

# update percentage amount
scoreboard players set analyzing_percentage gm4_gv_analyze 200
scoreboard players operation analyzing_percentage gm4_gv_analyze /= analyzing_speed gm4_gv_analyze
scoreboard players operation @s gm4_gv_analyze_p = @s gm4_gv_analyze
scoreboard players add @s gm4_gv_analyze_p 1
scoreboard players operation @s gm4_gv_analyze_p *= analyzing_percentage gm4_gv_analyze
scoreboard players remove @s gm4_gv_analyze_p 20

