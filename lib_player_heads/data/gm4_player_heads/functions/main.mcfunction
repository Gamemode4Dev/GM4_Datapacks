schedule function gm4_player_heads:main 16t

# Repair any dropped player head items.
execute as @e[type=item,tag=!gm4_player_heads_scanned,nbt={Item:{id:"minecraft:player_head"}},nbt=!{Item:{tag:{display:{}}}}] run function gm4_player_heads:repair
