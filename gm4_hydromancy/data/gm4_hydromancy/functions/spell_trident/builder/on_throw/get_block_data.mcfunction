# get block id and count
# @s = spell trident
# at @s
# run from spell_trident/builder/initialize

# store off-hand block id
data modify storage gm4_hydromancy:temp builder.block_id set from entity @s Inventory[{Slot:-106b}].id

# use up to 25 blocks
execute store result score $builder.block_count gm4_hy_data run data get entity @s Inventory[{Slot:-106b}].Count
scoreboard players operation $builder.blocks_keep gm4_hy_data = $builder.block_count gm4_hy_data
scoreboard players operation $builder.block_count gm4_hy_data < #25 gm4_hy_data
scoreboard players operation $builder.blocks_keep gm4_hy_data -= $builder.block_count gm4_hy_data
item modify entity @s[gamemode=!creative] weapon.offhand gm4_hydromancy:builder_blocks_remove
