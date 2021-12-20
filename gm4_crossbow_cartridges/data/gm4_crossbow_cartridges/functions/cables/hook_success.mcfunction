# Place tripwire hook at end of tripwire
# @s = player using the crossbow
# at @s align xyz positioned ~0.5 ~ ~0.5, up to 40 blocks in one of the cardinal directions
# run from cables/unspool_string

# take tripwire hook
playsound minecraft:block.stone.place block @a[distance=..15]
clear @s[gamemode=!creative] minecraft:tripwire_hook 1

# reset string count
scoreboard players set @s gm4_cb_strcount 0

# 40 block long tripwire advancement
execute if score @s gm4_cb_strplace matches 40 run advancement grant @s only gm4:crossbow_cartridges_string
