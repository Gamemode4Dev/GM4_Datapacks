# upgrade path from pre-gm4 LLP
# @s = player
# at @s

# kill old not useful
kill @e[type=minecraft:interaction,tag=lilyPadInt]
kill @e[type=minecraft:block_display,tag=lilyPadLight2]

# upgrade remaining
execute as @e[type=minecraft:block_display,tag=lilyPadLight] at @s align xyz positioned ~.5 ~0.02 ~.5 \
  run function gm4_lively_lily_pads:upgrade_paths/3.0/update_legacy_display

# CHECK TO ENABLE UPGRADE PATH IN mechanics/placement/interact_rcd
