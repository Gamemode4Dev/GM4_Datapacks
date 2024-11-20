execute unless score audere_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Audere Shamir"}
execute unless score audere_shamir gm4_earliest_version < audere_shamir gm4_modules run scoreboard players operation audere_shamir gm4_earliest_version = audere_shamir gm4_modules
scoreboard players set audere_shamir gm4_modules 1

schedule function gm4_audere_shamir:main 16t

#$moduleUpdateList
