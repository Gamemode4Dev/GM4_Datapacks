# @s = brewing stand marker with a custom potion to be converted to a splash potion
# run from #gm4_brewing:insert/splash
# NOTE: this will only run if #gm4_brewing:insert/splash is changed to have this function in the "values" instead of in "_example_values"

# brews potions into their proper splash variants
loot spawn ~ ~ ~ loot _example_gm4_brewing:technical/brewing_stand/splash

# clears vanishing potions and summons an evoker at its place
execute if data entity @s data.gm4_brewing.insert{item:"minecraft:splash_potion",tag:{custom_potion:"vanishing"}} run scoreboard players set $insert gm4_brewing_data -1
execute if score $insert gm4_brewing_data matches -1 run summon evoker
