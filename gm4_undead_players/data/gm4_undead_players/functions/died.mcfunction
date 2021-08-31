#run from gm4_undead_players:death advancement
#@s = player who took fatal damage

# Reset death tracking scoreboard and advancement to allow for the player to die again.
advancement revoke @s only gm4_undead_players:death
scoreboard players reset @s gm4_undead

# Summon undead player unless player has ignore tag or is in creative/spectator.
execute if entity @s[tag=!gm4_undead_ignore,gamemode=!creative,gamemode=!spectator] run function gm4_undead_players:summon_zombie
