# @s = command block placed by function "place_down/replace_head"

execute at @p[tag=gm4_rl_placed_relocated_block,distance=..10] run loot spawn ~ ~.3 ~ loot gm4_relocators:relocator
data merge entity @e[type=item,distance=..10,nbt={Age:0s,Item:{tag:{gm4_relocator:1b}}},limit=1] {PickupDelay:0}

playsound minecraft:block.beacon.activate block @a[distance=..8] ~ ~ ~ 1 2

# run individual commands
summon area_effect_cloud ~ ~ ~ {Duration:2,Tags:["gm4_relocated_block_loc"],Radius:0f,Particle:"block air"}
setblock 29999998 1 7131 command_block[facing=down]{auto:1} destroy
data modify block 29999998 1 7131 Command set from storage gm4_relocators:data Item.tag.gm4_relocation_data.Command

tag @p[tag=gm4_rl_placed_relocated_block,distance=..10] remove gm4_rl_placed_relocated_block
