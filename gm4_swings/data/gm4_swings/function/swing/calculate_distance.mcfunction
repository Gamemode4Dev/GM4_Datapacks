data modify storage gm4_swings:temp transformation set value [0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,1f]
data modify storage gm4_swings:temp transformation[0] set from storage gm4_swings:data delta.x
data modify storage gm4_swings:temp transformation[8] set from storage gm4_swings:data delta.z

data modify entity @s transformation set from storage gm4_swings:temp transformation
data modify storage gm4_swings:data dx set from entity @s transformation.scale[0]