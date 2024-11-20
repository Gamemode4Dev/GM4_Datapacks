#run from #gm4_player_death:grave
#@s = player who took fatal damage

# Summon undead player unless player has ignore tag or is in creative/spectator.
execute if entity @s[tag=!gm4_undead_ignore,gamemode=!creative,gamemode=!spectator] run function gm4_undead_players:summon_zombie
