execute as @a[gamemode=!creative,gamemode=!spectator,scores={gm4_sh_sneak=1..},predicate=gm4_sweethearts:holding_flower] at @s run function gm4_sweethearts:sneaking
scoreboard players reset @a gm4_sh_sneak

schedule function gm4_sweethearts:check_transfer 1t
schedule function gm4_sweethearts:main 16t
