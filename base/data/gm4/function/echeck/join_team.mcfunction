# Assigns a score to this marker and reads it back. Kills the marker afterwards
# @s = test marker, just summoned
# at @s
# run from gm4:echeck/non_player_entity_has_score
# set up marker & run test
team add gm4_echeck_non_player_entity_on_team_temp
team join gm4_echeck_non_player_entity_on_team_temp @s

# depending on test outcome, set the 'result' object in storage. Base uses this to test if the check has completed.

# if the marker is now on the team, mark the check as passed by removing it from storage
execute if entity @s[team=gm4_echeck_non_player_entity_on_team_temp] run data modify storage gm4:log echecks[{echeck_id:"gm4:echeck/non_player_entity_has_score"}].result set value {passed:1,probable_cause:""}

# if the marker is not on the team, provide a probable cause message to the user
execute unless entity @s[team=gm4_echeck_non_player_entity_on_team_temp] run data modify storage gm4:log echecks[{echeck_id:"gm4:echeck/non_player_entity_has_score"}].result set value {passed:0,probable_cause:"This may be caused by the Paper/Spigot setting 'scoreboards.allow-non-player-entities-on-scoreboards=false'."}

# clean up
team remove gm4_echeck_non_player_entity_on_team_temp
kill @s
