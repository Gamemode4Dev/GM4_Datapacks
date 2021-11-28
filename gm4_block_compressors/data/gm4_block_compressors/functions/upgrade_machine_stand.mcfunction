# updates old machine armor stands
# @s = block_compressor armor stand
# located at @s
# run from gm4_block_compressors:main

execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_block_compressor","gm4_machine_marker","smithed.block"],CustomName:'"gm4_block_compressor"'}
data merge entity @s {Tags:["gm4_no_edit","gm4_block_compressor_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_block_compressor_stand"'}
data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Compress Items",{"translate":"container.gm4.block_compressor"}]}'}
