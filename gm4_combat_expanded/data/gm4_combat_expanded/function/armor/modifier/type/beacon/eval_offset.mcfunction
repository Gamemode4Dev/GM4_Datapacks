# apply the new offset to beacon using macro's
# @s = beacon block_display
# at linked player
# run from armor/modifier/type/beacon/pick_new_offset

# offset is applied to beacon and passenger, taking 3.5 seconds
$execute on passengers run data merge entity @s {start_interpolation:-1,interpolation_duration:70,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[$(passenger_offset_x)f,$(passenger_offset_y)f,$(passenger_offset_z)f],scale:[0.4375f,0.4375f,0.4375f]}}
$data merge entity @s {start_interpolation:-1,interpolation_duration:70,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[$(offset_x)f,$(offset_y)f,$(offset_z)f],scale:[0.5f,0.5f,0.5f]}}
