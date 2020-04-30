# @s an active book binder with active hopper in the back
# at location of hopper
# run from gm4_book_binders:binder/tick

# copy the last stone slot to a temp array
execute store success score found_item gm4_binder_data run data modify storage gm4_book_binders:binder_container Items set from block ~ ~ ~ Items

# move item out of hopper if an item was found
execute if score found_item gm4_binder_data matches 1.. run function gm4_book_binders:binder/hopper/found_item
