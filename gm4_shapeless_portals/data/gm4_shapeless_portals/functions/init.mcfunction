execute unless score shapeless_portals gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Shapeless Portals"}
scoreboard players set shapeless_portals gm4_modules 1

scoreboard objectives add gm4_sp_data dummy
execute unless score $max_portal_size gm4_sp_data matches 0.. run scoreboard players set $max_portal_size gm4_sp_data 441

#$moduleUpdateList
