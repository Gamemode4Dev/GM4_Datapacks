scoreboard players operation x gm4_orbis_config = x1 gm4_orbis_config
scoreboard players operation z gm4_orbis_config = z1 gm4_orbis_config

gamemode spectator @s
tag @s remove gm4_pre_gen_disabled
tellraw @a[gamemode=!survival,gamemode=!adventure] {"translate":"%1$s%3427655$s","with":["Orbis pre-gen started!",{"translate":"text.gm4.orbis_pre_gen.started"}],"color":"green"}

scoreboard players set pre_gen_running gm4_orbis_config 1
