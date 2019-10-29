#run from arrow_in_ground
# @s = @e[type=minecraft:arrow,tag=gm4_cb_torch,nbt={inGround:1b}]
# at @s

#summon torch item if torch already exists at this block
execute if block ~ ~ ~ #crossbow_cartridges:torch run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:torch",Count:1b}}

#place torch if possible
execute if block ~ ~ ~ #crossbow_cartridges:replaceable run function crossbow_cartridges:torch/torch_place

#summon torch item if placing torch failed
execute unless block ~ ~ ~ #crossbow_cartridges:torch run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:torch",Count:1b}}

#block
playsound minecraft:block.wood.place block @a[distance=..15]

#kill arrow
kill @s
