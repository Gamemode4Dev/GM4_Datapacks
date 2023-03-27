# spawn a beacon light
# @s = player wearing beacon armor
# at @s
# run from tick

execute positioned ~ ~1 ~ if block ~ ~ ~ #gm4_combat_expanded:light_placeable align xyz run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_ce_beacon"],CustomName:'{"text":"GM4_CE Beacon Marker"}'}
fill ~ ~1 ~ ~ ~1 ~ light[waterlogged=true,level=12] replace water[level=0]
fill ~ ~1 ~ ~ ~1 ~ light[level=12] replace #gm4:air
