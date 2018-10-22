#@s = custom crafters with valid recipe inside
#runs from recipe_check.json

#tests for TNT Landmine recipe
execute if score @s gm4_slot_count matches 2 if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{id:"minecraft:stone_pressure_plate"},{id:"minecraft:tnt"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:player_head",Count:1b,tag:{gm4_custom_crafters:{multiplier:1},display:{Name:"{\"text\":\"TNT Landmine\",\"color\":\"red\",\"italic\":\"false\"}",Lore:["§fDrop on ground to create!"]},SkullOwner:{Id:"3d80d659-36cd-4aee-8540-8cdb548ede75",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2FmNTk3NzZmMmYwMzQxMmM3YjU5NDdhNjNhMGNmMjgzZDUxZmU2NWFjNmRmN2YyZjg4MmUwODM0NDU2NWU5In19fQ=="}]}}}}]}