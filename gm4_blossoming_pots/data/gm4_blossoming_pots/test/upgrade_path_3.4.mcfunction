# @template gm4:test_platform
# @timeout 400

setblock ~2 ~1 ~2 flower_pot
execute align xyz run summon block_display ~2.5 ~1.5 ~2.5 {view_range:0.7935f,Tags:["gm4_blossoming_pots.display.flower_pot","gm4_blossoming_pots.display.flower_pot.0","smithed.entity"],block_state:{Name:"minecraft:amethyst_cluster"},transformation:{translation:[-0.25f,0.2435f,-0.25f],left_rotation:[0f,0f,0f,1f],scale:[0.5f,0.5f,0.5f],right_rotation:[0f,0f,0f,1f]}}
execute align xyz run summon marker ~2.5 ~1.5 ~2.5 {Tags:["gm4_blossoming_pots.data.flower_pot","smithed.strict","smithed.entity"],data:{gm4_blossoming_pots:{id:"minecraft:amethyst_cluster",count:1,full:1}},CustomName:{"text":"gm4_blossoming_pots.flower_pot"}}

function gm4_blossoming_pots:upgrade_paths/3.4

assert not entity @e[type=marker,tag=gm4_blossoming_pots.data.flower_pot,dx=2,dz=2,dy=2]
assert data entity @e[type=block_display,tag=gm4_blossoming_pots.display.flower_pot.0,limit=1,dx=2,dz=2,dy=2] data.gm4_blossoming_pots.Item.id
