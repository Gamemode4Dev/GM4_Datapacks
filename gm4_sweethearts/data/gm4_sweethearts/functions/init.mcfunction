scoreboard objectives add gm4_health health
scoreboard objectives add gm4_sh_data dummy

execute unless score sweethearts gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Sweethearts"}
scoreboard players set sweethearts gm4_modules 1

schedule function gm4_sweethearts:main 1t

#$moduleUpdateList
