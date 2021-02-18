# @s = detonated (not terrain-safe) landmine
# run from blowup/type_check

summon creeper ~ ~1 ~ {Silent:1b,ExplosionRadius:3b,Fuse:0s,ignited:1b,CustomName:'{"italic":false,"translate": "%1$s%3427655$s","with":["a landmine",{"translate": "entity.gm4.tnt_landmine"}]}',Tags:["gm4_tntlandmine"]}
kill @s
