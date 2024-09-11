execute if entity @a[limit=1] run function gm4:log_start
execute unless entity @a[limit=1] run schedule function gm4:log_wait 2t replace
