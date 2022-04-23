# set up marker for smelting
# @s = smeltery cauldron linked to a furnace that's smelting items
# located at the smeltery block (furnace)
# run from smelt/smelting

tag @e[type=marker,tag=gm4_smeltery_processing,limit=1,distance=..2] add gm4_smeltery_smelting
function gm4_smelteries:smelt/check_finish_smelt
