scoreboard players set vertical_rails gm4_modules 1

execute unless score vertical_rails gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Vertical Rails"}

schedule function vertical_rails:main 1t
schedule function vertical_rails:tick 1t

#$moduleUpdateList
