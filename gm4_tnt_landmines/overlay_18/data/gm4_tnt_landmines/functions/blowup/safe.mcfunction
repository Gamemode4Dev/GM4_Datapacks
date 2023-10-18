# @s = detonated (terrain-safe) landmine
# run from blowup/type_check
summon area_effect_cloud ~ ~1.3 ~ {Particle:"entity_effect",Radius:3f,Duration:60,CustomName:'{"italic":false,"translate":"entity.gm4.tnt_landmine","fallback":"a landmine"}',Effects:[{Id:7,Amplifier:4b,Duration:1,ShowParticles:0b}]}
kill @s
