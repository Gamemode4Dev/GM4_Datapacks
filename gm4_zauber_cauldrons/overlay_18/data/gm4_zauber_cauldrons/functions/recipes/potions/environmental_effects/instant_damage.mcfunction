# @s = boiling zauber cauldron with recipe inside
# at center of block
# run from recipes/potions/ recipes
# applies environmental effects caused by recipes

particle block red_nether_bricks ~ ~.2 ~ .1 .1 .1 10 30
summon area_effect_cloud ~ ~.75 ~ {Radius:1.25f,Duration:2147483647,RadiusOnUse:-0.09f,RadiusPerTick:0.0f,ReapplicationDelay:20,effects:[{duration:1,id:'minecraft:instant_health',amplifier:2b}]}
