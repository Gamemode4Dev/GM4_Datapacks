# places cactus_flower displays
# @s = placement rcd
# at @s
# run from mechanics/interactions/placement/found

# summon
summon minecraft:block_display ~ ~ ~ {\
  Tags:["gm4_llp_display","gm4_llp_display.1"],\
  block_state:{\
    Name:"minecraft:cactus_flower"\
  },\
  transformation:{\
    scale:[0.8f,0.8f,0.8f],\
    translation:[-0.4f,-0.08f,-0.4f],\
    left_rotation:[0f,0f,0f,1f],\
    right_rotation:[0f,0f,0f,1f]\
  }\
}

# sound
playsound minecraft:block.cactus_flower.place block @a[distance=..16] ~ ~ ~
