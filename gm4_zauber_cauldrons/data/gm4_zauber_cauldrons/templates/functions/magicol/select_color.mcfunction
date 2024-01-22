# @s = heated magicol zauber cauldron with bottled magicol recipe inside
# at @s (center of block)
# run from recipes/magicol/bottled/select_bottle

# templates/functions/magicol/select_color.mcfunction

# check which color of bottled magicol to craft
# called functions are generated via beet from templates
# generated with the help of bolt
for color_data in ctx.meta['magicol_colors']:
    execute unless score $recipe_success gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients liquid.magicol{color:color_data['color']} run function f"gm4_zauber_cauldrons:recipes/magicol/bottled/{{bottle}}/{color_data['color']}/select_weather_modifier"
