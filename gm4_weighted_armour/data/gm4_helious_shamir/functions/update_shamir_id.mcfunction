# @s = tool with freshly applied helious shamir
# at world spawn
# run by metallurgy once the shamir was applied

# repair shamirs that were made during 1.13-1.15 (fixes typo)
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{active_shamir:"helios"}}}}] run data modify entity @s Item.tag.display.Lore[-1] set value '{"italic":false,"color":"gray","translate":"item.gm4.shamir.helious","fallback":"Helious"}'
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{active_shamir:"helios"}}}}] run data modify entity @s Item.tag.gm4_metallurgy.active_shamir set value "helious"
