execute unless score blossoming_pots gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Blossoming Pots"}
execute unless score blossoming_pots gm4_earliest_version < blossoming_pots gm4_modules run scoreboard players operation blossoming_pots gm4_earliest_version = blossoming_pots gm4_modules
scoreboard players set blossoming_pots gm4_modules 1

# detect pre-gm4 blossoming pots
execute if data storage rc_blossoming_pots:storage version_history run scoreboard players set blossoming_pots gm4_earliest_version 0

scoreboard objectives add gm4_blossoming_pots.range dummy "gm4_bPots.range"
scoreboard objectives add gm4_blossoming_pots.display_stage dummy "gm4_bPots.display_stage"
scoreboard objectives add gm4_blossoming_pots.misc dummy "gm4_bPots.misc"

function gm4_blossoming_pots:decorated/set_storage
function gm4_blossoming_pots:flower/set_storage

schedule function gm4_blossoming_pots:main 1t
