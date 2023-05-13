# validate structures of zauber cauldrons, branches off into recipe checks
execute as @e[type=marker,tag=gm4_zauber_cauldron,tag=!smithed.entity] run function gm4_zauber_cauldrons:upgrade_path/smithed_compat
execute as @e[type=marker,tag=gm4_zauber_cauldron] at @s run function gm4_zauber_cauldrons:cauldron/structure/validate/liquid

# player checks
execute as @a[gamemode=!spectator] run function gm4_zauber_cauldrons:player/submain

# prevent explosion handling
scoreboard players remove @e[scores={gm4_zc_no_explode=1..}] gm4_zc_no_explode 1

schedule function gm4_zauber_cauldrons:main 16t
