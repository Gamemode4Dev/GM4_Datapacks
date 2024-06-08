# @s = brewing stand marker with a custom potion to be converted to a splash potion
# run from #gm4_brewing:insert/splash

# brews potions into their proper splash variants
loot spawn ~ ~ ~ loot gm4_example_pack:technical/brewing_stand/splash

# clears vanishing potions and summons an evoker at its place
execute if data entity @s data.gm4_brewing.insert{item:"minecraft:splash_potion",components:{"minecraft:custom_data":{custom_potion:"vanishing"}}} run scoreboard players set $insert gm4_brewing_data -1
execute if score $insert gm4_brewing_data matches -1 run summon evoker
