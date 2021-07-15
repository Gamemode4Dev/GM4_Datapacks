# Called from main
# @s = @e[tag=gm4_disassemblers]
execute unless block ~ ~ ~ dropper run function gm4_disassemblers:kill
# 1.18 NOTE; This 16->17 backward compatibility may be removed.
data merge entity @s {HasVisualFire:1}
execute positioned ~ ~1 ~ as @e[type=item,sort=nearest,tag=!gm4_disassemble,distance=..0.5,nbt={OnGround:1b}] positioned ~ ~-1 ~ run function gm4_disassemblers:check_dropper
