import SuperMushroom from './images/SuperMushroom.png';
import FireFlower from './images/FireFlower.png';
import RaccoonLeaf from './images/RaccoonLeaf.png';
import PoisonFrog from './images/PoisonFrog.png';
import KoopaShell from './images/KoopaShell.png';
import HammerBros from './images/HammerBros.png';
import IceFlower from './images/IceFlower.png';
import FoxLeaf from './images/FoxLeaf.png';
import NinjaMushroom from './images/NinjaMushroom.png';
import StarMan from './images/StarMan.png';
import PWing from './images/PWing.png';

import SuperMushroomExample from './images/SuperMushroom.example.png';
import FireFlowerExample from './images/FireFlower.example.png';
import RaccoonLeafExample from './images/RaccoonLeaf.example.png';
import PoisonFrogExample from './images/PoisonFrog.example.png';
import KoopaShellExample from './images/KoopaShell.example.png';
import HammerBrosExample from './images/HammerBros.example.png';
import IceFlowerExample from './images/IceFlower.example.png';
import FoxLeafExample from './images/FoxLeaf.example.png';
import NinjaMushroomExample from './images/NinjaMushroom.example.png';
import StarManExample from './images/StarMan.example.png';
import PWingExample from './images/PWing.example.png';

const PowerUpList = [
    {
        name: "Super Mushroom",
        description: "Turns Mario into Super Mario! Allows him to sustain a hit and break bricks.",
        image: SuperMushroom,
        example: SuperMushroomExample
    },
    {
        name: "Fire Flower",
        description: "Turns Mario in Fire Mario! Pressing B will throw a fireball. Holding Up and pressing B will lob the fireball upwards.\nFireballs can melt some frozen blocks and create small fires.",
        image: FireFlower,
        example: FireFlowerExample
    },
    {
        name: "Raccoon Leaf",
        description: "Turns Mario into Raccoon Mario! Running will charge his P-Meter. Once full, jumping will allow Mario to fly a short time by repeatedly pressing A.\nPressing B will cause Mario to bat his tail. This can defeat some enemies and deflect some projectiles, including fireballs, iceballs, eggs, hammers and shurikens! ",
        image: RaccoonLeaf,
        example: RaccoonLeafExample
    },
    {
        name: "Poison Frog Suit",
        description: "Turns Mario into Poison Frog Mario! Poison Frog can hop higher than before and hold his breath under water indefinitely!\nWhen Mario's P-Meter is fully charged, holding Down and pressing B will make him invincible for a short amount of time!",
        image: PoisonFrog,
        example: PoisonFrogExample
    },
    {
        name: "Koopa Suit",
        description: "Turns Mario into Koopa Mario! While moving at a high enough speed, pressing Down will cause Mario to go into a spinning shell. This can harm enemies, activate blocks and bounce off harmful spikes and Munchers!",
        image: KoopaShell,
        example: KoopaShellExample
    },
    {
        name: "Hammer Bros. Suit",
        description: "Turns Mario into Hammer Mario! Pressing B will throw a hammer, relative to Mario's movement speed. Hammers can activate blocks, as well as break bricks and stones!",
        image: HammerBros,
        example: HammerBrosExample
    },
    {
        name: "Ice Flower",
        description: "Turns Mario into Ice Mario! Pressing B will throw an iceball. Iceballs can freeze some blocks and also freeze enemies. Frozen enemies can be stood on, picked up and kicked. Iceballs will also freeze the surface of water!",
        image: IceFlower,
        example: IceFlowerExample
    },
    {
        name: "Fox Leaf",
        description: "Turns Mario into Fire Fox Mario! Double tapping the B button will cause Mario to perform a dash attack. Mario will continue to dash forward until the B button is depressed or the P-Meter has depleted. Fire Fox Mario is invulnerable to fire attacks and can swim in lava! The dash attack can break bricks and spinning blocks.",
        image: FoxLeaf,
        example: FoxLeafExample
    },
    {
        name: "Ninja Mushroom",
        description: "Turns Mario into Ninja Mario! Pressing B will throw a shuriken, which can be thrown in 7 directions. While in the air, pressing against the wall will cause Mario to slide down it slowly. Pressing A while sliding will perform a wall jump!",
        image: NinjaMushroom,
        example: NinjaMushroomExample
    },
    {
        name: "P-Wing",
        description: "Turns Mario into Infinite Flight Mario! This works much like Raccoon Mario, except Mario's P-Meter will never deplete! These are very rare and are provided by friendly Lakitus.",
        image: PWing,
        example: PWingExample
    },
    {
        name: "Star Man",
        description: "Turns Mario into Invincible Mario! These are very rare. In fact, rumor has it that they can only be summoned while holding a special item...",
        image: StarMan,
        example: StarManExample
    },

];

export default PowerUpList;