scoreboard objectives add gm4_calling_bell dummy
scoreboard objectives add gm4_calling_bell_rung minecraft.custom:minecraft.bell_ring

execute unless score calling_bell gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Calling Bell"}
scoreboard players set calling_bell gm4_modules 1

schedule function gm4_calling_bell:tick 1t
schedule function gm4_calling_bell:day_clock 10t

#$moduleUpdateList
