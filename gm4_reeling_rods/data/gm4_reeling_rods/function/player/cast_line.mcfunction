# sets rods_cast to 0 and schedules id loop
# @s = player, scores={gm4_reeling_rods.rods_cast=1..}
# at @s
# run from tick

scoreboard players set @s gm4_reeling_rods.rods_cast 0
function gm4_reeling_rods:id/loop
