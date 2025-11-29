# Tests if non-player entities can hold scores. Default-config Spigot fails this test.
# @s = unspecified
# at unspecified
# run from modules which require this environment check

# if there is no recent echeck result, re-run echeck
execute unless data storage gm4:environment_checks result.score_on_non_player_entity summon marker run function gm4:environment_check/score_on_non_player_entity/assign_score

# return result
return run data get storage gm4:environment_checks result.score_on_non_player_entity.passed
