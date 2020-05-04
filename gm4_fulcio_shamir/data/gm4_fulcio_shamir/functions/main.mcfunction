execute as @e[type=area_effect_cloud,tag=gm4_fulcio_block] at @s run function gm4_fulcio_shamir:process_block

execute as @a[gamemode=!spectator,predicate=gm4_fulcio_shamir:holding_fulcio,scores={gm4_fulcio_sneak=1..}] at @s run function gm4_fulcio_shamir:active

scoreboard players reset @a gm4_fulcio_sneak

schedule function gm4_fulcio_shamir:main 16t
