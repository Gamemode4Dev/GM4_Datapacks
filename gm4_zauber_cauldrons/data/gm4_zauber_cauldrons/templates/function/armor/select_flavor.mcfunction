# @s = heated water zauber cauldron with enchanted prismarine shard and golden {{piece}} inside
# at @s (center of block)
# run from recipe/armor/select_piece

# templates/functions/armor/select_flavor.mcfunction
# generated with the help of bolt
for flavor_data in ctx.meta['armor_flavors']:
    execute unless score $recipe_success gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:flavor_data['ingredient_item_id']}}}}] run function f"gm4_zauber_cauldrons:recipes/armor/{{piece}}/{flavor_data['flavor']}"
