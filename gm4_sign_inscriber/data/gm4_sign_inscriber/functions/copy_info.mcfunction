
# get nbt
data modify storage gm4_sign_inscriber:temp/crafting Items set from block ~ ~ ~ Items
data modify storage gm4_sign_inscriber:temp/crafting BookData set from storage gm4_sign_inscriber:temp/crafting Items[{id:"minecraft:written_book"}].tag.pages

# copy text data
data modify storage gm4_sign_inscriber:temp/crafting Items[1].tag.BlockEntityTag.Text1 set from storage gm4_sign_inscriber:temp/crafting Items[0].tag.pages[0]
data modify storage gm4_sign_inscriber:temp/crafting Items[1].tag.BlockEntityTag.Text2 set from storage gm4_sign_inscriber:temp/crafting Items[0].tag.pages[1]
data modify storage gm4_sign_inscriber:temp/crafting Items[1].tag.BlockEntityTag.Text3 set from storage gm4_sign_inscriber:temp/crafting Items[0].tag.pages[2]
data modify storage gm4_sign_inscriber:temp/crafting Items[1].tag.BlockEntityTag.Text4 set from storage gm4_sign_inscriber:temp/crafting Items[0].tag.pages[3]

# set nbt values
data modify storage gm4_sign_inscriber:temp/crafting Items[1].tag.display.Name set value '{"text":"Inscribed Sign","italic":false}'
data modify storage gm4_sign_inscriber:temp/crafting Items[1].tag.gm4_sign_inscriber.Inscribed set value 1b
data modify storage gm4_sign_inscriber:temp/crafting Items[1].tag.BlockEntityTag.id set value "minecraft:sign"
data modify storage gm4_sign_inscriber:temp/crafting Items[1].tag.CustomModelData set value 4
data modify storage gm4_sign_inscriber:temp/crafting Items[1].Slot set value 8b

# convert text to lore
data modify storage gm4_sign_inscriber:temp/crafting Items[1].tag.display.Lore append from storage gm4_sign_inscriber:temp/crafting Items[1].tag.BlockEntityTag.Text1
data modify storage gm4_sign_inscriber:temp/crafting Items[1].tag.display.Lore append from storage gm4_sign_inscriber:temp/crafting Items[1].tag.BlockEntityTag.Text2
data modify storage gm4_sign_inscriber:temp/crafting Items[1].tag.display.Lore append from storage gm4_sign_inscriber:temp/crafting Items[1].tag.BlockEntityTag.Text3
data modify storage gm4_sign_inscriber:temp/crafting Items[1].tag.display.Lore append from storage gm4_sign_inscriber:temp/crafting Items[1].tag.BlockEntityTag.Text4

# store updated items
data modify block ~ ~ ~ Items set from storage gm4_sign_inscriber:temp/crafting Items 


