# updates old machine armor stands
# @s = tinkering_compressor armor stand
# located at @s
# run from gm4_tinkering_compressors:main

execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_tinkering_compressor","gm4_machine_marker","smithed.block"],CustomName:'"gm4_tinkering_compressor"'}
data merge entity @s {Tags:["gm4_no_edit","gm4_tinkering_compressor_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_tinkering_compressor_stand"'}
data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Tinkering",{"translate":"container.gm4.tinkering_compressor"}]}'}
