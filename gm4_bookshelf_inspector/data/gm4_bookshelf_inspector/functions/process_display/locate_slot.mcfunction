# locate decided book slot in this chiseled bookshelf, then spawn text_display there
# @s = player not in spectator mode
# at chiseled bookshelf
# run from find_book/find_book

execute if score $book_slot gm4_bookshelf_inspector_data matches 0 run function gm4_bookshelf_inspector:process_display/check_location
execute if score $book_slot gm4_bookshelf_inspector_data matches 1 positioned ^0.3125 ^ ^ run function gm4_bookshelf_inspector:process_display/check_location
execute if score $book_slot gm4_bookshelf_inspector_data matches 2 positioned ^0.625 ^ ^ run function gm4_bookshelf_inspector:process_display/check_location
execute if score $book_slot gm4_bookshelf_inspector_data matches 3 positioned ^ ^-0.5 ^ run function gm4_bookshelf_inspector:process_display/check_location
execute if score $book_slot gm4_bookshelf_inspector_data matches 4 positioned ^0.3125 ^-0.5 ^ run function gm4_bookshelf_inspector:process_display/check_location
execute if score $book_slot gm4_bookshelf_inspector_data matches 5 positioned ^0.625 ^-0.5 ^ run function gm4_bookshelf_inspector:process_display/check_location
