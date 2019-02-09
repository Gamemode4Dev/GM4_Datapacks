#
execute as @a[gamemode=!spectator,gamemode=!creative] run function heart_canisters:player

# fix broken items
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",tag:{SkullOwner:{Id:"25b1ff93-7926-1cd7-53fe-8e6050792daa"}}}}] run data merge entity @s {Item:{tag:{gm4_heart_canister:1b,gm4_heart_canister_tier:1b,display:{Lore:["Tier 1"],Name:"{\"text\":\"Heart Canister\",\"italic\":false}"}}}}
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",tag:{SkullOwner:{Id:"25b1ff93-7925-1cd7-53fe-8e6050792daa"}}}}] run data merge entity @s {gm4_heart_canister:1b,gm4_heart_canister_tier:2b,Item:{tag:{display:{Lore:["Tier 2"],Name:"{\"text\":\"Heart Canister\",\"italic\":false}"}}}}
