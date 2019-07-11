#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = private_lockers gm4_clock_tick run function private_lockers:main

#prepare for lock setting
execute as @e[type=item,tag=gm4_lock_primed] at @s if block ~ ~ ~ minecraft:moving_piston align xyz as @e[type=item,dx=0,nbt={Item:{id:"minecraft:writable_book",tag:{}}}] run function private_lockers:prepare_lock_setting
