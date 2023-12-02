import coin from './images/coin.png';
import coinExample from './images/coin.example.png';

import question from './images/question.png';
import questionExample from './images/question.example.png';

import brick from './images/brick.png';
import brickExample from './images/brick.example.png';

import cherry from './images/cherry.png';
import cherryExample from './images/cherry.example.png';

import sparkleStar from './images/sparklestar.png';
import sparkleStarExample from './images/sparklestar.example.png';

import mushroomblock from './images/mushroomblock.png';
import mushroomblockExample from './images/mushroomblock.example.png';

import switchitem from './images/switch.png';
import switchitemExample from './images/switch.example.png';

import eswitch from './images/eswitch.png';
import eswitchExample from './images/eswitch.example.png';

import spin from './images/spin.png';
import spinExample from './images/spin.example.png';

import muncher from './images/muncher.png';
import muncherExample from './images/muncher.example.png';

import door from './images/door.png';
import doorExample from './images/door.example.png';

import chest from './images/chest.png';
import chestExample from './images/chest.example.png';

import vine from './images/vine.png';
import vineExample from './images/vine.example.png';

import key from './images/key.png';
import keyExample from './images/key.example.png';

import spring from './images/spring.png';
import springExample from './images/spring.example.png';

import keycoin from './images/keycoin.png';
import keycoinExample from './images/keycoin.example.png';

import coinlock from './images/coinlock.png';
import coinlockExample from './images/coinlock.example.png';

import clock from './images/clock.png';
import clockExample from './images/clock.example.png';

import magnet from './images/magnet.png';
import magnetExample from './images/magnet.example.png';

import stone from './images/stone.png';
import stoneExample from './images/stone.example.png';

const ObjectList = [
    {
        name: "Coin",
        description: "Collect these to buy items in Toad's Item Shop!",
        image: coin,
        example: coinExample
    },
    {
        name: "Cherry",
        description: "Be sure to collect these! A certain ex-Bowser following Koopa loves these and will trade you badges for cherries.",
        image: cherry,
        example: cherryExample
    },
    {
        name: "Sparkle Star",
        description: "Sparkle Stars reverse the power of the Nega Star. There are three in each level, often hidden away.",
        image: sparkleStar,
        example: sparkleStarExample
    },
    {
        name: "Question Block",
        description: "Mario can activate these by jumping up into them, revealing an item. Kicked shells and some projectiles can also activate these blocks.",
        image: question,
        example: questionExample
    },
    {
        name: "Brick Block",
        description: "Small Mario will simply bump bricks, but Super Mario can break them open. Sometimes these are hiding an item! Kicked shells and some projectiles can also activate these blocks.",
        image: brick,
        example: brickExample
    },
    ,
    {
        name: "Spinning Block",
        description: "When activated, these blocks will spin for a short time, allowing Mario to move through them freely. Fire Fox Mario's Dash Attack can break through these with ease!",
        image: spin,
        example: spinExample
    },
    {
        name: "Mushroom Block",
        description: "Mushroom blocks can be picked up as long as Mario is standing on them. They can be used to harm enemies and build higher platforms.",
        image: mushroomblock,
        example: mushroomblockExample
    },
    {
        name: "Switch",
        description: "Switches typically cause coins to turn into bricks and vice versa. Sometimes, blocks, spikes and other things may appear or disappear when a switch is activated. Sometimes a Sparkle Star might appear!",
        image: switchitem,
        example: switchitemExample
    },
    {
        name: "E Switch",
        description: "The E stands for event. When these switchs are hit, various things can occur. They can be paired with E locks which require Mario to activate the E Switch in order to proceed.",
        image: eswitch,
        example: eswitchExample
    },
    {
        name: "Muncher",
        description: "These indestructible plants are out for some Mario flesh! They will hurt Mario on contact, but luckily, Ice Mario can put the freeze on them!",
        image: muncher,
        example: muncherExample
    },
    {
        name: "Door",
        description: "Doors take Mario to new areas in a level. To enter a door, stand in front of one and press Up.",
        image: door,
        example: doorExample
    },
    {
        name: "Treasure Chest",
        description: "Treasure chests and a few other items contain a bounty of coins! Stand in front of one and press B to open it up and reap the rewards!",
        image: chest,
        example: chestExample
    },
    {
        name: "Vine",
        description: "Sometimes a block will produce a Piranha that grows a vine! Use the vine to make your way to higher parts of the level.",
        image: vine,
        example: vineExample
    },
    {
        name: "Key",
        description: "Mario comes across keys from time to time. Mario can grab and kick these keys just like shells. Moving a key over a locked door or key hole block will unlock both, allowing access to new areas!",
        image: key,
        example: keyExample
    },
    {
        name: "Key Coin",
        description: "When you see key icons in the upper left hand corner, then you will find key coins in the level. Collecting the number required will give Mario a key, allowing him to pass to the next area!",
        image: keycoin,
        example: keycoinExample
    },
    {
        name: "Coin Lock",
        description: "Coin locks require a certain amount of coins to remove and allow access to the next level. If Mario moves away from the lock, an indicator appears in the upper left hand corner denoting the remaing coins to collect!",
        image: coinlock,
        example: coinlockExample
    },
    {
        name: "Clock",
        description: "Even though there is no traditional game timer, some levels still have a timer! These levels contain clocks that add time to the timer.",
        image: clock,
        example: clockExample
    },
    {
        name: "Spring",
        description: "Jumping on a spring can send Mario flying high! Mario can also pick up and carry springs. Green springs are stronger, with gold being the strongest.",
        image: spring,
        example: springExample
    },
    {
        name: "Magnet",
        description: "Mario can carry magnets and kick them around. When a magnet comes in contact with metal, it will stick to it, acting as a platform for Mario to us.",
        image: magnet,
        example: magnetExample
    },
    {
        name: "Stone",
        description: "Stone blocks can only be destroyed by hammers and explosions.",
        image: stone,
        example: stoneExample
    }
];

export default ObjectList;