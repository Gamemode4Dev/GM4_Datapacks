# init data handling for when pre-gm4 blossoming pots is detected
# run from init

# set earliest version to 0 to run all upgrade paths
scoreboard players set blossoming_pots gm4_earliest_version 0

# add to version history
execute unless data storage gm4_blossoming_pots:decorated_pots {version_history:["pre-gm4"]} \
    run data modify storage gm4_blossoming_pots:decorated_pots version_history prepend value "pre-gm4"
execute unless data storage gm4_blossoming_pots:flower_pots {version_history:["pre-gm4"]} \
    run data modify storage gm4_blossoming_pots:flower_pots version_history prepend value "pre-gm4"
