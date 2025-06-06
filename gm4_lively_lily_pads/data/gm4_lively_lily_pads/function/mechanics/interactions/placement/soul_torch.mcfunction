# places light_9 displays
# @s = placement rcd (upgrade path different)
# lily_pad align xyz positioned ~.5 ~.02 ~.5
# run from mechanics/interactions/placement/found & upgrade_paths/3.0/update_legacy_display

# summon
summon minecraft:block_display ~ ~ ~ {\
  Tags:["gm4_llp_display","gm4_llp_display.1","gm4_llp_light","gm4_llp_wood_sound","smithed.entity"],\
  block_state:{\
    Name:"minecraft:soul_torch"\
  },\
  transformation:{\
    scale:[0.8f,0.8f,0.8f],\
    translation:[-0.4f,0f,-0.4f],\
    left_rotation:[0f,0f,0f,1f],\
    right_rotation:[0f,0f,0f,1f]\
  }\
}
# light block
setblock ~ ~1 ~ light[level=9] keep

# sound
playsound minecraft:block.wood.place block @a[distance=..16] ~ ~ ~
