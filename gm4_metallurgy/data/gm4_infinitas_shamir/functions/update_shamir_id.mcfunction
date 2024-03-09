# @s = tool with freshly applied infinitas shamir
# at world spawn
# run by metallurgy once the shamir was applied

# updates Spiraculum shamirs to Infinitas
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{active_shamir:"spiraculum"}}}}] run data modify entity @s Item.tag.display.Lore[-1] set value '{"italic":false,"color":"gray","translate":"item.gm4.shamir.infinitas","fallback":"Infinitas"}'
execute if entity @s[nbt={Item:{tag:{gm4_metallurgy:{active_shamir:"spiraculum"}}}}] run data modify entity @s Item.tag.gm4_metallurgy.active_shamir set value "infinitas"
