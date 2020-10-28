# @s=zauber Cauldron without water in it
# at align xyz
# run from structure_check

tp @e[type=rabbit,dx=0,dy=0,dz=0,limit=1] @e[type=area_effect_cloud,tag=gm4_zauber_cauldron,limit=1,distance=1..,sort=random,scores={gm4_zc_data=0}]
advancement grant @a[distance=..2,gamemode=!spectator,nbt={Inventory:[{Slot:100b,tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}},{Slot:101b,tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}},{Slot:102b,tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}},{Slot:103b,tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}]}] only gm4:zauber_cauldrons_rabbit
