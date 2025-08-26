# creates the custom crafter in a dropper
# @s = player who opened the dropper while holding a crafting table
# located at align xyz of the dropper
# run from gm4_custom_crafters:machine/craft_in_place/find_dropper

# get rotation of original dropper
execute if block ~ ~ ~ dropper[facing=down] run scoreboard players set $rotation gm4_machine_data 1
execute if block ~ ~ ~ dropper[facing=up] run scoreboard players set $rotation gm4_machine_data 2
execute if block ~ ~ ~ dropper[facing=south] run scoreboard players set $rotation gm4_machine_data 3
execute if block ~ ~ ~ dropper[facing=west] run scoreboard players set $rotation gm4_machine_data 4
execute if block ~ ~ ~ dropper[facing=north] run scoreboard players set $rotation gm4_machine_data 5
execute if block ~ ~ ~ dropper[facing=east] run scoreboard players set $rotation gm4_machine_data 6

# replace original dropper to clear inv and force-close GUI
setblock ~ ~ ~ air

# take 1 crafting table from survival/adventure players
clear @s[gamemode=!creative,gamemode=!spectator] crafting_table 1

# create custom crafter
execute positioned ~.5 ~.5 ~.5 run function gm4_custom_crafters:machine/create
advancement grant @s only gm4:custom_crafters
