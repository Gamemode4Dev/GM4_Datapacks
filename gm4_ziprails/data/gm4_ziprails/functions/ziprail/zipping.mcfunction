# @s = minecarts that are under a hook or string
# run from check_cable

# link minecarts that are on a hook
execute if entity @s[tag=!gm4_linked] if block ~ ~1 ~ tripwire_hook[attached=true] run function gm4_ziprails:ziprail/link

# teleport carts to rail-trigger height
execute if entity @s[tag=!gm4_taut_link,tag=gm4_linked] unless block ~ ~ ~ #minecraft:rails align y run teleport @s ~ ~.36250001192093 ~
execute if entity @s[tag=gm4_linked] unless block ~ ~ ~ #minecraft:rails run tag @s add gm4_taut_link
execute if block ~ ~ ~ #minecraft:rails run tag @s remove gm4_taut_link

execute if entity @s[tag=!gm4_taut_link] if block ~ ~1 ~ tripwire_hook[attached=true] run function gm4_ziprails:ziprail/link

# move docked minecarts along their string
data merge entity @s[tag=gm4_taut_link,tag=gm4_zipping_north] {Motion:[0.0,0.06,-0.4]}
data merge entity @s[tag=gm4_taut_link,tag=gm4_zipping_south] {Motion:[0.0,0.06,0.4]}
data merge entity @s[tag=gm4_taut_link,tag=gm4_zipping_east] {Motion:[0.4,0.06,0.0]}
data merge entity @s[tag=gm4_taut_link,tag=gm4_zipping_west] {Motion:[-0.4,0.06,0.0]}
