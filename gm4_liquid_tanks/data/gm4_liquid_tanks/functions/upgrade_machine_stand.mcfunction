# updates old machine armor stands
# @s = master_crafter armor stand
# located at @s
# run from gm4_liquid_tanks:main

execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_liquid_tank","gm4_machine_marker","smithed.block"],CustomName:'"gm4_liquid_tank"'}
data merge entity @s {Tags:["gm4_no_edit","gm4_liquid_tank_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_liquid_tank_stand"'}
