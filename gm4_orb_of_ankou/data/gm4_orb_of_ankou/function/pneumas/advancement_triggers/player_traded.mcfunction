# @s = any player who has traded with a villager
# run from advancement "triggers/traded"

advancement revoke @s only gm4_orb_of_ankou:triggers/traded
effect give @s[tag=gm4_pneuma_bargaining] minecraft:regeneration 4 1
xp add @s[tag=gm4_pneuma_bargaining] 50 points
