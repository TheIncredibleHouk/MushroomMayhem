import Box from "../../components/Box/Box";
import PageTitle from "../../components/PageTitle/PageTitle";
import { green } from "../../styles/colors";
import CollectiblesStyles from "./Collectibles.styles"

import Coin from './images/Coin.png';
import Cherry from './images/Cherry.png';

var collectibles = [
    {
        name: "Coin",
        image: Coin,
        description: "Collect these and take them to The Item Emporium to purchase items."
    },
    {
        name: "Cherry",
        image: Cherry,
        description: "The Badge Hut will take these in exchange for equipping items."
    },
]
var Collectibles = () => {
    return (
        <CollectiblesStyles>
            <PageTitle title="Collectibles">There are tons of collectibles that Mario will come across. From coins to Magic Stars,
            let's dive into the many items you'll come across spread through out the lands!</PageTitle>
            <div className="collectibles-layout">
                {collectibles.map(collectible => (
                    <Box header={collectible.name} color={green}>
                        <img src={collectible.image} />
                        <div className="collectible-text">{collectible.description}</div>
                    </Box>
                ))}
            </div>
        </CollectiblesStyles>
    )
};

export default Collectibles;