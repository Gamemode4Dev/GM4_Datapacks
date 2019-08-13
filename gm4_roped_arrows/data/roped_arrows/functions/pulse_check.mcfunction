#main was unused so I deleted it

#count the amount of string in a player's inventory if they have a roped arrow in a crossbow in their hand
execute as @a[nbt={SelectedItem:{tag:{gm4_spooled_crossbow:1b}}}] run function roped_arrows:update_scoreboards