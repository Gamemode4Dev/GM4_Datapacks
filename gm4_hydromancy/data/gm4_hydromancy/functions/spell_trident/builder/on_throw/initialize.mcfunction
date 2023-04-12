# initialize this spell trident spell
# @s = spell trident
# at @s
# run from spell_trident/init_trident

tag @s add gm4_hy_spell_trident.builder

data modify entity @s damage set value 0.0d
data modify entity @s pickup set value 0b
data modify entity @s SoundEvent set value "minecraft:block.conduit.activate"

# store block id and count on passenger item
scoreboard players set $builder.block_count gm4_hy_data 0
execute on origin if predicate gm4_hydromancy:valid_builder_blocks run function gm4_hydromancy:spell_trident/builder/on_throw/get_block_data
execute if score $builder.block_count gm4_hy_data matches 1.. run function gm4_hydromancy:spell_trident/builder/on_throw/store_blocks
execute unless score $builder.block_count gm4_hy_data matches 1.. run function gm4_hydromancy:spell_trident/builder/on_throw/no_blocks
data remove storage gm4_hydromancy:temp builder
