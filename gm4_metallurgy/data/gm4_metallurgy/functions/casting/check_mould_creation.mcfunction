# @s = obsidian block with count of 1 on top of sand
# run from main
execute align xyz unless entity @e[type=armor_stand,tag=gm4_sand_ring,dx=0,dy=-1,dz=0] if entity @e[type=item,dx=0,dy=0,dz=0,predicate=gm4_metallurgy:is_clay_ball,nbt={OnGround:1b}] run function gm4_metallurgy:casting/create_mould
