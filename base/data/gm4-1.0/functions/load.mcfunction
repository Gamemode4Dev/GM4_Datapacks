execute unless data storage gm4:log queue run data merge storage gm4:log {queue:[]}
data modify storage gm4:log queue append value {type:"text",message:'[{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}],"color":"aqua"},{"translate":"%1$s%3427655$s","with":["Checking for updates...",{"translate":"text.gm4.modules.update.check"}],"color":"aqua"}]'}

scoreboard objectives add gm4_modules dummy
scoreboard objectives add gm4_data dummy

execute unless score gm4 gm4_modules matches 1.. run data modify storage gm4:log queue append value {type:"text",message:'[{"translate":"%1$s%3427655$s","with":["[GM4]: ",{"translate":"text.gm4.prefix"}],"color":"green"},{"translate":"%1$s%3427655$s","with":["Welcome to Gamemode 4. Initialising...",{"translate":"text.gm4.modules.init"}],"color":"green"}]'}
execute unless score gm4 gm4_modules matches 1.. run scoreboard players set gm4 gm4_modules 1
