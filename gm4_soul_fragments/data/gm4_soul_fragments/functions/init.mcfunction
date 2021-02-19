scoreboard objectives add gm4_sf_died minecraft.custom:minecraft.deaths
scoreboard objectives add gm4_sf_die_totem minecraft.used:minecraft.totem_of_undying
scoreboard objectives add gm4_sf_rspwn dummy
scoreboard objectives add gm4_sf_id dummy
scoreboard objectives add gm4_sf_m_id dummy
scoreboard objectives add gm4_sf_o_id dummy
scoreboard objectives add gm4_sf_fragments dummy
scoreboard objectives add gm4_sf_timer dummy
scoreboard objectives add gm4_sf_m_timer dummy
scoreboard objectives add gm4_sf_o_timer dummy
scoreboard objectives add gm4_sf_fire dummy

execute unless score soul_fragments gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Soul Fragments"}
scoreboard players set soul_fragments gm4_modules 1

schedule function gm4_soul_fragments:main 10t

#$moduleUpdateList
