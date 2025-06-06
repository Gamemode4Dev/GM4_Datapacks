# places coral_fan displays
# @s = placement rcd (upgrade path different)
# lily_pad align xyz positioned ~.5 ~.02 ~.5
# with {SelectedItem}
# run from mechanics/interactions/placement/found & upgrade_paths/3.0/update_legacy_display

# summon
$summon minecraft:block_display ~ ~ ~ {\
  Tags:["gm4_llp_display","gm4_llp_display.1","gm4_llp_wet_grass_sound","smithed.entity"],\
  block_state:{\
    Name:"$(SelectedItem)"\
  },\
  transformation:{\
    scale:[0.5f,0.6f,0.5f],\
    translation:[-0.25f,0f,-0.25f],\
    left_rotation:[0f,0f,0f,1f],\
    right_rotation:[0f,0f,0f,1f]\
  }\
}

# sound
playsound minecraft:block.wet_grass.place block @a[distance=..16] ~ ~ ~
