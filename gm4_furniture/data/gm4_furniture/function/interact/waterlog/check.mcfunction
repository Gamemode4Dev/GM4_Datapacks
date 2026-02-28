# check if the furniture should waterlog or water-unlog
# @s = player holding bucket
# at furniture's interacted interaction entity
# run from interact/process

# mainhand
scoreboard players set $mainhand_bucket gm4_furniture_data 1
execute if block ~ ~ ~ #gm4_furniture:furniture_blocks[waterlogged=true] if items entity @s weapon.mainhand minecraft:bucket run function gm4_furniture:interact/waterlog/unlog
execute if score $interaction_processed gm4_furniture_data matches 0 if block ~ ~ ~ #gm4_furniture:furniture_blocks[waterlogged=false] if items entity @s weapon.mainhand minecraft:water_bucket run function gm4_furniture:interact/waterlog/log
# offhand
execute if score $interaction_processed gm4_furniture_data matches 0 run scoreboard players set $mainhand_bucket gm4_furniture_data 0
execute if score $interaction_processed gm4_furniture_data matches 0 if block ~ ~ ~ #gm4_furniture:furniture_blocks[waterlogged=true] if items entity @s weapon.offhand minecraft:bucket run function gm4_furniture:interact/waterlog/unlog
execute if score $interaction_processed gm4_furniture_data matches 0 if block ~ ~ ~ #gm4_furniture:furniture_blocks[waterlogged=false] if items entity @s weapon.offhand minecraft:water_bucket run function gm4_furniture:interact/waterlog/log
