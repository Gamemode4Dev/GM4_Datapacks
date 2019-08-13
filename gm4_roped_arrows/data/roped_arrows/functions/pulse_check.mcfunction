#main was unused so I deleted it

#count the amount of string in a player's inventory and store their rotation if they have a spooled crossbow in hand
execute as @a[nbt={SelectedItem:{tag:{gm4_spooled_crossbow:1b}}}] run function roped_arrows:update_scoreboards