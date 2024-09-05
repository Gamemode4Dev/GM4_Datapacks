# @s an active book binder with active hopper in the back
# at location of hopper
# run from gm4_book_binders:binder/tick

# give item into armor stand's hand (done before count is reduced)
data modify entity @s HandItems[0] set from block ~ ~ ~ Items[0]
data modify entity @s HandItems[0].count set value 1

# remove one item from hopper's first (filled) slot
execute store result score $hopper_slot_count gm4_binder_data run data get block ~ ~ ~ Items[0].count

execute if score $hopper_slot_count gm4_binder_data matches ..1 run data remove block ~ ~ ~ Items[0]
execute if score $hopper_slot_count gm4_binder_data matches 2.. store result block ~ ~ ~ Items[0].count int 1 run scoreboard players remove $hopper_slot_count gm4_binder_data 1
