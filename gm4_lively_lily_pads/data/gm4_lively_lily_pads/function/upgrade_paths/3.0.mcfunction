# upgrade path from pre-gm4 LLP
# @s = player
# at @s
# run via upgrade paths util

# kill old non-useful entities
kill @e[type=minecraft:interaction,tag=lilyPadInt]
kill @e[type=minecraft:block_display,tag=lilyPadLight2]

# upgrade remaining
execute as @e[type=minecraft:block_display,tag=lilyPadLight] at @s align xyz positioned ~.5 ~0.02 ~.5 \
  run function gm4_lively_lily_pads:upgrade_paths/3.0/update_legacy_display

# CHECK TO ENABLE UPGRADE PATH IN mechanics/interactions/placement/interact_rcd
