# @s = boiling zauber cauldron with recipe inside
# at center of block
# run from recipes/potions/ recipes
# applies environmental effects caused by recipes

summon area_effect_cloud ~ ~.75 ~ {CustomName:'{"translate":"entity.gm4.zauber_cauldrons.smog.instant_health","fallback":"their own incompetence"}',Radius:2.1f,Duration:2147483647,RadiusOnUse:-0.75f,RadiusPerTick:-0.0005f,ReapplicationDelay:0,potion_contents:{custom_effects:[{id:"minecraft:instant_damage",amplifier:8,duration:40}]}}
