# apply the new offset to radiant using macro's
# @s = radiant block_display
# at linked player
# run from armor/augment/type/radiant/pick_new_offset

# offset is applied to radiant and passenger, taking 7 seconds
$execute on passengers run data merge entity @s {start_interpolation:-1,interpolation_duration:140,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[$(passenger_offset_x)f,$(passenger_offset_y)f,$(passenger_offset_z)f],scale:[0.4375f,0.4375f,0.4375f]}}
$data merge entity @s {start_interpolation:-1,interpolation_duration:140,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[$(offset_x)f,$(offset_y)f,$(offset_z)f],scale:[0.5f,0.5f,0.5f]}}
