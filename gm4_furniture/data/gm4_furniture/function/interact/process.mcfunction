# process interacting (right-click) on furniture
# @s = furniture's interacted interaction entity
# at @s
# run from itneract/detect

# first successful interaction will be used, any lower down this list will be ignored
scoreboard players set $interaction_processed gm4_furniture_data 0

# check for reactivating furniture tables
execute if score $interaction_processed gm4_furniture_data matches 0 if entity @s[tag=gm4_furniture.reactivate] run function gm4_furniture:technical/furniture_station/activation/turn_active

# check for waterlogging
execute if score $interaction_processed gm4_furniture_data matches 0 if entity @p[tag=gm4_furniture_target,predicate=gm4_furniture:holding_bucket] positioned ~ ~0.5 ~ run function gm4_furniture:interact/waterlog/check

# check for furniture station interactions
execute if score $interaction_processed gm4_furniture_data matches 0 if entity @s[tag=gm4_furniture.swap_tool] align xyz run function gm4_furniture:interact/furniture_station/swap_tool

# check for painting
execute if score $interaction_processed gm4_furniture_data matches 0 if entity @s[tag=gm4_furniture.dyable] if entity @p[tag=gm4_furniture_target,predicate=gm4_furniture:holding_paintbrush] run function gm4_furniture:interact/paint/detect

# check for sitting
execute if score $interaction_processed gm4_furniture_data matches 0 if entity @s[scores={gm4_furniture_sit_height=1..}] if entity @p[tag=gm4_furniture_target,predicate=!gm4_furniture:is_sneaking] positioned ~-0.4999 ~0.0001 ~-0.4999 run function gm4_furniture:interact/sit/find_seat

# check for custom interactions
execute if score $interaction_processed gm4_furniture_data matches 0 if entity @s[tag=gm4_furniture.custom_interaction] run function gm4_furniture:interact/custom/process

# cleanup
data remove entity @s interaction
