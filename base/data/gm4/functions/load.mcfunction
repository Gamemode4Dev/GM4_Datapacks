data merge storage gm4:log {queue:[]}
data modify storage gm4:log queue append value {type:"text",message:'{"text":"[GM4]: Checking for updates...","color":"aqua"}'}

scoreboard players set gm4 load 1

scoreboard objectives add gm4_modules dummy
scoreboard objectives add gm4_data dummy

execute unless score gm4 gm4_modules matches 1.. run data modify storage gm4:log queue append value {type:"text",message:'{"text":"[GM4]: Welcome to Gamemode 4. Initialising...","color":"green"}'}
execute unless score gm4 gm4_modules matches 1.. run scoreboard players set gm4 gm4_modules 1
