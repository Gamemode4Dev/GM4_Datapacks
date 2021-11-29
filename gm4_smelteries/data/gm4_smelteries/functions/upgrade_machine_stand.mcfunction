# updates old machine armor stands
# @s = smeltery armor stand
# located at @s
# run from gm4_smelteries:main

execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_smeltery","gm4_machine_marker","smithed.block"],CustomName:'"gm4_smeltery"'}
data merge entity @s {Tags:["gm4_no_edit","gm4_smeltery_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_smeltery_stand"'}
data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Forming Press",{"translate":"container.gm4.smeltery"}]}'}
