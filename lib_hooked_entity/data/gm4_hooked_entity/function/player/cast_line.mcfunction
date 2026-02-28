# sets rods_cast to 0 and schedules id loop
# @s = player, scores={gm4_hooked_entity.rods_cast=1..}
# at @s
# run from tick

scoreboard players set @s gm4_hooked_entity.rods_cast 0
function gm4_hooked_entity:id/loop
