# @s = soul forge to spawn a withering magic cloud
# run from both soul_forge/destroy

# spawn area_effect_cloud
summon minecraft:area_effect_cloud ~ ~0.8 ~ {ReapplicationDelay:200,Radius:4f,RadiusPerTick:-0.001f,duration:1800,effects:[{id:'minecraft:wither',amplifier:1b,duration:300}],CustomName:'{"translate":"entity.gm4.withering_magic","fallback":"Withering Magic"}'}

# visuals
playsound minecraft:entity.wither.hurt hostile @a[distance=..12] ~ ~ ~ 0.6 1.2
