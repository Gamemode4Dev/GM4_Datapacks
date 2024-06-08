execute unless score percurro_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Percurro Shamir"}
execute unless score percurro_shamir gm4_earliest_version < percurro_shamir gm4_modules run scoreboard players operation percurro_shamir gm4_earliest_version = percurro_shamir gm4_modules
scoreboard players set percurro_shamir gm4_modules 1

#$moduleUpdateList
