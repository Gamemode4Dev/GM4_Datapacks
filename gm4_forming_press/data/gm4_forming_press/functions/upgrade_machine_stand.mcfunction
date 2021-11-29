# updates old machine armor stands
# @s = forming_press armor stand
# located at @s
# run from gm4_forming_press:main

execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_forming_press","gm4_machine_marker","smithed.block"],CustomName:'"gm4_forming_press"'}
data merge entity @s {Tags:["gm4_no_edit","gm4_forming_press_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_forming_press_stand"'}
data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Forming Press",{"translate":"container.gm4.forming_press"}]}'}
