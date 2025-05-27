# initializes the book binders armor stand.
# @s = player who has placed a lectern
# at most negative corner of lectern
# run from binder/placement/find_lectern
execute if block ~ ~ ~ lectern[facing=north] run summon minecraft:armor_stand ~.5 ~.01 ~.38 {NoGravity:1b,Small:1b,ShowArms:1b,Invisible:1b,Pose:{RightArm:[25.0f,0.0f,180.0f]},CustomName:"gm4_book_binder",Tags:["gm4_book_binder","gm4_book_binder_north","gm4_no_edit","smithed.entity","smithed.strict"],equipment:{feet:{id:"minecraft:enchanted_book",count:1}}}
execute if block ~ ~ ~ lectern[facing=south] run summon minecraft:armor_stand ~.5 ~.01 ~.6 {Rotation:[180f,0f],NoGravity:1b,Small:1b,ShowArms:1b,Invisible:1b,Pose:{RightArm:[25.0f,0.0f,180.0f]},CustomName:"gm4_book_binder",Tags:["gm4_book_binder","gm4_book_binder_south","gm4_no_edit","smithed.entity","smithed.strict"],equipment:{feet:{id:"minecraft:enchanted_book",count:1}}}
execute if block ~ ~ ~ lectern[facing=east] run summon minecraft:armor_stand ~.6 ~.01 ~.5 {Rotation:[90f,0f],NoGravity:1b,Small:1b,ShowArms:1b,Invisible:1b,Pose:{RightArm:[25.0f,0.0f,180.0f]},CustomName:"gm4_book_binder",Tags:["gm4_book_binder","gm4_book_binder_east","gm4_no_edit","smithed.entity","smithed.strict"],equipment:{feet:{id:"minecraft:enchanted_book",count:1}}}
execute if block ~ ~ ~ lectern[facing=west] run summon minecraft:armor_stand ~.38 ~.01 ~.5 {Rotation:[-90f,0f],NoGravity:1b,Small:1b,ShowArms:1b,Invisible:1b,Pose:{RightArm:[25.0f,0.0f,180.0f]},CustomName:"gm4_book_binder",Tags:["gm4_book_binder","gm4_book_binder_west","gm4_no_edit","smithed.entity","smithed.strict"],equipment:{feet:{id:"minecraft:enchanted_book",count:1}}}

scoreboard players set @e[type=armor_stand,dx=0,tag=gm4_book_binder] gm4_entity_version 1
