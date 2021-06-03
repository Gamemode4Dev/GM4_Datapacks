scoreboard objectives add gm4_use_shield minecraft.used:minecraft.shield
scoreboard objectives add gm4_health health
scoreboard objectives add gm4_vs_data dummy

execute unless score vigere_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Vigere Shamir"}
scoreboard players set vigere_shamir gm4_modules 1

schedule function gm4_vigere_shamir:main 1t

#$moduleUpdateList
