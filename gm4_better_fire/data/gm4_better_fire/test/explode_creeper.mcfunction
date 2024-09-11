# @template gm4:test_platform
# @skyaccess

summon creeper ~1.5 ~1 ~1.5 {Health:2}
summon arrow ~1.5 ~4 ~1.5 {Fire:100s,Motion:[0.0,-0.1,0.0]}

await not entity @e[type=creeper,distance=..4]
