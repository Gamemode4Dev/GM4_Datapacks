# @s = boiling zauber cauldron with recipe inside
# at center of block
# run from recipes/potions/ recipes
# applies environmental effects caused by recipes

particle heart ~ ~.2 ~ .25 .2 .25 10 5
summon area_effect_cloud ~ ~.75 ~ {Radius:1.25f,Duration:-1,RadiusOnUse:-0.09f,RadiusPerTick:0.0f,ReapplicationDelay:20,potion_contents:{custom_effects:[{id:"minecraft:instant_health",amplifier:2,duration:1}]}}
