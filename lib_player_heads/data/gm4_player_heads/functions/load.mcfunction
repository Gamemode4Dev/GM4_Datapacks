scoreboard objectives add gm4_player_heads dummy

#declare storage gm4_player_heads:register

execute unless data storage gm4_player_heads:register heads run data merge storage gm4_player_heads:register {heads:[]}

schedule function gm4_player_heads:main 9t
schedule clear gm4_player_heads-1.0:main
