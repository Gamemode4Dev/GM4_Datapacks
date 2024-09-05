# @template gm4_vertical_rails:test_track

summon minecart ~1.5 ~1.0 ~1.5

await delay 3s

execute positioned ~4.5 ~4.5 ~1.5 run assert entity @e[type=minecart,dx=0]
