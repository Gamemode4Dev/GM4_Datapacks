#run from crafting
#@s = crafter with correct recipe for iron upgrade
#This function only exists for the advancement grant

data merge block ~ ~ ~ {Items:[{Slot:8,id:"minecraft:iron_ingot",Count:1b,tag:{gm4_storage_drawers_upgrade_iron:1b, gm4_custom_crafters:{multiplier:1}, display: {Name: '{"text":"Storage Upgrade: Iron"}'}, Enchantments: [{id: ""}]}}]}
advancement grant @a[gamemode=!spectator, distance=..5] only gm4:storage_drawers_create_upgrade_iron