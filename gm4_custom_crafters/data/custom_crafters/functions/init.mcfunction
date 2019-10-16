scoreboard objectives add gm4_slot_count dummy
scoreboard objectives add gm4_stack_size dummy

scoreboard players set custom_crafters gm4_modules 1

execute unless score custom_crafters gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Custom Crafters"}

schedule function custom_crafters:main 1t

#$moduleUpdateList
