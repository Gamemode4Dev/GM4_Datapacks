scoreboard objectives add gm4_craft_shapeless dummy

execute unless score auto_crafting gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Auto Crafting"}
scoreboard players set auto_crafting gm4_modules 1

#$moduleUpdateList
