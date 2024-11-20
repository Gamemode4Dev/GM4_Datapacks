# player holding writable_book
execute as @a[gamemode=!spectator,predicate=gm4_better_armour_stands:holding/mainhand/book_and_quill] at @s run function gm4_better_armour_stands:book/hold

schedule function gm4_better_armour_stands:main 16t
