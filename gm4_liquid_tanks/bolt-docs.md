# Liquid Tanks Bolt Wrappers
Liquid tanks has a bolt-powered interface to define the myriad of liquid types and items that interact with them, without needing to create lots of redundant function files directly. 

This interface is an *experimental* design, and so maybe not recommended to be replicated for other modules without careful thought. 

# Prereqs
- Add `bolt` to the beet.yaml requirements
- Add `gm4_liquid_tanks.bolt_liquid_wrappers` to the beet.yaml pipeline
- Configure a beet entrypoint; typically:
```
meta:
  bolt:
    entrypoint: 
      - gm4_potion_liquids:main
```

# Basic Usage
Liquids are defined through a class definitions, typically done in a `main.bolt` file, located in `data/gm4_module_namespace/modules/main.bolt`. At the start of the file, import the wrapper with `from gm4_liquid_tanks:liquid_wrappers import liquid`

Each liquid type is a class, defined with the `@liquid` decorator, with 4 class attributes. 
 - `id`: internal id of the liquid
 - `name`: display name in the hopper ie "Water" becomes "Water Tank"
 - `capacity`: maximum fluid units the tank holds
 - `skin`: (optional) resource location for the liquid's skin texture. If omitted, defaults to `liquids/id`

Additional behavior is added by calling or defining methods within the class. 

## Tank Init
The default tank init function is created by calling `liquid.init()`. Additional commands can be appended to the end of the init function by decorating a method:
```py
@liquid.init()
def arbitrary_fcn_name():
    say additional commands done here!
    advancement grant @a[distance=..2] gm4:blood_tank
```

## Item Fill/Drain
Each item that a tank fills or drains is registered by calling `liquid.item_fill` or `liquid.item_drain`. Most items that can be both filled or drained (like a bucket or bottle) only need to call `item_fill`, which also in turn defines its `item_drain` reverse direction. 

An item that only is fillable (like adding water to concrete powder) can be created with `item_fill(reversible=False)`. 
Similarly, an item that is only drainable (like enchanted pages) can be created with `item_drain` directly. 

The arguments of the method define the two items and the amount of liquid imparted to/from the tank by that item. These items are defined by their item stack component test. e.g. `paper[custom_data~{gm4_book_binders:{item:"enchanted_page"}}]`

```py
liquid.item_fill('bucket', 'water_bucket', 3)
liquid.item_fill('glass_bottle', 'minecraft:potion[potion_contents={potion:"water"}]', 1)
liquid.item_drain('paper[custom_data~{gm4_book_binders:{item:"enchanted_page"}}]', 'paper', 5)
```

If the output item requires additional data to be set after being processed by the liquid tank, or if any additional commands are present at the end of the item process file (for advancements for example), then the decorator approach is required. The first set of commands placed before a `yield` is called at the step where the final item data is applied to the `weapon.mainhand` of the forceload armorstand (UUID=`344d47-4-4-4-f04ce104d`), generally following the form: 
`loot replace entity 344d47-4-4-4-f04ce104d weapon.mainhand loot gm4_standard_liquids:ink_bottle`. The second set of commands after a `yield` generates at the end of the function. 

```py
@liquid.item_fill('glass_bottle', 'experience_bottle', 9)
    def experience_bottle():
        item replace entity 344d47-4-4-4-f04ce104d weapon.mainhand with minecraft:experience_bottle
        yield
        execute if score $smart_success gm4_lt_value matches 1 run advancement grant @a[distance=..4,gamemode=!spectator] only gm4:standard_liquids
```

## Util Below
Some basic util-below functionality is available for liquids that have a "dispense" function. Other util-below functionality should be added directly through the creation of the usual function files.

This set of commands is called on tanks of the matching type, and run as provided by a decorated method. 
```py
@liquid.util_below
    def dispense_ink():
        execute as @e[team=!invalid_team,type=!armor_stand,tag=!smithed.strict,limit=1,dx=0] unless entity @s[gamemode=spectator] if entity @s[nbt=!{active_effects:[{id:'minecraft:blindness'}]}] run function gm4_standard_liquids:util/liquid_dispensing/ink
```

# Advanced Usage
## Standard Units
Liquid containers that are commonly used by many items can easily be defined as a "Standard Unit", which will reuse function files wherever possible. Glass bottles and buckets are examples of this. 

A defined standard unit acts in place of the normal `liquid.item_fill` method, with all set arguments already bound. 

```py
bottle = liquid.standard_unit('glass_bottle', 1)

liquid.item_fill('glass_bottle', 'honey_bottle', 1) # then becomes
bottle('honey_bottle')
```

Standard units take an optional `f_name` string parameter that allows the actual function name to be defined, which may prevent collisions when more than one standard unit uses the same item type. 

## Naming Schemes
By default, function files are names according to a preset number of schemes, usually by the item name or potion type if available. Additioinal schemes can be registered to the wrapper via its `schemes` attribute. This functionality is not used yet in the codebase, so please refer to the source code for more details. 

## Partially Bound Liquid Defaults
Liquids with commonly repeated properties (mainly liquid value) can be made with a new instance of the "Liquid" object, replacing the usage of the included `liquid` instance. 
