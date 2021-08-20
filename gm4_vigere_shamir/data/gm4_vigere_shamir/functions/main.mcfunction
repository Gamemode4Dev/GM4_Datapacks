execute as @a[gamemode=!spectator] if score @s gm4_vigere_use matches 1.. at @s[predicate=gm4_vigere_shamir:vigere_active] run function gm4_vigere_shamir:heal
scoreboard players reset @a gm4_vigere_use

schedule function gm4_vigere_shamir:check_heal 1t
schedule function gm4_vigere_shamir:main 16t
