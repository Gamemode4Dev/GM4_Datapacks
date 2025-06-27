# processes the "right click detection" interaction so that it is despawned when unneeded
# run from mechanics/right_click_detection/loop

# visuals
particle egg_crack ~ ~.05 ~ 0.05 0.05 0.05 .01 1

scoreboard players set $timer gm4_llp.data 10

# kill rcd if uneeded
scoreboard players set $killed_rcd gm4_llp.data 0
execute if score $killed_rcd gm4_llp.data matches 0 store success score $killed_rcd gm4_llp.data unless entity @a[tag=gm4_llp_holding_item,distance=..6] run kill @s
execute if score $killed_rcd gm4_llp.data matches 0 store success score $killed_rcd gm4_llp.data unless block ~ ~ ~ lily_pad run kill @s
execute if score $killed_rcd gm4_llp.data matches 0 store success score $killed_rcd gm4_llp.data if entity @e[type=block_display,tag=gm4_llp_display,distance=..0.1] run kill @s

execute store result score $players gm4_llp.data if entity @a[tag=gm4_llp_holding_item,distance=..12]
execute store result score $interactions gm4_llp.data if entity @e[type=interaction,tag=gm4_llp_placement_rcd,distance=..6]
execute if score $interactions gm4_llp.data > $players gm4_llp.data run kill @s
