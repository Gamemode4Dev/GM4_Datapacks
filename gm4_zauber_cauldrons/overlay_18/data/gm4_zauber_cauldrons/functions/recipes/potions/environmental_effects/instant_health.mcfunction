# @s = boiling zauber cauldron with recipe inside
# at center of block
# run from recipes/potions/ recipes
# applies environmental effects caused by recipes

summon area_effect_cloud ~ ~.75 ~ {CustomName:'"their own incompetence"',Radius:2.1f,Duration:2147483647,RadiusOnUse:-0.75f,RadiusPerTick:-0.0005f,ReapplicationDelay:0,effects:[{duration:40,id:'minecraft:instant_damage',amplifier:8b,show_particles:1b}]}
