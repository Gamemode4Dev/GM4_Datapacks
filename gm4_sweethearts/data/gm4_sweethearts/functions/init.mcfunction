scoreboard objectives add gm4_sh_health dummy
scoreboard objectives add gm4_sh_data dummy
scoreboard players set #10 gm4_sh_health 10 

execute unless score sweethearts gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Sweethearts"}
execute unless score sweethearts gm4_earliest_version < sweethearts gm4_modules run scoreboard players operation sweethearts gm4_earliest_version = sweethearts gm4_modules
scoreboard players set sweethearts gm4_modules 1

schedule function gm4_sweethearts:main 1t



#$moduleUpdateList
