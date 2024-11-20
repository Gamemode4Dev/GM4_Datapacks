# @s = heated water zauber cauldron with potion recipe inside
# at @s (center of block)
# run from recipes/potions/{{bottle}}/check_liquid

# templates/functions/potions/select_effect.mcfunction

# check which potion type to craft
# generated with the help of bolt
for effect_data in ctx.meta['potion_effects']:
    execute unless score $recipe_success gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{count:1,components:{"minecraft:custom_data":{gm4_zauber_cauldrons:{item:"{{bottle_item_id}}"}},"minecraft:potion_contents":{potion:effect_data['base_potion_id']}}}] run function f"gm4_zauber_cauldrons:recipes/potions/{{bottle}}/{effect_data['effect']}"
