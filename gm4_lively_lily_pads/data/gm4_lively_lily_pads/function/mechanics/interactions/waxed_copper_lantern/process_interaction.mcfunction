# @s = gm4_llp_waxed_copper_rcd rcd
# at @s
# run from mechanics/interactions/waxed_copper_lantern/interact_rcd

# store time to check
execute store result score $gametime gm4_llp.data run time query gametime
execute store result score $check_gametime gm4_llp.data run data get entity @s interaction.timestamp 1

# clean
data remove entity @s interaction

# fail if old interaction
execute unless score $gametime gm4_llp.data = $check_gametime gm4_llp.data run return fail

# no axe, no effect
execute if score $holding_axe gm4_llp.data matches 0 run return fail

# scrape off wax
particle minecraft:wax_off ~ ~.2 ~ 0.3 0.3 0.3 1 16
playsound item.axe.wax_off block @a[distance=..16] ~ ~ ~
tag @s remove gm4_llp_waxed_copper_rcd
tag @s add gm4_llp_unwaxed_copper_rcd
# modify display to match
execute as @e[type=minecraft:block_display,tag=gm4_llp_waxed_copper_lantern,distance=..0.1,limit=1] run function gm4_lively_lily_pads:mechanics/interactions/waxed_copper_lantern/scrape_display
# set flag
scoreboard players set $scraped gm4_llp.data 1
