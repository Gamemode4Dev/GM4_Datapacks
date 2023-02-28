execute unless score dripleaf_launchers gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Dripleaf Launchers"}
scoreboard players set dripleaf_launchers gm4_modules 1

scoreboard objectives add gm4_dl_data dummy

schedule function gm4_dripleaf_launchers:main 1t
schedule function gm4_dripleaf_launchers:tick 1t

#$moduleUpdateList
