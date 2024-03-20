# grow this seagrass to tall seagrass
# @s = growth marker
# at @s
# run from coral_core/growth/seagrass/chance

setblock ~ ~ ~ tall_seagrass
setblock ~ ~1 ~ tall_seagrass[half=upper]
execute positioned ~ ~1 ~ run function gm4_hydromancy:coral_core/growth/vfx
