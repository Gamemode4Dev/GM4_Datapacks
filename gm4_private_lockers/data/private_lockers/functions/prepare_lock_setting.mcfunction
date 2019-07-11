# @s = book and quill to set lock item, at lock item
# run from pulse_check

execute store result score @s gm4_locked run data get entity @s Item.tag.pages[0]
execute if score @s gm4_locked matches 1..35 run function private_lockers:set_lock
