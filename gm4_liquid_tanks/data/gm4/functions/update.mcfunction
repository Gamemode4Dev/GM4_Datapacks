tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Checking for updates...","color":"aqua"}]
execute unless entity @p run say GM4: Checking for updates...

#set update_happened to false until proven otherwise
scoreboard objectives add gm4_up_check dummy
scoreboard players set update_happened gm4_up_check 0

#check if GM4 has been used here before
execute unless score gm4 gm4_up_check matches 1.. run function gm4:init

#get all modules to check if they need installing
scoreboard players set installed_modules gm4_up_check 0
function #gm4:init_check

#announce success of update if one happened.
execute if score update_happened gm4_up_check matches 0 run tellraw @a[gamemode=creative] ["",{"text":"[GM4]: No updates found.","color":"aqua"}]
execute unless entity @p run execute if score update_happened gm4_up_check matches 0 run say GM4: No updates found.
execute if score update_happened gm4_up_check matches 1 run tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Updates completed.","color":"aqua"}]
execute unless entity @p run execute if score update_happened gm4_up_check matches 1 run say GM4: Updates completed.
