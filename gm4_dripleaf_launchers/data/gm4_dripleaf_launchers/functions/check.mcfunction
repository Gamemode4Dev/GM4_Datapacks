# check players on dripleafs
# @s = player
# at @s
# run from tick

execute if predicate gm4_dripleaf_launchers:dripleaf_tilted run tag @s add gm4_dl_dripleaf_ready
execute if entity @s[tag=gm4_dl_dripleaf_ready,predicate=gm4_dripleaf_launchers:dripleaf_no_tilt] run function gm4_dripleaf_launchers:launch
execute unless predicate gm4_dripleaf_launchers:dripleaf_triggered run tag @s remove gm4_dl_on_dripleaf
tag @s[tag=!gm4_dl_on_dripleaf] remove gm4_dl_dripleaf_ready
