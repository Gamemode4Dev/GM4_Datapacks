# check all cauldrons for their structure, branches off into recipe checks
execute as @e[type=area_effect_cloud,tag=gm4_zauber_cauldron] at @s run function gm4_zauber_cauldrons:cauldron/structure/check

# slow clock
scoreboard players add slow_clock gm4_zc_data 1
execute if score slow_clock gm4_zc_data matches 3.. run function gm4_zauber_cauldrons:slow_clock

# player checks
execute as @a[gamemode=!spectator] run function gm4_zauber_cauldrons:player/submain

schedule function gm4_zauber_cauldrons:main 16t
