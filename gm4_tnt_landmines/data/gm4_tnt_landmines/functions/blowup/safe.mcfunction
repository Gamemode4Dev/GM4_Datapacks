# @s = detonated (terrain-safe) landmine
# run from blowup/type_check
# TODO 1.20.5: figure out how this particle looked in 1.20.4
summon area_effect_cloud ~ ~1.3 ~ {Particle:{type:"minecraft:entity_effect",color:[1.0,1.0,1.0,1.0]},Radius:3f,Duration:60,CustomName:'{"italic":false,"translate":"entity.gm4.tnt_landmine","fallback":"a landmine"}',effects:[{id:'minecraft:instant_damage',amplifier:4b,duration:1,show_particles:0b}]}
kill @s
