# @template gm4:test_platform
# @timeout 400

# setup legacy displays.... pain

# decorated
setblock ~ ~1 ~2 decorated_pot{item:{id:"minecraft:flowering_azalea",count:1}}
execute align xyz run summon block_display ~0.5 ~1.0 ~2.5 {Tags:["rc_blossoming_pots.decorPotPlant0","rc_blossoming_pots.decorPotPlant"],block_state:{Name:"minecraft:flowering_azalea"},transformation:{translation:[-0.25f,1.2435f,-0.25f],left_rotation:[0f,0f,0f,1f],scale:[0.5f,0.5f,0.5f],right_rotation:[0f,0f,0f,1f]}}

# flower pot
setblock ~2 ~1 ~2 flower_pot
execute align xyz run summon block_display ~2.5 ~1.0 ~2.5 {Tags:["rc_blossoming_pots.flowerPotPlant","rc_blossoming_pots.flowerPotPlant0"],block_state:{Name:"minecraft:amethyst_cluster"},transformation:{translation:[-0.25f,0.2435f,-0.25f],left_rotation:[0f,0f,0f,1f],scale:[0.5f,0.5f,0.5f],right_rotation:[0f,0f,0f,1f]}}
execute align xyz run summon marker ~2.5 ~1.0 ~2.5 {Tags:["rc_blossoming_pots.flowerPot"],data:{id:"minecraft:amethyst_cluster",count:1,full:1}}

# deleted plant
setblock ~2 ~1 ~ flower_pot
execute align xyz run summon block_display ~2.5 ~1.0 ~0.5 {Tags:["rc_blossoming_pots.flowerPotPlant","rc_blossoming_pots.flowerPotPlant0"],block_state:{Name:"minecraft:cocoa"},transformation:{translation:[-0.25f,0.2435f,-0.25f],left_rotation:[0f,0f,0f,1f],scale:[0.5f,0.5f,0.5f],right_rotation:[0f,0f,0f,1f]}}
execute align xyz run summon marker ~2.5 ~1.0 ~0.5 {Tags:["rc_blossoming_pots.flowerPot"],data:{id:"minecraft:cocoa_beans",count:3,full:1}}

function gm4_blossoming_pots:upgrade_paths/3.1

assert entity @e[type=block_display,tag=gm4_blossoming_pots.display.decorated_pot,dx=2,dy=2,dz=2]
assert entity @e[type=block_display,tag=gm4_blossoming_pots.display.flower_pot,dx=2,dy=2,dz=2,nbt={data:{gm4_blossoming_pots:{Item:{id:"minecraft:amethyst_cluster"}}}}]
assert not entity @e[type=marker,tag=rc_blossoming_pots.flowerPot,dx=2,dy=2,dz=2]
assert entity @e[type=item,dx=2,dy=2,dz=2,nbt={Item:{id:"minecraft:cocoa_beans"}}]
