# command block left behind due to lag
# command block placed from place_down/update_command_block
# run when command block is manually powered

execute unless entity @e[type=armor_stand,tag=gm4_relocator_fill,distance=..16,sort=nearest,limit=1] run setblock ~ ~ ~ air
data modify block ~ ~ ~ Command set from entity @e[type=armor_stand,tag=gm4_relocator_fill,distance=..16,sort=nearest,limit=1] ArmorItems[0].tag.gm4_relocation_data.Command
kill @e[type=armor_stand,tag=gm4_relocator_fill,distance=..16,sort=nearest,limit=1]
data merge block ~ ~ ~ {auto:0b}
data merge block ~ ~ ~ {auto:1b,powered:0b}
