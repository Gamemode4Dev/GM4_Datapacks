# destroys the trapped_sign
# @s = trapped_sign marker
# located at @s
# run from gm4_hotswap_hotbars:machine/verify_destroy

execute as @e[type=item,nbt={Item:{tag:{display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Hotswapper",{"translate":"item.gm4.hotswapper"}]}'}}}},distance=..1] run data merge entity @s {Item:{tag:{CustomModelData:3420001,gm4_hotswap_hotbars:{item:"hotswapper"}}}}
