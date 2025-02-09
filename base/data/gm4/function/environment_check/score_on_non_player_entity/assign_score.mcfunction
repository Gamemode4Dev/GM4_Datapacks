# Assigns a score to this marker and reads it back. Kills the marker afterwards
# @s = test marker, just summoned
# at @s
# run from gm4:environment_check/score_on_non_player_entity

# set up marker & run test
scoreboard players set @s gm4_data 1

# if the score is present, mark the check as passed
execute if score @s gm4_data matches 1 run data modify storage gm4:environment_checks result set value {score_on_non_player_entity: {passed: 1b}}

# (optional) if no score is present, provide a probible cause message to the user
execute unless score @s gm4_data matches 1 run data modify storage gm4:environment_checks result set value {score_on_non_player_entity: {"probable_cause": "This may be caused by the Paper/Spigot setting 'scoreboards.allow-non-player-entities-on-scoreboards=true'."}}

# clean up marker
scoreboard players reset @s gm4_data
kill @s
