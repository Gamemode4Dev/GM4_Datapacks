# places cactus_flower displays
# @s = placement rcd (upgrade path different)
# lily_pad align xyz positioned ~.5 ~.02 ~.5
# run from mechanics/interactions/placement/found & upgrade_paths/3.0/update_legacy_display

# summon
summon minecraft:block_display ~ ~ ~ {\
  Tags:["gm4_llp_display","gm4_llp_display.1","gm4_llp_cactus_flower_sound","smithed.entity"],\
  block_state:{\
    Name:"minecraft:cactus_flower"\
  },\
  transformation:{\
    scale:[0.8f,0.8f,0.8f],\
    translation:[-0.4f,0f,-0.4f],\
    left_rotation:[0f,0f,0f,1f],\
    right_rotation:[0f,0f,0f,1f]\
  }\
}

# sound
playsound minecraft:block.cactus_flower.place block @a[distance=..16] ~ ~ ~
