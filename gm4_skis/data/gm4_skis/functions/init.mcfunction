execute unless score skis gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Skis"}
scoreboard players set skis gm4_modules 1

# add scoreboard to detect whether the player is on a snowy block
scoreboard objectives add gm4_ski_on_snow dummy

schedule function gm4_skis:main 10t

#$moduleUpdateList
