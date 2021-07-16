# @s = any player who has the poison effect
# run from advancement "triggers/poison_effect"

advancement revoke @s only gm4_orb_of_ankou:triggers/poison_effect
effect clear @s[tag=gm4_pneuma_neutralizing] poison
effect clear @s[tag=gm4_pneuma_lifeless] poison
