execute as @a[gamemode=!spectator,predicate=gm4_lumos_shamir:holding_lumos] at @s run function gm4_lumos_shamir:active
scoreboard players reset has_torches gm4_ml_data

schedule function gm4_lumos_shamir:main 16t
