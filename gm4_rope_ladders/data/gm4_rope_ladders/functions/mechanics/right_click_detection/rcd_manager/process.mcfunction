# processes the "right click detection" villager so that it is despawned when unneeded
# run from function: gm4_rope_ladders:mechanics/right_click_detection/rcd_manager/loop

# kill rcd if uneeded
execute unless entity @a[tag=gm4_rol_holding_ladder,distance=..5] run tp @s ~ -1000 ~
execute unless entity @a[tag=gm4_rol_holding_ladder,distance=..5] run tp @s ~ -1000 ~
execute unless block ~ ~ ~ ladder run tp @s ~ -1000 ~
execute if block ~ ~-1 ~ ladder unless block ~ ~1 ~ #gm4:air run tp @s ~ -1000 ~
execute if entity @e[type=villager,tag=gm4_rol_rcd_ladder,distance=0.1..10] run tp @s ~ -1000 ~
