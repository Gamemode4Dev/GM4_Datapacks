#@s = vex mould entity
#runs from sustain_mould

#absorb valid ores
execute if entity @e[type=item,tag=gm4_ml_in_animation,dx=0,dz=0,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{ore_type:"copper"}}},OnGround:1b}] run function metallurgy:casting/add_metal/add_copper
execute if entity @e[type=item,tag=gm4_ml_in_animation,dx=0,dz=0,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{ore_type:"barium"}}},OnGround:1b}] run function metallurgy:casting/add_metal/add_barium
execute if entity @e[type=item,tag=gm4_ml_in_animation,dx=0,dz=0,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{ore_type:"thorium"}}},OnGround:1b}] run function metallurgy:casting/add_metal/add_thorium
execute if entity @e[type=item,tag=gm4_ml_in_animation,dx=0,dz=0,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{ore_type:"aluminium"}}},OnGround:1b}] run function metallurgy:casting/add_metal/add_aluminium

#make all ores on top jump
execute as @e[type=item,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{}}},OnGround:1b},tag=!gm4_ml_in_animation,dx=0,dz=0] run data merge entity @s {Motion:[0.0,0.35,0.0],PickupDelay:30,Tags:["gm4_ml_in_animation"]}
#,Item:{tag:{gm4_metallurgy:{ore_in_animation:1b}}}
