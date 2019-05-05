# Called from main
# @s = @e[tag=gm4_disassemblers]
execute unless block ~ ~ ~ dropper run function disassemblers:kill
data merge entity @s {Fire:2000}
execute positioned ~ ~1 ~ as @e[type=item,sort=nearest,tag=!gm4_disassemble,distance=..0.5,nbt={OnGround:1b}] positioned ~ ~-1 ~ run function disassemblers:check_dropper
