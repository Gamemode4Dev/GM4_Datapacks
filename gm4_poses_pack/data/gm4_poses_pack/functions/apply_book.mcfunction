# @s = armor_stand to be modified
# at @s
# run from gm4_better_armour_stands:book/process

# Check presets
scoreboard players set $success gm4_bas_data 0
execute if data storage gm4_better_armour_stands:temp {pages:["legs down"]} store success score $success gm4_bas_data run data merge entity @s {Pose:{LeftLeg:[0.01f,0f,0f],RightLeg:[0.01f,0f,0f]}}
execute if data storage gm4_better_armour_stands:temp {pages:["legs sitting"]} unless score $success gm4_bas_data matches 1.. store success score $success gm4_bas_data run data merge entity @s {Pose:{LeftLeg:[278f,347f,0f],RightLeg:[278f,11f,0f]}}
execute if data storage gm4_better_armour_stands:temp {pages:["legs walking"]} unless score $success gm4_bas_data matches 1.. store success score $success gm4_bas_data run data merge entity @s {Pose:{LeftLeg:[39f,0f,0f],RightLeg:[317f,0f,0f]}}
execute if data storage gm4_better_armour_stands:temp {pages:["legs flying"]} unless score $success gm4_bas_data matches 1.. store success score $success gm4_bas_data run data merge entity @s {Pose:{LeftLeg:[108f,0f,0f],RightLeg:[90f,0f,0f]}}

execute if data storage gm4_better_armour_stands:temp {pages:["arms reaching"]} unless score $success gm4_bas_data matches 1.. store success score $success gm4_bas_data run data merge entity @s {ShowArms:1b,Pose:{LeftArm:[254f,0f,0f],RightArm:[254f,0f,0f]}}
execute if data storage gm4_better_armour_stands:temp {pages:["arms swinging"]} unless score $success gm4_bas_data matches 1.. store success score $success gm4_bas_data run data merge entity @s {ShowArms:1b,Pose:{LeftArm:[304f,0f,0f],RightArm:[40f,0f,0f]}}
execute if data storage gm4_better_armour_stands:temp {pages:["arms resting"]} unless score $success gm4_bas_data matches 1.. store success score $success gm4_bas_data run data merge entity @s {ShowArms:1b,Pose:{LeftArm:[263f,340f,188f],RightArm:[263f,25f,188f]}}
execute if data storage gm4_better_armour_stands:temp {pages:["arms raised"]} unless score $success gm4_bas_data matches 1.. store success score $success gm4_bas_data run data merge entity @s {ShowArms:1b,Pose:{LeftArm:[179f,0f,24f],RightArm:[179f,0f,344f]}}
execute if data storage gm4_better_armour_stands:temp {pages:["arms down"]} unless score $success gm4_bas_data matches 1.. store success score $success gm4_bas_data run data merge entity @s {ShowArms:1b,Pose:{LeftArm:[0.01f,0f,0f],RightArm:[0.01f,0f,0f]}}

execute if data storage gm4_better_armour_stands:temp {pages:["head up"]} unless score $success gm4_bas_data matches 1.. store success score $success gm4_bas_data run data merge entity @s {Pose:{Head:[325f,0f,0f]}}
execute if data storage gm4_better_armour_stands:temp {pages:["head down"]} unless score $success gm4_bas_data matches 1.. store success score $success gm4_bas_data run data merge entity @s {Pose:{Head:[35f,0f,0f]}}
execute if data storage gm4_better_armour_stands:temp {pages:["head left"]} unless score $success gm4_bas_data matches 1.. store success score $success gm4_bas_data run data merge entity @s {Pose:{Head:[0f,325f,0f]}}
execute if data storage gm4_better_armour_stands:temp {pages:["head right"]} unless score $success gm4_bas_data matches 1.. store success score $success gm4_bas_data run data merge entity @s {Pose:{Head:[0f,35f,0f]}}

# Grant advancement if any poses were changed.
execute if score $success gm4_bas_data matches 1.. run function gm4_poses_pack:pose_changed
