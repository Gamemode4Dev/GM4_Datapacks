# places candle displays
# @s = placement rcd (upgrade path different)
# lily_pad align xyz positioned ~.5 ~.02 ~.5
# with {SelectedItem, string}
# run from mechanics/interactions/placement/found & upgrade_paths/3.0/upgrade_candle

# summon
$summon minecraft:block_display ~ ~ ~ {\
  Tags:["gm4_llp_display","gm4_llp_$(string)","gm4_llp_generic_candle","gm4_llp_light","smithed.entity"],\
  block_state:{\
    Name:"$(SelectedItem)",\
    Properties:{\
      candles:"1"\
    }\
  },\
  transformation:{\
    scale:[0.8f,0.8f,0.8f],\
    translation:[-0.4f,0f,-0.4f],\
    left_rotation:[0f,0f,0f,1f],\
    right_rotation:[0f,0f,0f,1f]\
  }\
}
$summon minecraft:interaction ~ ~ ~ {width:0.4f,height:0.4f,response:1b,Tags:["gm4_llp_generic_candle_rcd","gm4_llp_$(string)_rcd","smithed.entity","smithed.strict"]}

# sound
playsound minecraft:block.candle.place block @a[distance=..16] ~ ~ ~
