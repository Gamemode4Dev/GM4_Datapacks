# @s = any player who has been damaged by fire
# run from advancement "triggers/fire_damaged"

advancement revoke @s only gm4_orb_of_ankou:triggers/fire_damaged
effect give @s[tag=gm4_pneuma_incombustible] fire_resistance 15 0
