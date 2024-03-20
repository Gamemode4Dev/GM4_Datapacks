# display the charge of this coral core
# @s = coral core
# at @s, rotated ~-9 ~, then rotating ~-18 ~ for a full circle
# run from coral_core/charge/add
# run from here

execute if score @s gm4_hy_charge >= $circle_steps gm4_hy_data run summon block_display ^ ^0.23 ^-0.46 {Tags:["gm4_hy_coral_core.charge_display"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.04f,-0.04f,-0.04f],scale:[0.075f,0.02f,0.02f]},block_state:{Name:"minecraft:bubble_coral_block"}}
execute if score @s gm4_hy_charge matches ..19 if score @s gm4_hy_charge = $circle_steps gm4_hy_data positioned ^ ^0.23 ^-0.46 run tag @e[type=block_display,tag=gm4_hy_coral_core.charge_display,limit=1,sort=nearest] add gm4_hy_coral_core.charge_display_head
execute if score @s gm4_hy_charge < $circle_steps gm4_hy_data run summon block_display ^ ^0.23 ^-0.46 {Tags:["gm4_hy_coral_core.charge_display"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.04f,-0.04f,-0.04f],scale:[0.075f,0.02f,0.02f]},block_state:{Name:"minecraft:dead_bubble_coral_block"}}

scoreboard players remove $circle_steps gm4_hy_data 1
execute if score $circle_steps gm4_hy_data matches 1.. rotated ~-18 ~ run function gm4_hydromancy:coral_core/charge/display
