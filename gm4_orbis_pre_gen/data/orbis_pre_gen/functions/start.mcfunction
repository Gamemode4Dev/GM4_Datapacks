scoreboard players operation x gm4_orbis_config = x1 gm4_orbis_config
scoreboard players operation z gm4_orbis_config = z1 gm4_orbis_config

gamemode spectator @s
tellraw @a[gamemode=!survival,gamemode=!adventure] [{"text":"Orbis Pre-gen started!","color":"green"}]

scoreboard players set pre_gen_running gm4_orbis_config 1
