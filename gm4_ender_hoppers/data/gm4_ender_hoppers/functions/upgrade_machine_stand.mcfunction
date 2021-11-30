# updates old machine armor stands
# @s = ender_hopper armor stand
# located at @s
# run from gm4_ender_hoppers:main

execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_ender_hopper","gm4_machine_marker","smithed.block"],CustomName:'"gm4_ender_hopper"'}
data merge entity @s {Tags:["gm4_no_edit","gm4_ender_hopper_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_ender_hopper_stand"'}
data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Ender Hopper","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.ender_hopper","font":"gm4:container_gui","color":"white"},{"text":"Ender Hopper","font":"minecraft:default","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.ender_hopper","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.ender_hopper","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.ender_hopper","font":"minecraft:default","color":"#373737"}]]}]}'}
