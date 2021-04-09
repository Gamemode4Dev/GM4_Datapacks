schedule function gm4_player_heads-1.0:main 16t

# fix skulls
execute as @e[type=item,tag=!gm4_player_heads_scanned,nbt={Item:{id:"minecraft:player_head"}}] if data entity @s Item.tag.SkullOwner.Properties.textures[0].Value run function gm4_player_heads-1.0:repair
