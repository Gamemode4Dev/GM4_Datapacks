# @s = brewing stand marker with a custom splash potion to be converted to a lingering potion
# run from #gm4_brewing:insert/lingering

# brews potions into their proper lingering variants
loot spawn ~ ~ ~ loot gm4_example_pack:technical/brewing_stand/lingering

# clears vanishing potions and summons an illusioner at its place
execute if data entity @s data.gm4_brewing.insert{item:"minecraft:splash_potion",components:{"minecraft:custom_data":{custom_potion:"vanishing"}}} run scoreboard players set $insert gm4_brewing_data -1
execute if score $insert gm4_brewing_data matches -1 run summon illusioner
