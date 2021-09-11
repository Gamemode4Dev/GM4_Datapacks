# @s = gm4_gv_analyzer that has been broken
# run from gm4_garden_variety:custom_crafters/update

# add scanning tag
tag @s add gm4_gv_analyzing

# increase timer
scoreboard players add @s gm4_gv_analyzer 1

# audio
playsound minecraft:entity.villager.work_cartographer block @a[distance=..20]

# get analyzing percentage
scoreboard players set $analyzing_time_percentage gm4_gv_analyzer 200
scoreboard players operation $analyzing_time_percentage gm4_gv_analyzer /= $analyzing_time_required gm4_gv_analyze

# get burn time amount
scoreboard players operation @s gm4_gv_analyze_p = @s gm4_gv_analyze
scoreboard players operation @s gm4_gv_analyze_p *= $analyzing_time_percentage gm4_gv_analyze

