# turn furniture station on if no player interacted with it
# @s = furniture reactivation interaction entity
# at @s
# run from technical/furniture_station/activation/process
# run frin interact/furniture_station/swap_tool

# turn tool upright
execute align xyz run data merge entity @e[type=item_display,tag=gm4_furniture.tool_main,dx=0,dy=0,dz=0,limit=1] {interpolation_duration:5,start_interpolation:-1,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.6f,0f],scale:[1f,1f,1f]}}

# spawn villager and set ids
execute align xyz positioned ~.5 ~1000.0001 ~.5 summon villager run function gm4_furniture:technical/furniture_station/init_villager
scoreboard players operation @e[type=villager,tag=gm4_new_furniture,limit=1,distance=..4] gm4_furniture_id = @s gm4_furniture_id
scoreboard players operation @e[type=villager,tag=gm4_new_furniture,limit=1,distance=..4] gm4_furniture_index = @s gm4_furniture_index
tag @e[type=villager,tag=gm4_new_furniture,limit=1,distance=..4] remove gm4_new_furniture

# mark interaction as complete and remove interaction entity
scoreboard players set $interaction_processed gm4_furniture_data 1
kill @s
