scoreboard players operation #percent gm4_orbis_config = z gm4_orbis_config
scoreboard players operation #percent gm4_orbis_config -= z1 gm4_orbis_config
scoreboard players operation #percent gm4_orbis_config *= #100 gm4_orbis_config
scoreboard players operation #temp gm4_orbis_config = z2 gm4_orbis_config
scoreboard players operation #temp gm4_orbis_config -= z1 gm4_orbis_config
scoreboard players operation #percent gm4_orbis_config /= #temp gm4_orbis_config
tellraw @a[gamemode=!survival,gamemode=!adventure] [{"translate":"%1$s%3427655$s","with":["Progress: ",{"translate":"text.gm4.orbis_pre_gen.progress"}],"color":"aqua"},{"score":{"objective":"gm4_orbis_config","name":"z"},"color":"gold"},{"text":" [ ","color":"aqua"},{"score":{"objective":"gm4_orbis_config","name":"#percent"},"color":"gold"},{"text":"% ]","color":"aqua"}]
scoreboard players add z gm4_orbis_config 16
scoreboard players operation x gm4_orbis_config = x1 gm4_orbis_config
