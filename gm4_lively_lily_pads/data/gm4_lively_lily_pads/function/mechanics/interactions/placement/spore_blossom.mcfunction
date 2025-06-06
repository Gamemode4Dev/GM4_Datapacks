# places spore_blossom displays
# @s = placement rcd
# at @s
# run from mechanics/interactions/placement/found

# summon
summon minecraft:block_display ~ ~ ~ {\
  Tags:["gm4_llp_display","gm4_llp_display.1","gm4_llp_spore_blossom_sound","smithed.entity"],\
  block_state:{\
    Name:"minecraft:spore_blossom"\
  },\
  transformation:{\
    scale:[0.5f,0.5f,0.7f],\
    translation:[-0.25f,0.7f,0.25f],\
    left_rotation:[0.707f,0f,0f,0.707f],\
    right_rotation:[0.707f,0f,0f,0.707f]\
  }\
}

# sound
playsound minecraft:block.spore_blossom.place block @a[distance=..16] ~ ~ ~
