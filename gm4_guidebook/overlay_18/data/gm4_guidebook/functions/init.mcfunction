# set up scoreboards
scoreboard objectives add gm4_guide trigger
scoreboard objectives add gm4_guide_next trigger
scoreboard objectives add gm4_guide_prev trigger
scoreboard objectives add gm4_guide_id dummy
scoreboard objectives add gm4_guide_pages dummy
scoreboard objectives add gm4_guide_section dummy
scoreboard objectives add gm4_guide_config dummy

execute unless score $sendCommandFeedback gm4_guide_config = $sendCommandFeedback gm4_guide_config store result score $sendCommandFeedback gm4_guide_config run gamerule sendCommandFeedback
execute unless score $forceCommandFeedback gm4_guide_config = $forceCommandFeedback gm4_guide_config run scoreboard players set $forceCommandFeedback gm4_guide_config 0
execute unless score $giveNewPlayers gm4_guide_config = $giveNewPlayers gm4_guide_config run scoreboard players set $giveNewPlayers gm4_guide_config 1
scoreboard players set #100 gm4_guide 100
scoreboard players set #intro gm4_guide_pages 1
scoreboard players reset $module_count gm4_guide

#declare storage gm4_guidebook:temp
#declare storage gm4_guidebook:register
#declare storage gm4_guidebook:pages
schedule function gm4_guidebook:update_storage/setup_markers 1t

schedule function #gm4_guidebook:setup_storage 5t
data modify storage gm4_guidebook:pages lectern_front_matter set value ['["\\n\\n",{"translate":"gui.gm4.guidebook.page","fallback":"","color":"white","font":"gm4:guidebook"}]','["",{"translate":"gui.gm4.guidebook.page.toc","fallback":"","color":"white","font":"gm4:guidebook"}]','["\\n\\n",{"translate":"gui.gm4.guidebook.page","fallback":"","color":"white","font":"gm4:guidebook"}]','["\\n\\n",{"translate":"gui.gm4.guidebook.page","fallback":"","color":"white","font":"gm4:guidebook"}]','["\\n\\n",{"translate":"gui.gm4.guidebook.page","fallback":"","color":"white","font":"gm4:guidebook"}]']
data modify storage gm4_guidebook:pages blank set value '["\\n\\n",{"translate":"gui.gm4.guidebook.page","fallback":"","color":"white","font":"gm4:guidebook"}]'

# start up module
execute unless score guidebook gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Guidebook"}
execute unless score guidebook gm4_earliest_version < guidebook gm4_modules run scoreboard players operation guidebook gm4_earliest_version = guidebook gm4_modules
scoreboard players set guidebook gm4_modules 1

schedule function gm4_guidebook:main 2t
schedule function gm4_guidebook:tick 1t

#$moduleUpdateList
