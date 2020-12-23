# init
scoreboard objectives add gm4_podzol_data dummy
scoreboard players set #100 gm4_podzol_data 100
scoreboard players set #200 gm4_podzol_data 200

# This module includes the gm4 forceload library. If you didn't get this pack from our website, make sure you have the gm4 forceload library installed!

# base
execute unless score podzol_rooting_soil gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Podzol Rooting Soil"}
scoreboard players set podzol_rooting_soil gm4_modules 1

schedule function gm4_podzol_rooting_soil:main 10t

#$moduleUpdateList
