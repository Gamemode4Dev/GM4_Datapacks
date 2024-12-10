execute unless score blossoming_pots gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Blossoming Pots"}
execute unless score blossoming_pots gm4_earliest_version < blossoming_pots gm4_modules run scoreboard players operation blossoming_pots gm4_earliest_version = blossoming_pots gm4_modules
scoreboard players set blossoming_pots gm4_modules 1

scoreboard objectives add gm4_blossoming_pots.range dummy "gm4_bPots.range"
scoreboard objectives add gm4_blossoming_pots.loop dummy "gm4_bPots.loop"
scoreboard objectives add gm4_blossoming_pots.merge_success dummy "gm4_bPots.merge_success"
scoreboard objectives add gm4_blossoming_pots.sound dummy "gm4_bPots.sound"

execute unless data storage gm4_blossoming_pots:decorated_pots {version_history:["1-26"]} run function gm4_blossoming_pots:decorated/set_storage
execute unless data storage gm4_blossoming_pots:flower_pots {version_history:["1-26"]} run function gm4_blossoming_pots:flower/set_storage

schedule function gm4_blossoming_pots:main 1t
