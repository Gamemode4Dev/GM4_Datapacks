# Place tripwire hook at end of tripwire
# @s = player using the crossbow
# at end of tripwire circuit in tripwire_hook, align xyz positioned ~0.5 ~ ~0.5
# run from cables/unspool_string

# take tripwire hook
playsound minecraft:block.stone.place block @a[distance=..15]
clear @s[gamemode=!creative] minecraft:tripwire_hook 1

# reset string count
scoreboard players set @s gm4_cb_string 0

# advancement for creating a 40 block long tripwire circuit
execute if score @s gm4_cb_tw_length matches 40 run advancement grant @s only gm4:crossbow_cartridges_string
