execute as @e[type=marker,tag=gm4_fulcio_block] at @s run function gm4_fulcio_shamir:process_block

execute as @a[gamemode=!spectator,scores={gm4_fulcio_sneak=1..},predicate=gm4_fulcio_shamir:holding_fulcio] at @s run function gm4_fulcio_shamir:active

scoreboard players reset @a gm4_fulcio_sneak

schedule function gm4_fulcio_shamir:main 16t
