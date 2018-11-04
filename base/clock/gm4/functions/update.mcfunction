#This function runs every time a world/server is restarted or /reload is run.
#It checks for new modules, tells them to initialise and informs the player.

tellraw @a ["",{"text":"[GM4]: Checking for updates...","color":"aqua"}]
execute unless entity @p run say [GM4]: Checking for updates...

#set updateHappened to false until proven otherwise
scoreboard objectives add gm4_upCheck dummy
scoreboard players set updateHappened gm4_upCheck 0

#check if GM4 has been used here before
execute unless score gm4 gm4_upCheck matches 1.. run function gm4:init

#get all modules to check if they need installing
scoreboard players set installedModules gm4_upCheck 0
function #gm4:init_check

#announce success of update if one happened.
execute if score updateHappened gm4_upCheck matches 0 run tellraw @a ["",{"text":"[GM4]: No updates found.","color":"aqua"}]
execute unless entity @p run execute if score updateHappened gm4_upCheck matches 0 run say [GM4]: No updates found.
execute if score updateHappened gm4_upCheck matches 1 run tellraw @a ["",{"text":"[GM4]: Updates completed.","color":"aqua"}]
execute unless entity @p run execute if score updateHappened gm4_upCheck matches 1 run say [GM4]: Updates completed.
