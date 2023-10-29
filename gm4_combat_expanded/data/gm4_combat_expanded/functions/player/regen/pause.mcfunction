# stop regen when player gets damaged by something other than a fall
# @s = damaged player
# at @s
advancement revoke @s only gm4_combat_expanded:damaged/stop_regen

scoreboard players set @s gm4_ce_natural_regen_damage 10
#TODO: remove
say damaged
