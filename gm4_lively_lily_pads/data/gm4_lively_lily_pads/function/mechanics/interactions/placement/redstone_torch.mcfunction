# places redstone_torch displays
# @s = placement rcd
# at @s
# run from mechanics/interactions/placement/found

# summon
summon minecraft:block_display ~ ~ ~ {\
  Tags:["gm4_llp_display","gm4_llp_display.1"],\
  block_state:{\
    Name:"minecraft:redstone_torch"\
  },\
  transformation:{\
    scale:[0.8f,0.8f,0.8f],\
    translation:[-0.4f,-0.08f,-0.4f],\
    left_rotation:[0f,0f,0f,1f],\
    right_rotation:[0f,0f,0f,1f]\
  }\
}
# light block
setblock ~ ~1 ~ light[level=6] keep

# sound
playsound minecraft:block.wood.place block @a[distance=..16] ~ ~ ~
