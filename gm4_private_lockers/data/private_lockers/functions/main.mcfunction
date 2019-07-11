#set lock prep
tag @e[type=item,tag=gm4_lock_primed] remove gm4_lock_primed
execute as @e[type=item,nbt={Item:{tag:{gm4_lock:{set:0b}}}}] at @s align xyz if entity @e[type=item,dx=0,nbt={Item:{id:"minecraft:writable_book",tag:{}}}] if block ~ ~-1 ~ minecraft:smithing_table if block ~ ~1 ~ piston[facing=down] run tag @s add gm4_lock_primed

#lock chest
execute as @e[type=item,nbt={OnGround:1b,Item:{Count:1b,tag:{gm4_lock:{set:1b}}}}] at @s positioned ~ ~-.5 ~ if block ~ ~ ~ #private_lockers:lockable run function private_lockers:check_lock
