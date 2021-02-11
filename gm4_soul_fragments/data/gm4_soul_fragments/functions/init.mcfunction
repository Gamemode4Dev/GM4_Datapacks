#gm4_sf_died resets right after dying, while gm4_sf_rspwn resets after respawning

scoreboard objectives add gm4_sf_died minecraft.custom:minecraft.deaths
scoreboard objectives add gm4_sf_rspwn minecraft.custom:minecraft.deaths
scoreboard objectives add gm4_sf_id dummy
scoreboard objectives add gm4_sf_fragments dummy
scoreboard objectives add gm4_sf_age dummy
scoreboard objectives add gm4_sf_regen dummy

execute unless score soul_fragments gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Soul Fragments"}
scoreboard players set soul_fragments gm4_modules 1

schedule function gm4_soul_fragments:main 10t

#$moduleUpdateList
