# updates old custom crafters
# @s = custom crafter armor stand
# located at @s
# run from gm4_custom_crafters-2.0:main

execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_custom_crafter","gm4_machine_marker","smithed.block"],CustomName:'"gm4_custom_crafter"'}
data merge entity @s {Tags:["gm4_no_edit","gm4_custom_crafter_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_custom_crafter_stand"'}
