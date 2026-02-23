# Assigns a score to this marker and reads it back. Kills the marker afterwards
# @s = test marker, just summoned
# at @s
# run from gm4:environment_check/score_on_non_player_entity

# set up marker & run test
scoreboard players set @s gm4_data 1

# depending on test outcome, set the 'result' object in storage. Base uses this to test if the check has completed.

# if the score is present, mark the check as passed by removing it from storage
execute unless score @s gm4_data matches 1 run data modify storage gm4:log environment_checks[{ecid:"gm4:score_on_non_player_entity"}].result set value {passed: 1b, probable_cause: ""}

# if no score is present, provide a probable cause message to the user
execute if score @s gm4_data matches 1 run data modify storage gm4:log environment_checks[{ecid:"gm4:score_on_non_player_entity"}].result set value {passed: 0b, probable_cause: "This may be caused by the Paper/Spigot setting 'scoreboards.allow-non-player-entities-on-scoreboards=false'."}

# clean up marker
scoreboard players reset @s gm4_data
kill @s
