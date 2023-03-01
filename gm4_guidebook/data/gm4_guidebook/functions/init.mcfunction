# set up scoreboards
scoreboard objectives add gm4_count dummy
scoreboard objectives add gm4_guide trigger
scoreboard objectives add gm4_guide_config dummy
execute unless score $sendCommandFeedback gm4_guide_config = $sendCommandFeedback gm4_guide_config store result score $sendCommandFeedback gm4_guide_config run gamerule sendCommandFeedback
execute unless score $forceCommandFeedback gm4_guide_config = $forceCommandFeedback gm4_guide_config run scoreboard players set $forceCommandFeedback gm4_guide_config 0
execute unless score $giveNewPlayers gm4_guide_config = $giveNewPlayers gm4_guide_config run scoreboard players set $giveNewPlayers gm4_guide_config 1
scoreboard players set #100 gm4_guide 100
scoreboard players set #intro_pages gm4_guide 1
scoreboard players reset $module_count gm4_guide

#declare storage gm4_guidebook:temp
#declare storage gm4_guidebook:register
schedule function gm4_guidebook:update_storage/build_toc 2t

# start up module
execute unless score guidebook gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Guidebook"}
scoreboard players set guidebook gm4_modules 1

schedule function gm4_guidebook:main 2t
schedule function gm4_guidebook:tick 1t

#$moduleUpdateList
