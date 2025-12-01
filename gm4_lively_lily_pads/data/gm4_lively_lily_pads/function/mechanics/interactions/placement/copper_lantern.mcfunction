# places copper lantern displays
# @s = placement rcd
# at lily_pad align xyz positioned ~.5 ~.02 ~.5
# with {DisplayType}
# run from mechanics/interactions/placement/process_interaction

$summon minecraft:block_display ~ ~ ~ {\
  Tags:["gm4_llp_display","gm4_llp_light","gm4_llp_light.14","gm4_llp_lantern_sound","gm4_llp_unwaxed_copper_lantern","smithed.entity"],\
  block_state:{\
    Name:"$(DisplayType)"\
  },\
  transformation:{\
    scale:[0.8f,0.8f,0.8f],\
    translation:[-0.4f,0f,-0.4f],\
    left_rotation:[0f,0f,0f,1f],\
    right_rotation:[0f,0f,0f,1f]\
  }\
}
summon minecraft:interaction ~ ~ ~ {width:0.4f,height:0.4f,response:1b,Tags:["gm4_llp_unwaxed_copper_rcd","gm4_llp_perma_rcd","smithed.entity","smithed.strict"]}

# light block
setblock ~ ~1 ~ light[level=14] keep

# sound
playsound minecraft:block.lantern.place block @a[distance=..16] ~ ~ ~
