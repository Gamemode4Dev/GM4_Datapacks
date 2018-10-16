#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = trapped_signs gm4_clockTick run function trapped_signs:main

execute as @a[scores={gm4_place_sign=1..}] run function trapped_signs:place_sign
tag @a remove trapped_sign_holding
tag @a[nbt={SelectedItem:{id:"minecraft:sign",tag:{gm4_trapped_sign:1b}}}] add trapped_sign_holding
