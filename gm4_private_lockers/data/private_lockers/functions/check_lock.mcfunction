# @s = lock item on a chest or other container
# run from main

execute store success score @s gm4_locked run data get block ~ ~ ~ Lock
execute if score @s gm4_locked matches 0 run function private_lockers:lock
