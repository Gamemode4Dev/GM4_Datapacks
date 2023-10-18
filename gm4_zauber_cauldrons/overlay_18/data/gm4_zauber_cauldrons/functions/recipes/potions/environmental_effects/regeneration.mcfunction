# @s = boiling zauber cauldron with recipe inside
# at center of block
# run from recipes/potions/ recipes
# applies environmental effects caused by recipes

summon area_effect_cloud ~ ~.75 ~ {CustomName:'"the mess they made"',Radius:1.8f,duration:2147483647,RadiusOnUse:-0.01f,RadiusPerTick:-0.0002f,ReapplicationDelay:40,effects:[{duration:1280,id:'minecraft:wither',amplifier:5b},{duration:40,id:'minecraft:instant_damage',amplifier:1b}]}
