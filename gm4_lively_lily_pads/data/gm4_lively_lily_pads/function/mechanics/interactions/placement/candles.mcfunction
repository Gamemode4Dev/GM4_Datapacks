# places candle displays
# @s = placement rcd
# at @s
# with {SelectedItem}
# run from mechanics/interactions/placement/found

# summon
$summon minecraft:block_display ~ ~ ~ {\
  Tags:["gm4_llp_display","gm4_llp_display.1"],\
  block_state:{\
    Name:"$(SelectedItem)",\
    Properties:{\
      candles:"1"\
    }\
  },\
  transformation:{\
    scale:[0.8f,0.8f,0.8f],\
    translation:[-0.4f,-0.08f,-0.4f],\
    left_rotation:[0f,0f,0f,1f],\
    right_rotation:[0f,0f,0f,1f]\
  }\
}
$summon minecraft:interaction ~ ~ ~ {width:0.4f,height:0.3f,response:1b,Tags:["gm4_llp_change_rcd","gm4_llp_$(SelectedItem)_rcd","smithed.entity","smithed.strict"]}
# light block (NEEDS LIGHTING)
#setblock ~ ~1 ~ light[level=3] keep

# sound
playsound minecraft:block.candle.place block @a[distance=..16] ~ ~ ~
