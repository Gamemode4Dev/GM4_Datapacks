# decide the name of the text_display
# @s = text display
# at chiseled bookshelf, selected book slot
# run from process_display/spawn/init

scoreboard players set $name_given gm4_bookshelf_inspector_data 0

# if book is named use that (decide color based on item)
execute if data storage gm4_bookshelf_inspector:temp book_data{id:"minecraft:enchanted_book"}.tag.display.Name store success score $name_given gm4_bookshelf_inspector_data run data modify storage gm4_bookshelf_inspector:temp text append value '[{"text":"","color":"yellow"},{"nbt":"book_data.tag.display.Name","storage":"gm4_bookshelf_inspector:temp","interpret":true}]'
execute unless score $name_given gm4_bookshelf_inspector_data matches 1 if data storage gm4_bookshelf_inspector:temp book_data.tag.Enchantments if data storage gm4_bookshelf_inspector:temp book_data.tag.display.Name unless data storage gm4_bookshelf_inspector:temp book_data{id:"minecraft:enchanted_book"} store success score $name_given gm4_bookshelf_inspector_data run data modify storage gm4_bookshelf_inspector:temp text append value '[{"text":"","color":"aqua"},{"nbt":"book_data.tag.display.Name","storage":"gm4_bookshelf_inspector:temp","interpret":true}]'
execute unless score $name_given gm4_bookshelf_inspector_data matches 1 store success score $name_given gm4_bookshelf_inspector_data run data modify storage gm4_bookshelf_inspector:temp text append from storage gm4_bookshelf_inspector:temp book_data.tag.display.Name

# if not and book & quill use the title
execute unless score $name_given gm4_bookshelf_inspector_data matches 1 store success score $name_given gm4_bookshelf_inspector_data if data storage gm4_bookshelf_inspector:temp book_data.tag.title if data storage gm4_bookshelf_inspector:temp book_data.tag.Enchantments run data modify storage gm4_bookshelf_inspector:temp text append value '[{"text":"","color":"aqua"},{"nbt":"book_data.tag.title","storage":"gm4_bookshelf_inspector:temp"}]'
execute unless score $name_given gm4_bookshelf_inspector_data matches 1 store success score $name_given gm4_bookshelf_inspector_data if data storage gm4_bookshelf_inspector:temp book_data.tag.title run data modify storage gm4_bookshelf_inspector:temp text append value '{"nbt":"book_data.tag.title","storage":"gm4_bookshelf_inspector:temp"}'

# if not and (enchanted) book use translation key
execute unless score $name_given gm4_bookshelf_inspector_data matches 1 store success score $name_given gm4_bookshelf_inspector_data if data storage gm4_bookshelf_inspector:temp book_data{id:"minecraft:enchanted_book"} run data modify storage gm4_bookshelf_inspector:temp text append value '{"translate":"item.minecraft.enchanted_book","color":"yellow"}'
execute unless score $name_given gm4_bookshelf_inspector_data matches 1 store success score $name_given gm4_bookshelf_inspector_data if data storage gm4_bookshelf_inspector:temp book_data{id:"minecraft:book"} run data modify storage gm4_bookshelf_inspector:temp text append value '{"translate":"item.minecraft.book"}'
execute unless score $name_given gm4_bookshelf_inspector_data matches 1 store success score $name_given gm4_bookshelf_inspector_data if data storage gm4_bookshelf_inspector:temp book_data{id:"minecraft:book"}.tag.Enchantments run data modify storage gm4_bookshelf_inspector:temp text append value '{"translate":"item.minecraft.book","color":"aqua"}'
execute unless score $name_given gm4_bookshelf_inspector_data matches 1 store success score $name_given gm4_bookshelf_inspector_data if data storage gm4_bookshelf_inspector:temp book_data{id:"minecraft:writable_book"} run data modify storage gm4_bookshelf_inspector:temp text append value '{"translate":"item.minecraft.writable_book"}'
execute unless score $name_given gm4_bookshelf_inspector_data matches 1 store success score $name_given gm4_bookshelf_inspector_data if data storage gm4_bookshelf_inspector:temp book_data{id:"minecraft:writable_book"}.tag.Enchantments run data modify storage gm4_bookshelf_inspector:temp text append value '{"translate":"item.minecraft.writable_book","color":"aqua"}'
execute unless score $name_given gm4_bookshelf_inspector_data matches 1 store success score $name_given gm4_bookshelf_inspector_data if data storage gm4_bookshelf_inspector:temp book_data{id:"minecraft:knowledge_book"} run data modify storage gm4_bookshelf_inspector:temp text append value '{"translate":"item.minecraft.knowledge_book","color":"light_purple"}'

# if written book also display the author
execute if data storage gm4_bookshelf_inspector:temp book_data{id:"minecraft:written_book"} run data modify storage gm4_bookshelf_inspector:temp text append value '{"translate":"book.byAuthor","with":[{"nbt":"book_data.tag.author","storage":"gm4_bookshelf_inspector:temp"}],"color":"gray"}'

# if enchanted book with enchantments also display the enchantments
execute if data storage gm4_bookshelf_inspector:temp book_data{id:"minecraft:enchanted_book"}.tag.StoredEnchantments run function gm4_bookshelf_inspector:process_display/spawn/list_enchantments
