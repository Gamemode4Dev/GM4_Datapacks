# @s = gm4_llp_unwaxed_copper_rcd rcd
# at @s
# run from mechanics/interactions/unwaxed_copper_lantern/interact_rcd

# store time to check
execute store result score $gametime gm4_llp.data run time query gametime
execute store result score $check_gametime gm4_llp.data run data get entity @s interaction.timestamp 1

# clean
data remove entity @s interaction

# fail if old interaction
execute unless score $gametime gm4_llp.data = $check_gametime gm4_llp.data run return fail

# fail if neither item
execute if score $mainhand gm4_llp.data matches 0 if score $offhand gm4_llp.data matches 0 run return fail

# redirect to display
execute as @e[type=block_display,tag=gm4_llp_unwaxed_copper_lantern,distance=..0.1,limit=1] run function gm4_lively_lily_pads:mechanics/interactions/unwaxed_copper_lantern/process_display

# wax
execute if score $wax_used gm4_llp.data matches 1..2 run tag @s remove gm4_llp_unwaxed_copper_rcd
execute if score $wax_used gm4_llp.data matches 1..2 run tag @s add gm4_llp_waxed_copper_rcd
