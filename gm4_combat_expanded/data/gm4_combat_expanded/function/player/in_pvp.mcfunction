# add a timer for this player to be in pvp so they can be hit with certain modifiers
# @s = player damaging or being damaged by a player
# at @s
advancement revoke @s only gm4_combat_expanded:damaged/in_pvp

# set a pvp timer for 32 seconds
scoreboard players set @s gm4_ce_pvp_timer 40
