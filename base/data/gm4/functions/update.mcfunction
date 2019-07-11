#This function runs every time after world/server is restarted or /reload is run and a player is online.
#It checks for new modules, tells them to initialise and informs the player.

tellraw @a [{"translate": "%1$s%3427655$s","with":["[GM4]: ",{"translate": "text.gm4.prefix"}],"color":"aqua"},{"translate": "%1$s%3427655$s","with":["Checking for updates...",{"translate": "text.gm4.modules.update.check"}],"color":"aqua"}]
execute unless entity @a[limit=1] run say [GM4]: Checking for updates...

#set update_happened to false until proven otherwise
scoreboard objectives add gm4_up_check dummy
scoreboard players set update_happened gm4_up_check 0

#check if GM4 has been used here before
execute unless score gm4 gm4_up_check matches 1.. run function gm4:init

#get all modules to check if they need installing
scoreboard players set installed_modules gm4_up_check 0
function #gm4:init_check

#announce success of update if one happened.
execute if score update_happened gm4_up_check matches 0 run tellraw @a [{"translate": "%1$s%3427655$s","with":["[GM4]: ",{"translate": "text.gm4.prefix"}],"color":"aqua"},{"translate": "%1$s%3427655$s","with":["No updates found.",{"translate": "text.gm4.modules.update.none_found"}],"color":"aqua"}]
execute unless entity @a[limit=1] run execute if score update_happened gm4_up_check matches 0 run say [GM4]: No updates found.
execute if score update_happened gm4_up_check matches 1 run tellraw @a [{"translate": "%1$s%3427655$s","with":["[GM4]: ",{"translate": "text.gm4.prefix"}],"color":"aqua"},{"translate": "%1$s%3427655$s","with":["Updates completed.",{"translate": "text.gm4.modules.update.completed"}],"color":"aqua"}]
execute unless entity @a[limit=1] run execute if score update_happened gm4_up_check matches 1 run say [GM4]: Updates completed.

#prints scheduled out-of-date messages to chat
execute if score current_tick gm4_clock_tick matches 0 if entity @a[limit=1] if entity @e[type=area_effect_cloud,tag=gm4_update_message,limit=1] run function gm4:out_of_date
