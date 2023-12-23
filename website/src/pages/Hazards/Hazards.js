import Box from "../../components/Box/Box";
import NesPadAction from "../../components/NesPad/NesPadAction/NesPadAction";
import PageTitle from "../../components/PageTitle/PageTitle";
import HazardsStyles from "./Hazards.styles";

import Barrel from './images/Barrel.png';
import BigFireball from './images/BigFireball.png';
import Cactus from './images/Cactus.png';
import CannonBall from './images/CannonBall.png';
import Egg from './images/Egg.png';
import Explosion from './images/Explosion.png';
import Fire from './images/Fire.png';
import Fireball from './images/Fireball.png';
import Flame from './images/Flame.png';
import Frost from './images/Frost.png';
import Hammer from './images/Hammer.png';
import Iceball from './images/Iceball.png';
import IceSpike from './images/IceSpike.png';
import Lava from './images/Lava.png';
import Lightning from './images/Lightning.png';
import Munchers from './images/Munchers.png';
import Oil from './images/Oil.png';
import Plunger from './images/Plunger.png';
import Pollution from './images/Pollution.png';
import Shuriken from './images/Shuriken.png';
import SpikeBall from './images/SpikeBall.png';
import SpikedVine from './images/SpikedVine.png';
import Spikes from './images/Spikes.png';
import Veggie from './images/Veggie.png';
import Wind from './images/Wind.png';


var hazards = [
    {
        name: "Fireball",
        image: Fireball,
        description: "A flame wound up in a ball. These can either move through the air or bounce along the ground. Enemy fireballs can even melt frozen object!"
    },
    {
        name: "Iceball",
        image: Iceball,
        description: <>A frozen ball of ice, these will freeze Mario in his tracks and send him sliding away. Tap <NesPadAction A /> repeatedly to break out of being frozen.</>
    },
    {
        name: "Hammer",
        image: Hammer,
        description: "These fly through the air in an arch. They can break stone blocks and brick blocks."
    },
    {
        name: "Shuriken",
        image: Shuriken,
        description: "Also know as ninja stars, these are sent zipping their the air in many directions."
    },
    {
        name: "Big Fireball",
        image: BigFireball,
        description: "These larger fireballs  will melt ice blocks but continue moving forward rather than being extinguished. These move through the air."
    },
    {
        name: "Explosions",
        image: Explosion,
        description: "Bobombs aren't the only things that can explode. Explosions will break some blocks around them and have a wide area of danger!"
    },
    {
        name: "Spiked Ball",
        image: SpikeBall,
        description: "Spiked balls cannot be stopped! They can be chained and spin in a circle or bounce along the ground, breaking brick blocks in their way. Raccoon Mario cannot deflect these."
    },
    {
        name: "Lighting Bolt",
        image: Lightning,
        description: " Once a bolt of lighting hits the ground, shock waves spread across the ground. Be sure not to bein water if lighting happens to strike into else Mario and everything in the water will get hurt!"
    },
    {
        name: "Oil Blob",
        image: Oil,
        description: "Oil blobs will coat Mario in oil and make everything slippery. Oil blobs can even coat some surfaces, making them slippery!"
    },
    {
        name: "Egg",
        image: Egg,
        description: "Mario cannot stand on these eggs! Getting hit by an egg causes Mario to become covered in yolk, inhibiting his ability to run and use any attack but his stomp! A dip in water should clear this up."
    },
    {
        name: "Cannonball",
        image: CannonBall,
        description: "Cannonbals can break through brick blocks, but will fall away when hitting solid ground. Mario can also jump on cannonballs to send them flying away."
    },
    {
        name: "Barrel",
        image: Barrel,
        description: "Barrels run along the ground and can award Mario some experience should he jump right over them!"
    },
    {
        name: "Veggie",
        image: Veggie,
        description: "Unfortunately, Mario cannot pull veggies from the ground, but Veggie Guys can! Don't try to catch them as these are deadly!"
    },
    {
        name: "Plunger",
        image: Plunger,
        description: "Plungers can stick to Mario and send him flying into a wall. However, when a plunger hits a wall, it'll stick for a moment and serve as a platform!"
    },
    {
        name: "Muncher",
        image: Munchers,
        description: "Munchers are indestructible, but suspectible to iceballs! They can be frozen and stood on."
    },
    {
        name: "Fire",
        image: Fire,
        description: "Some enemies can leave a trail of fire behind. Ice Mario's iceballs can extingish the fire."
    },
    {
        name: "Flame",
        image: Flame,
        description: "An ongoing torch of flames, some devices will emit these flames periodically."
    },
    {
        name: "Frost",
        image: Frost,
        description: "An ongoing breath of ice that will freeze Mario and enemies that touch it."
    },
    {
        name: "Spikes",
        image: Spikes,
        description: "A classic hazard, Mario can use his shell spin buff to bounce off these."
    },
    {
        name: "Ice Spikes",
        image: IceSpike,
        description: "Like regular spikes, but fireballs can melt these."
    },
    {
        name: "Cactus",
        image: Cactus,
        description: "These thorny plants may hurt Mario, but his fireballs will burn them away."
    },
    {
        name: "Thorny Vines",
        image: SpikedVine,
        description: "These are left behind by some Piranha Plants, but they will hurt Mario if he touches them. They can resist fireball attacks."
    },
    {
        name: "Lava",
        image: Lava,
        description: "Another classic hazard, enemies that are not fireproof will die when touching lava. Mario will too unless he's wearing the Fox Suit!"
    },
    {
        name: "Pollution",
        image: Pollution,
        description: "Black clouds indicate bad air! Being inside this will start to deplete Mario's air so don't stick around too long!"
    },
    {
        name: "Wind",
        image: Wind,
        description: "There are different weather conditions through out the game, but sometimes it comes with high winds that push against Mario and objects."
    },
]
var Hazards = () =>{
    return (
        <HazardsStyles>
            <PageTitle title="Hazards">
                The lands that Mario traverses in this adventure contain all kinds of hazards. Lava, spiked balls on chains,
                and Munchers are just a few of the hazards he'll have to avoid during this journey.
            </PageTitle>
            <div className="hazards-layout">
                {hazards.map(hazard => (
                    <Box header={hazard.name} color="black">
                        <div className="hazard-layout">
                            <img src={hazard.image} />
                            <span>{hazard.description}</span>
                        </div>
                    </Box>
                ))}
            </div>
        </HazardsStyles>
    )
};

export default Hazards;