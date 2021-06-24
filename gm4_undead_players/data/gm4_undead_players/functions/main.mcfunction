execute as @a[tag=!gm4_undead_ignore,scores={gm4_undead=1..}] at @s run function gm4_undead_players:died

scoreboard players reset @a gm4_undead

schedule function gm4_undead_players:main 16t
