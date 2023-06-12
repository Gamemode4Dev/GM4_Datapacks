data merge storage gm4:log {queue:[],versions:[]}
data modify storage gm4:log queue append value {type:"text",message:'{"text":"[GM4]: Checking for updates...","color":"#4AA0C7"}'}

scoreboard objectives add gm4_modules dummy
scoreboard objectives add gm4_data dummy

# Counts the number of consecutive reloads the player has not been seen in creative
scoreboard objectives add gm4_creative dummy
# Counts the number of consecutive reloads that no creative player has been seen
execute unless score $global gm4_creative matches 0.. run scoreboard players set $global gm4_creative 10
# Controls how long a player can keep seeing logs after they're no longer in creative
execute unless score $cooldown gm4_creative matches 0.. run scoreboard players set $cooldown gm4_creative 10
# Controls how long after no creative players were seen it will show logs to all players
# Setting this to 0 will always show logs to all players
execute unless score $global_cooldown gm4_creative matches 0.. run scoreboard players set $global_cooldown gm4_creative 10

execute unless score gm4 gm4_modules matches 1.. run data modify storage gm4:log queue append value {type:"text",message:'{"text":"[GM4]: Welcome to Gamemode 4. Initialising...","color":"green"}'}
execute unless score gm4 gm4_modules matches 1.. run schedule function gm4:intro_song/init 2s
execute unless score gm4 gm4_modules matches 1.. run scoreboard players set gm4 gm4_modules 1
