#called from main
#@s = area marker

#make message apear
execute at @s[tag=gm4_am_tier_1] positioned ~-24 1 ~-24 run title @a[dx=48, dy=299, dz=48] actionbar [{"translate":"%1$s%3427655$s","with":["Area: ",{"translate":"text.gm4.area_markers.area"}],"color":"gold"},{"selector":"@s","color":"white"}]
execute at @s[tag=gm4_am_tier_2] positioned ~-48 1 ~-48 run title @a[dx=96, dy=299, dz=96] actionbar [{"translate":"%1$s%3427655$s","with":["Area: ",{"translate":"text.gm4.area_markers.area"}],"color":"gold"},{"selector":"@s","color":"white"}]
execute at @s[tag=gm4_am_tier_3] positioned ~-96 1 ~-96 run title @a[dx=192, dy=299, dz=192] actionbar [{"translate":"%1$s%3427655$s","with":["Area: ",{"translate":"text.gm4.area_markers.area"}],"color":"gold"},{"selector":"@s","color":"white"}]

#remove marker
execute at @s positioned ^ ^ ^-0.3 positioned ~ ~.3 ~ if entity @e[type=item_frame,distance=..0.1,limit=1,nbt=!{Item:{}}] run function area_markers:marker/destroy
