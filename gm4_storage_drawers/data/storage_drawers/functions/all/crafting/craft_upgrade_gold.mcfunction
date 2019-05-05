#run from crafting
#@s = crafter with correct recipe for gold upgrade
#This function only exists for the advancement grant

data merge block ~ ~ ~ {Items:[{Slot:8,id:"minecraft:gold_ingot",Count:1b,tag:{gm4_storage_drawers_upgrade_gold:1b, gm4_custom_crafters:{multiplier:1}, display: {Name: '{"text":"Storage Upgrade: Gold"}'}, Enchantments: [{id: ""}]}}]}
advancement grant @a[gamemode=!spectator, distance=..5] only gm4:storage_drawers_create_upgrade_gold