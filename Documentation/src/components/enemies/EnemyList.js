import goomba from './images/goomba.png';
import upsidedowngoomba from './images/upsidedowngoomba.png';
import paragoomba from './images/paragoomba.png';
import greentroopa from './images/greentroopa.png';
import greenparatroopa from './images/paragreentroopa.png';
import redtroopa from './images/redtroopa.png';
import pararedtroopa from './images/pararedtroopa.png';
import purpletroopa from './images/purpletroopa.png';
import redcheepcheep from './images/redcheepcheep.png';
import upsidedownredcheepcheep from './images/upsidedownredcheepcheep.png';
import greencheepcheep from './images/greencheepcheep.png';
import piranhaplant from './images/piranhaplant.png';
import venusfiretrap from './images/venusfiretrap.png';
import neptuneicetrap from './images/neptuneicetrap.png';
import oilplant from './images/oilplant.png';
import pottedpiranha from './images/pottedpiranha.png';
import ivyplant from './images/ivyplant.png';
import parapiranha from './images/parapiranha.png';
import bulletbill from './images/bulletbill.png';
import missilemark from './images/missilemark.png';
import buzzy from './images/buzzy.png';
import upsidedownbuzzy from './images/upsidedownbuzzy.png';
import spiny from './images/spiny.png';
import upsidedownspiny from './images/upsidedownspiny.png';
import greenspiny from './images/greenspiny.png';
import spinyegg from './images/spinyegg.png';
import lakitu from './images/lakitu.png';
import redlakitu from './images/redlakitu.png';

const EnemyList = [
    {
        name: "Goomba",
        description: "Your basic mook of the Bowser Kingdom. Beware, during the day, they will move in Mario's direction when they hit the ground!",
        image: goomba
    },
    {
        name: "Upside Down Goomba",
        description: "These Goombas are enchanted with anti-gravity!",
        image: upsidedowngoomba
    },
    {
        name: "Para Goomba",
        description: "These Goombas have been given wings, allowing them to fly for short bursts. Beware, at night, their flight time increases slightly!",
        image: paragoomba
    },
    {
        name: "Green Koopa Troopa",
        description: "Green shelled Koopas that constantly move forward. Their shell allows them to sustain a couple of fireballs and iceballs before being defeated.",
        image: greentroopa
    },
    {
        name: "Green Koopa Para Troopa",
        description: "Green shelled Koopas with wings that bounce around. At night, they have a small amount of hover added to their bounce.",
        image: greenparatroopa
    },
    {
        name: "Red Koopa Troopa",
        description: "Red shelled Koopas that march back and forth on a platform. Like their green brethern, their shells makes them take two hits from a fireball or iceball before they are defeated.",
        image: redtroopa
    },
    {
        name: "Red Koopa Para Troopa",
        description: "Red shelled Koopas that fly in various patterns. Beware, some Red Koopa Para Troopas will give chase and follow Mario around!",
        image: pararedtroopa
    },
    {
        name: "Purple Koopa Troopa",
        description: "Purple shelled Koopas that march back and forth on a platform. Once stomped, they become explosive! Better act quick!",
        image: purpletroopa
    },
    {
        name: "Red Cheep Cheep",
        description: "Fiesty fish that like to hope out of the water towards Mario. If it hits land, it'll bounce around wildly!",
        image: redcheepcheep
    },
    {
        name: "Upside Down Red Cheep Cheep",
        description: "This Cheep Cheep will hop out of the water... but upside down?",
        image: upsidedownredcheepcheep
    },
    {
        name: "Green Cheep Cheep",
        description: "Green Cheep Cheeps like to stick to the water, swimming back and forth in a pattern. However, sometimes a Green Cheep Cheep gets brave and will chase Mario around!",
        image: greencheepcheep
    },
    {
        name: "Piranha Plant",
        description: "Piranha Plants move in and out of a pipe, only stopping once Mario is right on top of a pipe. Beware, standing next to a pipe won't stop these plants!",
        image: piranhaplant
    },
    {
        name: "Venus Fire Trap",
        description: "Venus Fire Traps move in and out of pipes, much like Piranha Plants. However, these guys will shoot fireballs at Mario with amazing accuracy! However, at night, they will shoot their fireballs aimlessly.",
        image: venusfiretrap
    },
    {
        name: "Neptune Fire Trap",
        description: "Neptune Ice Traps are much like their Venus Fire Trap cousins, except these will shoot iceballs at Mario! Be ware, they will freeze you on contact!",
        image: neptuneicetrap
    },
    {
        name: "Industrial Oil Plant",
        description: "These bizarre plants were bred to develop oil. However, they now set their sights on Mario! Careful, some surfaces become slick when an oil blob hits it. If Mario is hit by a blob, he will be covered in oil, making everything slick!",
        image: oilplant
    },
    {
        name: "Ivy Piranha Plant",
        description: "Ivy Piranhas can grow to realy great lengths! Once they've gone as far as they can, they will retract for a short period!",
        image: ivyplant
    },
    {
        name: "Potted Piranha",
        description: "Once any version of a Piranha Plant has been taken out of its pipe, it becomes potted! They cannot move in and out anymore, but will continuously attack Mario!",
        image: pottedpiranha
    },
    {
        name: "Para Piranha Plant",
        description: "As bizarre as it looks, some Piranha Plants have wings! They will shoot out at Mario once he's close, but a great height! Becareful as they slowly descend back into their pipe!",
        image: parapiranha
    },
    {
        name: "Bullet Bill",
        description: "Bullet Bills usually come out of turrets and fire straight ahead. They may be fireproof, but can be taken out with an easy stomp!",
        image: bulletbill
    },
    {
        name: "Missile Mark",
        description: "Missile Marks look like Bullet Bills, but these guys flash and hone in on Mario! Once they make contact with anything, it will explode. However, Ice Mario can use his iceballs to deactivate the Missle Mark's heat seeking abilities!",
        image: missilemark
    },
    {
        name: "Buzzy Beetle",
        description: "Buzzy Beetles have a tough shell that protects them from fireballs and iceballs! They can still be stomped and kicked around, though.",
        image: buzzy
    },
    {
        name: "Upside Down Buzzy Beetle",
        description: "The upside down variants of Buzzy Beetles crawl along the ceiling. Once you are near them, they will go into their shell and spin towards Mario!",
        image: upsidedownbuzzy
    },
    {
        name: "Spiny",
        description: "Spinies have a spiked shell that makes them impervious to being stomped. However, a fireball, iceball, hammer or shuriken will easily take it out!",
        image: spiny
    },
    {
        name: "Upside Down Spiny",
        description: "These spines have been enchanted with anti-gravity! However, once Mario is near them, they will spin in their shell and dropped down to attack!",
        image: upsidedownspiny
    },
    {
        name: "Green Spiny",
        description: "Unlike their red cousins, Green Spinies will march back and forth on a platform, avoiding the edges.",
        image: greenspiny
    },
    {
        name: "Spiny Egg",
        description: "Spiny eggs contain, well, spines! Lakitu will drop these from his cloud in an attempt to attack Mario!",
        image: spinyegg
    },
    {
        name: "Lakitu",
        description: "Lakitu rides around in a cloud, tossing various enemies at Mario. He's known for tossing Spiny Eggs, but rumor has it he can throw other enemies, including lighting",
        image: lakitu
    },
    {
        name: "Red Lakitu",
        description: "Red Lakitus are actually Mario's friend! These helpers will ensure Mario always has the power he needs to complete a stage, following him around, ready to provide an item!",
        image: redlakitu
    }
];

export default EnemyList;