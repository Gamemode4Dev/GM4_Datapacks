
execute if block ~ ~ ~ #gm4_furniture:furniture_blocks[waterlogged=true] if entity @p[tag=gm4_furniture_target,predicate=gm4_furniture:holding_empty_bucket] run function gm4_furniture:interact/waterlog/unlog
execute if score $interaction_processed gm4_furniture_data matches 0 if block ~ ~ ~ #gm4_furniture:furniture_blocks[waterlogged=false] if entity @p[tag=gm4_furniture_target,predicate=gm4_furniture:holding_water_bucket] run function gm4_furniture:interact/waterlog/log
