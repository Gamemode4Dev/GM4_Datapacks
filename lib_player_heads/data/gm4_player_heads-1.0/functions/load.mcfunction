scoreboard objectives add gm4_player_heads dummy

#declare storage gm4_player_heads:register

execute unless data storage gm4_player_heads:register heads run data merge storage gm4_player_heads:register {heads:[]}

scoreboard players set gm4_player_heads load 1
schedule function gm4_player_heads-1.0:main 9t
