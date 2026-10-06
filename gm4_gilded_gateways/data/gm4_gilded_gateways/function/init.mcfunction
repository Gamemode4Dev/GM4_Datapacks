execute unless score gilded_gateways gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Gilded Gateways"}
execute unless score gilded_gateways gm4_earliest_version < gilded_gateways gm4_modules run scoreboard players operation gilded_gateways gm4_earliest_version = gilded_gateways gm4_modules
scoreboard players set gilded_gateways gm4_modules 1

scoreboard objectives add gm4_gilded_gateways dummy

schedule function gm4_gilded_gateways:tick 1t
