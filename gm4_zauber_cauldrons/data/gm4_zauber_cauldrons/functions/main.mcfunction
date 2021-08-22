# validate structures of zauber cauldrons, branches off into recipe checks
execute as @e[type=marker,tag=gm4_zauber_cauldron] at @s run function gm4_zauber_cauldrons:cauldron/structure/validate/liquid

# player checks
execute as @a[gamemode=!spectator] run function gm4_zauber_cauldrons:player/submain

schedule function gm4_zauber_cauldrons:main 16t
