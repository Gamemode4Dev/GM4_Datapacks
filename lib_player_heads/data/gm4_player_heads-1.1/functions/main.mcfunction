schedule function gm4_player_heads-1.1:main 16t

# Repair any dropped player head items.
execute as @e[type=item,tag=!gm4_player_heads_scanned,nbt={Item:{id:"minecraft:player_head"}},nbt=!{Item:{tag:{gm4_player_head:1b}}}] run function gm4_player_heads-1.1:repair
