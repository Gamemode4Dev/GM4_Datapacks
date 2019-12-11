#declare and initialise scoreboards and settings
scoreboard objectives add gm4_bees dummy
scoreboard objectives add gm4_hive_timer dummy
scoreboard objectives add gm4_bee_data dummy

scoreboard objectives add gm4_leaf_broken minecraft.mined:minecraft.oak_leaves
scoreboard players set #10 gm4_bee_data 10
scoreboard players set #100 gm4_bee_data 100
scoreboard players set #16 gm4_bee_data 16
scoreboard players set #10000 gm4_bee_data 10000

# set naturalRegeneration to false
gamerule naturalRegeneration false

execute unless score ambrosia gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Ambrosia"}
scoreboard players set ambrosia gm4_modules 1

schedule function gm4_ambrosia:main 1t
schedule function gm4_ambrosia:tick 1t

#$moduleUpdateList
