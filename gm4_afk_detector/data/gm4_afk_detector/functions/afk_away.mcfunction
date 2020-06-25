team join gm4_afk @s[team=]
#For each team you have on your server, replace TEAM with the team name
#
#team join afk_TEAM @s[team=TEAM]
#
#Example:
#
#team join afk_Admin @s[team=Admin]

tag @s add gm4_afk

tellraw @a ["",{"selector":"@s"},{"text":" is now away from their keyboard","color":"gray"}]