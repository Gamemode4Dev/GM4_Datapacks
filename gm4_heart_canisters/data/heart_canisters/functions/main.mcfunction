# check how many heart canisters the player has
execute as @a[gamemode=!spectator,gamemode=!creative,nbt={Inventory:[{tag:{gm4_heart_canister:1b}}]}] run function heart_canisters:check_heart_canister_count

# give the player the health boost effect
execute as @a[gamemode=!spectator,gamemode=!creative,scores={gm4_heart_can=1..}] run function heart_canisters:apply_health_boost

# fix broken items
data merge entity @e[limit=1,type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"25b1ff93-7926-1cd7-53fe-8e6050792daa"}}}}] {Item:{tag:{gm4_heart_canister:1b,gm4_heart_canister_tier:1b,display:{Lore:["Tier 1"],Name:"{\"text\":\"Heart Canister\",\"italic\":false}"}}}}
data merge entity @e[limit=1,type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"25b1ff93-7925-1cd7-53fe-8e6050792daa"}}}}] {gm4_heart_canister:1b,gm4_heart_canister_tier:2b,Item:{tag:{display:{Lore:["Tier 2"],Name:"{\"text\":\"Heart Canister\",\"italic\":false}"}}}}
