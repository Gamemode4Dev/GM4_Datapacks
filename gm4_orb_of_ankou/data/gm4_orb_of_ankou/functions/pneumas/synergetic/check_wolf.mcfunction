# @s = wolves near a player with synergetic pneuma
# located at the player with synergetic pneuma
# run from pneumas/synergetic/apply

data modify storage gm4_orb_of_ankou:synergetic Owner set from entity @s Owner
execute store success score @s gm4_pneuma_data run data modify storage gm4_orb_of_ankou:synergetic Owner set from entity @p[distance=..0.1,tag=gm4_pneuma_synergetic] UUID
