execute unless score pig_tractors gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Pig Tractors"}
scoreboard players set pig_tractors gm4_modules 1

schedule function gm4_pig_tractors:tick 1t

#$moduleUpdateList
