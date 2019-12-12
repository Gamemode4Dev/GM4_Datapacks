execute if entity @a[gamemode=creative,limit=1] run function gm4.1:log
execute unless entity @a[gamemode=creative,limit=1] run schedule function gm4.1:log_wait 2t replace
