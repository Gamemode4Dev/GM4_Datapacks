# @s = boiling zauber cauldron with recipe inside
# at center of block
# run from recipes/potions/ recipes
# applies environmental effects caused by recipes

summon area_effect_cloud ~ ~.75 ~ {CustomName:'"the mess they made"',Radius:1.8f,Duration:2147483647,RadiusOnUse:-0.01f,RadiusPerTick:-0.0002f,ReapplicationDelay:40,Effects:[{Duration:1280,Id:20,Amplifier:5b},{Duration:40,Id:7,Amplifier:1b}]}
