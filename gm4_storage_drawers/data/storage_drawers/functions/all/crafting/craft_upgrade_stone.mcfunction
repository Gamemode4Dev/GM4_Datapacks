#run from crafting
#@s = crafter with correct recipe for stone upgrade
#This function only exists for the advancement grant

data merge block ~ ~ ~ {Items:[{Slot:8,id:"minecraft:stone_button",Count:1b,tag:{gm4_storage_drawers_upgrade_stone:1b, m4_custom_crafters:{multiplier:1}, display: {Name: '{"text":"Storage Upgrade: Stone"}'}, Enchantments: [{id: ""}]}}]}
advancement grant @a[gamemode=!spectator, distance=..5] only gm4:storage_drawers_create_upgrade_stone