# sets the module pages
# @s = player that last opened the lectern
# at the lectern
# run from gm4_guidebook:lecterns/update

$data modify block ~ ~ ~ Book.components merge value {"minecraft:written_book_content":{"pages":$(pages),"title":"Gamemode 4 Guidebook","author":"Unknown","generation":3},"minecraft:custom_data":{gm4_guidebook:{lectern:1b,trigger:$(trigger)}}}
