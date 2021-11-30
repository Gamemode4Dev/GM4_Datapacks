# destroys the block_compressor
# @s = block_compressor marker
# located at @s
# run from gm4_block_compressors:machine/verify_destroy

# kill entities related to machine block
execute positioned ~ ~-0.4 ~ run kill @e[type=armor_stand,tag=gm4_block_compressor_stand,limit=1,distance=..0.01]
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,nbt={Age:0s,Item:{id:"minecraft:dropper",Count:1b,tag:{display:{Name:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Compressor","font":"minecraft:default","color":"#373737"},[{"text":"Compressor","font":"gm4:inverted"},{"text":"Compressor","font":"gm4:inverted_spacing"},{"text":"Compressor","font":"gm4:offscreen"},{"translate":"gui.gm4.block_compressor","font":"gm4:container_gui","color":"white"},{"text":"Compressor","font":"gm4:inverted"},{"text":"Compressor","font":"gm4:inverted_spacing"},{"text":"Compressor","font":"gm4:container_gui","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.block_compressor","font":"minecraft:default","color":"#373737"},[{"translate":"container.gm4.block_compressor","font":"gm4:inverted"},{"translate":"container.gm4.block_compressor","font":"gm4:inverted_spacing"},{"translate":"container.gm4.block_compressor","font":"gm4:offscreen"},{"translate":"gui.gm4.block_compressor","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.block_compressor","font":"gm4:inverted"},{"translate":"container.gm4.block_compressor","font":"gm4:inverted_spacing"},{"translate":"container.gm4.block_compressor","font":"gm4:container_gui","color":"#373737"}]]}]}'}}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
particle block piston ~ ~ ~ .1 .25 .1 .05 30 normal @a
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_block_compressors:items/block_compressor
