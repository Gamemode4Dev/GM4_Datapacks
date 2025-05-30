execute unless score lively_lily_pads gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Lively Lily Pads"}
execute unless score lively_lily_pads gm4_earliest_version < lively_lily_pads gm4_modules run scoreboard players operation lively_lily_pads gm4_earliest_version = lively_lily_pads gm4_modules
scoreboard players set lively_lily_pads gm4_modules 1

## GET BACK TO LATER
# detect pre-gm4 lively lily pads
#execute if data storage rc_blossoming_pots:storage version_history run scoreboard players set blossoming_pots gm4_earliest_version 0

scoreboard objectives add gm4_llp.data dummy "gm4_llp.data"
#scoreboard objectives add gm4_blossoming_pots.display_stage dummy "gm4_bPots.display_stage"
#scoreboard objectives add gm4_blossoming_pots.misc dummy "gm4_bPots.misc"

schedule function gm4_lively_lily_pads:main 1t
