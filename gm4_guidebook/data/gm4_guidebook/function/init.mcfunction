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

data modify storage gm4_guidebook:register front_matter set value [{raw:["",{"translate":"gui.gm4.guidebook.page.intro","fallback": "","color": "white","font": "gm4:guidebook"},{"translate":"text.gm4.guidebook.introduction","fallback":"Introduction","underlined":true},{"text":"\n\n"},{"translate":"text.gm4.guidebook.letter","fallback":"This is a world unlike others. It appears that certain things work...differently to say the least.\n\nThis book will document discoveries regarding these new mechanics."},{"text":"\n\n> ","color":"#4AA0C7"},{"translate":"text.gm4.guidebook.refresh_findings","fallback":"Refresh Findings","color":"#4AA0C7","hover_event":{"action":"show_text","value":[{"translate":"text.gm4.guidebook.refresh_toc","fallback":"Refresh Table of Contents","color":"gold"}]},"click_event":{"action":"run_command","command":"/trigger gm4_guide set 1"}}]}]

# start up module
execute unless score guidebook gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Guidebook"}
execute unless score guidebook gm4_earliest_version < guidebook gm4_modules run scoreboard players operation guidebook gm4_earliest_version = guidebook gm4_modules
scoreboard players set guidebook gm4_modules 1

schedule function gm4_guidebook:main 2t
schedule function gm4_guidebook:tick 1t

#$moduleUpdateList
