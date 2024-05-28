# @template gm4:test_platform_large
# @dummy ~1.5 ~1 ~1.5
# @optional

execute positioned ~3.5 ~1 ~2.5 run dummy PercurroVictim spawn
execute at @s run tp @s ~ ~ ~ facing entity PercurroVictim
item replace entity @s weapon.mainhand with iron_sword[custom_data={gm4_metallurgy:{has_shamir:1b,active_shamir:"percurro"}}]
await delay 3s
dummy @s attack PercurroVictim

await delay 1t

execute positioned ~6 ~1 ~3 run assert entity @s[dx=1,dy=1,dz=1]
assert entity @s[y_rotation=110..120,x_rotation=-10..10]
