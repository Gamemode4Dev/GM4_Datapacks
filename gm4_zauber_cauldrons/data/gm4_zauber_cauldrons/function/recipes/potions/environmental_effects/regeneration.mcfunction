# @s = boiling zauber cauldron with recipe inside
# at center of block
# run from recipes/potions/ recipes
# applies environmental effects caused by recipes

summon area_effect_cloud ~ ~.75 ~ {CustomName:'{"translate":"entity.gm4.zauber_cauldrons.smog.regeneration","fallback":"the mess they made"}',Radius:1.8f,Duration:-1,RadiusOnUse:-0.01f,RadiusPerTick:-0.0002f,ReapplicationDelay:40,potion_contents:{custom_effects:[{id:"minecraft:wither",amplifier:3,duration:1280}]}}
