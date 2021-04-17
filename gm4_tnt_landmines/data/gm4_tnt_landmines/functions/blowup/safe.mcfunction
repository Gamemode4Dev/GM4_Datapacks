# @s = detonated (terrain-safe) landmine
# run from blowup/type_check
summon area_effect_cloud ~ ~1.3 ~ {Particle:"entity_effect",Radius:3f,Duration:60,CustomName:'{"italic":false,"translate": "%1$s%3427655$s","with":["a landmine",{"translate": "entity.gm4.tnt_landmine"}]}',Effects:[{Id:7b,Amplifier:4b,Duration:1,ShowParticles:0b}]}
kill @s
