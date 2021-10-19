# set up scoreboards
scoreboard objectives add gm4_guide trigger
execute unless score $sendCommandFeedback gm4_guide = $sendCommandFeedback gm4_guide store result score $sendCommandFeedback gm4_guide run gamerule sendCommandFeedback
execute unless score $forceCommandFeedback gm4_guide = $forceCommandFeedback gm4_guide run scoreboard players set $forceCommandFeedback gm4_guide 0
scoreboard players set #intro_pages gm4_guide 1
scoreboard players reset $module_count gm4_guide

# update the contents of the table of contents
data merge storage gm4_guidebook:pre_analyze {modules:[]}
data merge storage gm4_guidebook:front_matter {table_of_contents:[],pages:[]}
execute positioned ~ 0 ~ run function gm4_guidebook:analyze_storage/get_modules
schedule function gm4_guidebook:analyze_storage/interpret/schedule 1t


# start up module
execute unless score guidebook gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Guidebook"}
scoreboard players set guidebook gm4_modules 1

schedule function gm4_guidebook:main 2t
schedule function gm4_guidebook:tick 1t

#$moduleUpdateList
