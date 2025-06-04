# places coral_fan displays
# @s = placement rcd
# at @s
# with {SelectedItem}
# run from mechanics/interactions/placement/found

# summon
$summon minecraft:block_display ~ ~ ~ {\
  Tags:["gm4_llp_display","gm4_llp_display.1"],\
  block_state:{\
    Name:"$(SelectedItem)"\
  },\
  transformation:{\
    scale:[0.5f,0.6f,0.5f],\
    translation:[-0.25f,-0.08f,-0.25f],\
    left_rotation:[0f,0f,0f,1f],\
    right_rotation:[0f,0f,0f,1f]\
  }\
}
$summon minecraft:block_display ~ ~ ~ {\
  Tags:["gm4_llp_display","gm4_llp_display.2"],\
  block_state:{\
    Name:"$(SelectedItem)"\
  },\
  transformation:{\
    scale:[0.25f,0.6f,0.25f],\
    translation:[-0.125f,-0.08f,-0.125f],\
    left_rotation:[0f,0f,0f,1f],\
    right_rotation:[0f,0f,0f,1f]\
  }\
}

# sound
execute if score $item_type gm4_llp.data matches 1 run playsound minecraft:block.coral_block.place block @a[distance=..16] ~ ~ ~
execute if score $item_type gm4_llp.data matches 2 run playsound minecraft:block.stone.place block @a[distance=..16] ~ ~ ~
