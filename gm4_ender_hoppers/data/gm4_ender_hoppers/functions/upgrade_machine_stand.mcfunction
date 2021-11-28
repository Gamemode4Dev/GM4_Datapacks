# updates old machine armor stands
# @s = ender_hopper armor stand
# located at @s
# run from gm4_ender_hoppers:main

execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_ender_hopper","gm4_machine_marker","smithed.block"],CustomName:'"gm4_ender_hopper"'}
data merge entity @s {Tags:["gm4_no_edit","gm4_ender_hopper_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_ender_hopper_stand"'}
data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Ender Hopper",{"translate":"container.gm4.ender_hopper"}]}'}
