# copy id and count onto passenger item
# @s = passenger item
# at @s
# run from spell_trident/builder/store_blocks

data modify entity @s Item.id set from storage gm4_hydromancy:temp builder.block_id
execute store result entity @s Item.Count int 1 run scoreboard players get $builder.block_count gm4_hy_data
tag @s remove gm4_hy_builder.new_blocks
