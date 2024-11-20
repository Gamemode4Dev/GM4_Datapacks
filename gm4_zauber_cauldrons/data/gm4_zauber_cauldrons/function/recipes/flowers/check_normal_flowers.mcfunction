# @s = boiling zauber cauldron with grass and enchanted_prismarine_shard and NO poisonous flowers inside.
# at center of block
# run from recipes/flowers/check_poisonous_flowers

# initialise fake player (required if all flowers are poisonous/gm4_zc_flowers=1)
scoreboard players set $normal_flowers_amount gm4_zc_fullness 0

# count normal flowers
for flower_data in ctx.meta['flower_types']:
    execute if score f"${flower_data['flower']}" gm4_zc_flowers matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:flower_data['item_id']}}}}] run scoreboard players add $normal_flowers_amount gm4_zc_fullness 1

# compare amount of normal flowers in cauldron to expected amount
execute if score $normal_flowers_amount gm4_zc_fullness = $required_flowers gm4_zc_flowers run function gm4_zauber_cauldrons:recipes/flowers/luck

# reset fake players
scoreboard players reset $normal_flowers_amount gm4_zc_fullness
