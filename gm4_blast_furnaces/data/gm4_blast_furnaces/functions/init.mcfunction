scoreboard objectives add gm4_bf_data dummy

execute unless score blast_furnaces gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Blast Furnaces"}
scoreboard players set blast_furnaces gm4_modules 1

schedule function gm4_blast_furnaces:main 1t
schedule function gm4_blast_furnaces:tick 1t

#$moduleUpdateList
