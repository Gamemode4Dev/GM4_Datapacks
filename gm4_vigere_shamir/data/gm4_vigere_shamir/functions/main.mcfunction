execute as @a[predicate=gm4_vigere_shamir:vigere_active] if score @s gm4_use_shield matches 1.. at @s run function gm4_vigere_shamir:heal
scoreboard players reset @a gm4_use_shield

schedule function gm4_vigere_shamir:check_heal 1t
schedule function gm4_vigere_shamir:main 16t
