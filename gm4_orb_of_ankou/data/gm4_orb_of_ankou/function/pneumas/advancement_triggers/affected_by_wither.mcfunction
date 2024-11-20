# @s = any player who has the wither effect
# run from advancement "triggers/wither_effect"

advancement revoke @s only gm4_orb_of_ankou:triggers/wither_effect
effect clear @s[tag=gm4_pneuma_withering] wither
