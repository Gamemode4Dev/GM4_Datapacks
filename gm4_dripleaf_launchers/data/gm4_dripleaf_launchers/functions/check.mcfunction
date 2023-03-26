# check players on dripleafs
# @s = player
# at @s
# run from tick

# dripleaf needs partial tilt before launch is possible
tag @s[predicate=gm4_dripleaf_launchers:dripleaf_tilted] add gm4_dl_dripleaf_ready
# if launch is possible and dripleaf is reset to no tilt through redstone launch player
execute if entity @s[tag=gm4_dl_dripleaf_ready,predicate=gm4_dripleaf_launchers:dripleaf_no_tilt] run function gm4_dripleaf_launchers:launch
# if dripleaf goes either full tilt or back to no tilt before launch is ready remove tag
tag @s[predicate=!gm4_dripleaf_launchers:dripleaf_triggered] remove gm4_dl_on_dripleaf
tag @s[tag=!gm4_dl_on_dripleaf] remove gm4_dl_dripleaf_ready
