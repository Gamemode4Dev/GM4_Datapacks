# destroys the block_compressor
# @s = block_compressor marker
# located at @s
# run from gm4_block_compressors:machine/verify_destroy

# kill entities related to machine block
execute positioned ~ ~-0.98 ~ run kill @e[type=armor_stand,tag=gm4_block_compressor_stand,limit=1,distance=..0.1]
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:dropper",Count:1b,tag:{display:{Name:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"color":"#373737","font":"minecraft:default","text":"Compression Amount"},{"font":"gm4:half_scale","extra":[{"font":"gm4:inverted","text":"Compression Amount"},{"font":"gm4:inverted_spacing","text":"Compression Amount"},{"font":"gm4:offscreen","text":"Compression Amount"},{"color":"white","font":"gm4:container_gui","translate":"gui.gm4.block_compressor"},{"font":"gm4:half_scale","text":"Compression Amount"},{"font":"gm4:inverted","text":"Compression Amount"},{"font":"gm4:inverted_spacing","text":"Compression Amount"},{"color":"#373737","font":"minecraft:default","text":"Compression Amount"}],"text":"Compression Amount"}]},{"translate":"%1$s%3427656$s","with":[{"color":"#373737","font":"minecraft:default","translate":"container.gm4.block_compressor"},{"font":"gm4:half_scale","extra":[{"font":"gm4:inverted","translate":"container.gm4.block_compressor"},{"font":"gm4:inverted_spacing","translate":"container.gm4.block_compressor"},{"font":"gm4:offscreen","translate":"container.gm4.block_compressor"},{"color":"white","font":"gm4:container_gui","translate":"gui.gm4.block_compressor"},{"font":"gm4:half_scale","translate":"container.gm4.block_compressor"},{"font":"gm4:inverted","translate":"container.gm4.block_compressor"},{"font":"gm4:inverted_spacing","translate":"container.gm4.block_compressor"},{"color":"#373737","font":"minecraft:default","translate":"container.gm4.block_compressor"}],"translate":"container.gm4.block_compressor"}]}]}'}}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
particle block piston ~ ~ ~ .1 .25 .1 .05 30 normal @a
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_block_compressors:items/block_compressor
