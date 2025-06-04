# places light_14 displays
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
    scale:[0.8f,0.8f,0.8f],\
    translation:[-0.4f,-0.08f,-0.4f],\
    left_rotation:[0f,0f,0f,1f],\
    right_rotation:[0f,0f,0f,1f]\
  }\
}
# light block
setblock ~ ~1 ~ light[level=14] keep

# sound
execute if score $item_type gm4_llp.data matches 3 run playsound minecraft:block.wood.place block @a[distance=..16] ~ ~ ~
execute if score $item_type gm4_llp.data matches 4 run playsound minecraft:block.lantern.place block @a[distance=..16] ~ ~ ~
