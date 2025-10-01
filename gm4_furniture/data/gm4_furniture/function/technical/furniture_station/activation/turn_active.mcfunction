# turn furniture station on if no player interacted with it
# @s = furniture reactivation interaction entity
# at @s
# run from interact/process
# run from interact/furniture_station/swap_tool

# turn tool upright
execute align xyz run data merge entity @e[type=item_display,tag=gm4_furniture.tool_main,dx=0,dy=0,dz=0,limit=1] {interpolation_duration:5,start_interpolation:-1,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.6f,0f],scale:[1f,1f,1f]}}

# set temp ids for new villager
scoreboard players operation $temp gm4_furniture_id = @s gm4_furniture_id
scoreboard players operation $temp gm4_furniture_index = @s gm4_furniture_index
# spawn villager
execute align xyz positioned ~.5 ~1000.0001 ~.5 summon villager run function gm4_furniture:technical/furniture_station/init_villager
# reset temp scores
scoreboard players reset $temp gm4_furniture_id
scoreboard players reset $temp gm4_furniture_index

# mark interaction as complete and remove interaction entity
scoreboard players set $interaction_processed gm4_furniture_data 1
kill @s
