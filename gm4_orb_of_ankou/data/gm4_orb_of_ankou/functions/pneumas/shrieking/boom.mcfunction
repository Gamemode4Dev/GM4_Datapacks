# @s = entity hit by sonic boom
# run from pneumas/shrieking/find_target

execute if entity @s[type=player,gamemode=!creative,gamemode=!spectator] run function gm4_orb_of_ankou:pneumas/shrieking/boom_player
execute unless entity @s[type=player] run function gm4_orb_of_ankou:pneumas/shrieking/boom_mob
