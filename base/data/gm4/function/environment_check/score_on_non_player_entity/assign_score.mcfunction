# Assigns a score to this marker and reads it back. Kills the marker afterwards
# @s = test marker, just summoned
# at @s
# run from gm4:environment_check/score_on_non_player_entity

# set up marker
scoreboard players set @s gm4.environment_check_results 1
scoreboard players operation $score_on_non_player_entity gm4.environment_check_results = @s gm4.environment_check_results

# clean up marker
scoreboard players reset @s gm4.environment_check_results
kill @s
