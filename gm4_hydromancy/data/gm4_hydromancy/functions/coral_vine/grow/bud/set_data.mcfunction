# set data for this coral bud
# @s = coral bud (block marker)
# at @s
# run from coral_vine/grow/bud/east
# run from coral_vine/grow/bud/north
# run from coral_vine/grow/bud/south
# run from coral_vine/grow/bud/west

tag @s add gm4_hy_coral_flower

# calculate some variability to the display location
execute store result score $var1 gm4_hy_data run data get entity @s UUID[1]
execute store result score $var2 gm4_hy_data run data get entity @s UUID[2]
scoreboard players operation $var1 gm4_hy_data %= #49 gm4_hy_data
scoreboard players operation $var2 gm4_hy_data %= #49 gm4_hy_data
scoreboard players add $var1 gm4_hy_data 1
scoreboard players add $var2 gm4_hy_data 1
