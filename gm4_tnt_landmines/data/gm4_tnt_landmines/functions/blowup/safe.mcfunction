# @s = detonated (terrain-safe) landmine
# run from blowup/type_check
summon area_effect_cloud ~ ~1.3 ~ {Particle:"entity_effect",Radius:3f,Duration:60,CustomName:'{"italic":false,"translate":"entity.gm4.tnt_landmine","fallback":"a landmine"}',effects:[{id:'minecraft:instant_damage',amplifier:4b,duration:1,show_particles:0b}]}
kill @s
