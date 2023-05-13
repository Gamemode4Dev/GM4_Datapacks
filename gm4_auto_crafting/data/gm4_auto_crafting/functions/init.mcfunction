scoreboard objectives add gm4_craft_shapeless dummy
scoreboard objectives add gm4_ac_slot_count dummy
scoreboard objectives add gm4_ac_shape dummy
scoreboard objectives add gm4_ac_buffer dummy

execute unless score auto_crafting gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Auto Crafting"}
scoreboard players set auto_crafting gm4_modules 1

schedule function gm4_auto_crafting:main 5t
schedule function gm4_auto_crafting:tick 1t

#$moduleUpdateList
