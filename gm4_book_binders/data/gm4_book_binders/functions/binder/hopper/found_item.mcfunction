# @s an active book binder with active hopper in the back
# at location of hopper
# run from gm4_book_binders:binder/hopper/grab

# give item into armor stand's hand (done before count is reduced)
data modify entity @s HandItems[0] set from storage gm4_book_binders:binder_container Items[0]
data modify entity @s HandItems[0].Count set value 1

# remove one item from hopper's first (filled) slot
execute store result storage gm4_book_binders:binder_container Items[0].Count byte 1 run data get storage gm4_book_binders:binder_container Items[0].Count 0.99

# return items into hopper
data modify block ~ ~ ~ Items append from storage gm4_book_binders:binder_container Items[0]

# clean up storage
data remove storage gm4_book_binders:binder_container Items
