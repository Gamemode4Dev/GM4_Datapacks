execute as @e[type=item,nbt={Item:{Count:1b,id:"minecraft:blaze_rod",tag:{gm4_lightning_rod:1b}},OnGround:1b}] at @s run function gm4_lightning_rods:thrown
execute as @e[type=item,nbt={Item:{id:"minecraft:blaze_rod",tag:{gm4_lightning_rod:1b}},OnGround:1b},nbt=!{Item:{Count:1b}}] run data merge entity @s {CustomName:'{"text":"<!>","color":"gold"}',CustomNameVisible:true,Tags:[]}

schedule function gm4_lightning_rods:main 16t
