scoreboard objectives add gm4_vigere_use minecraft.used:minecraft.shield
scoreboard objectives add gm4_health health

execute unless score vigere_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Vigere Shamir"}
execute unless score vigere_shamir gm4_earliest_version < vigere_shamir gm4_modules run scoreboard players operation vigere_shamir gm4_earliest_version = vigere_shamir gm4_modules
scoreboard players set vigere_shamir gm4_modules 1

schedule function gm4_vigere_shamir:main 1t

#$moduleUpdateList
