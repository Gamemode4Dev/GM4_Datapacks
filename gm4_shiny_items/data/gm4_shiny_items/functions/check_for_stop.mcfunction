# Run from main
# @s = All items with a score "gm4_absorbed_xp" of 0 or more

# If the Item meets these conditions it will stop all progress and refund xp
execute if entity @p[distance=..1] run function gm4_shiny_items:undo_item_progress
execute if block ~ ~-6 ~ hopper run function gm4_shiny_items:undo_item_progress