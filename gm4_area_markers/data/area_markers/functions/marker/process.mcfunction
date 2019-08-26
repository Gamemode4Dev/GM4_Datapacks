#called from main
#@s = area marker

#make message apear
execute as @s[tag=gm4_am_tier_1] at @s positioned ~-24 0 ~-24 run title @a[dx=48, dy=1000000000000, dz=48] actionbar [{"translate":"%1$s%3427655$s","with":["Area: ",{"translate":"text.gm4.area_markers.area"}],"color":"gold"},{"selector":"@s","color":"white"}]
execute as @s[tag=gm4_am_tier_2] at @s positioned ~-48 0 ~-48 run title @a[dx=96, dy=1000000000000, dz=96] actionbar [{"translate":"%1$s%3427655$s","with":["Area: ",{"translate":"text.gm4.area_markers.area"}],"color":"gold"},{"selector":"@s","color":"white"}]
execute as @s[tag=gm4_am_tier_3] at @s positioned ~-96 0 ~-96 run title @a[dx=192, dy=1000000000000, dz=192] actionbar [{"translate":"%1$s%3427655$s","with":["Area: ",{"translate":"text.gm4.area_markers.area"}],"color":"gold"},{"selector":"@s","color":"white"}]

#remove marker
execute at @s positioned ^ ^ ^-0.3 positioned ~ ~.3 ~ if entity @e[type=item_frame,distance=..0.1,limit=1,nbt=!{Item:{}}] run function area_markers:marker/destroy
