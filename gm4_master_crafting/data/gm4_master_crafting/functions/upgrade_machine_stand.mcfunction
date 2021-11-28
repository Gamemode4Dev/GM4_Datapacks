# updates old machine armor stands
# @s = master_crafter armor stand
# located at @s
# run from gm4_master_crafting:main

execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_master_crafter","gm4_machine_marker","smithed.block"],CustomName:'"gm4_master_crafter"'}
data merge entity @s {Tags:["gm4_no_edit","gm4_master_crafter_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_master_crafter_stand"'}
data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Master Crafter",{"translate":"container.gm4.master_crafter"}]}'}
