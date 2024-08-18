import PageTitle from "../../components/PageTitle/PageTitle";
import "./Items.css";

import Items1 from "./images/Items1.png";
import Items2 from "./images/Items2.png";
import Items3 from "./images/Items3.png";
import Items4 from "./images/Items4.png";
import Items5 from "./images/Items5.png";
import NesPad from "../../components/NesPad/NesPad";
import NesPadMenu from "../../components/NesPad/NesPadMenu/NesPadMenu";
import Box from "../../components/Box/Box";
import { blue, yellow } from "../../styles/colors";

import SuperMushroom from "../PowerUps/images/SuperMushroom.png";
import FireFlower from "../PowerUps/images/FireFlower.png";
import SuperLeaf from "../PowerUps/images/SuperLeaf.png";
import FrogSuit from "../PowerUps/images/FrogSuit.png";
import ShellSuit from "../PowerUps/images/ShellSuit.png";
import SledgeSuit from "../PowerUps/images/SledgeSuit.png";
import IceFlower from "../PowerUps/images/IceFlower.png";
import FoxLeaf from "../PowerUps/images/FoxLeaf.png";
import NinjaShroom from "../PowerUps/images/NinjaShroom.png";
import Wings from "./images/Wings.png";
import Hearts from "./images/Hearts.png";
import StopWatch from "./images/StopWatch.png";
import NesPadCross from "../../components/NesPad/NesPadCross/NesPadCross";
import NesPadAction from "../../components/NesPad/NesPadAction/NesPadAction";
import PageHeader from "../../components/PageHeader/PageHeader";
import Block from "../../components/Block/Block";

const items = [
  {
    name: "Super Mushroom",
    image: SuperMushroom,
    description: "Gives Mario a Super Mushroom.",
  },
  {
    name: "Fire Flower",
    image: FireFlower,
    description: "Gives Mario a Fire Flower.",
  },
  {
    name: "Super Leaf",
    image: SuperLeaf,
    description: "Gives Mario a Super Leaf.",
  },
  {
    name: "Poison Frog Suit",
    image: FrogSuit,
    description: "Gives Mario a Poison Frog Suit.",
  },
  {
    name: "Shell Suit",
    image: ShellSuit,
    description: "Gives Mario a Shell Suit.",
  },
  {
    name: "Sledge Suit",
    image: SledgeSuit,
    description: "Gives Mario a Sledge Suit.",
  },
  {
    name: "Ice Flower",
    image: IceFlower,
    description: "Gives Mario an Ice Flower.",
  },
  {
    name: "Fox Leaf",
    image: FoxLeaf,
    description: "Gives Mario a Fox Leaf.",
  },
  {
    name: "Ninja Shroom",
    image: NinjaShroom,
    description: "Gives Mario a Ninja Shroom.",
  },
  {
    name: "Stop Watch",
    image: StopWatch,
    description: "Stops enemies in their track!",
  },
  {
    name: "Saving Wings",
    image: Wings,
    description: "Gives Mario an opportunity to recover from a pit death.",
  },
  {
    name: "3 Heart Health",
    image: Hearts,
    description: "Protect Mario damage 3 times, even when small!",
  },
];
var Items = () => {
  return (
    <div className="items">
      <PageTitle title="Items">
        Mario can equip items that can be used during level play. He can equip
        power-ups and new items that have various effects, such as saving him
        from a pit death or slowing down time! These items can be purchased at
        The Item Emporium with coins. Be warned, different locations will have
        different prices! In order to use an item, simply press{" "}
        <NesPadMenu select /> while playing a level and Mario will instantly use
        the item stored in the item slot!
      </PageTitle>
      <PageHeader color={blue}>Using Items</PageHeader>
      <div className="items-layout">
        <div className="items-example">
          <img src={Items1} />
          <NesPad zoom={0.75} select />
          <img src={Items2} />
        </div>
      </div>
      <PageHeader color={blue}>Items</PageHeader>
      <div className="items-list">
        {items.map((item) => (
          <Box header={item.name} color={yellow}>
            <div className="item-box">
              <Block color={yellow} boltSize={4} className="item-box-icon">
                <img src={item.image} />
              </Block>
              <div>{item.description}</div>
            </div>
          </Box>
        ))}
      </div>
      <PageHeader color={blue}>Item Emporium</PageHeader>
      <div>
        Mario can get all of items from The Item Emporium. These are located on
        the map and are identifiable by the red mushroom house. Inside, you can
        use <NesPadCross left right /> to navigate the items, <NesPadAction A />{" "}
        to purchase the item and <NesPadAction B /> to leave the shop.
      </div>
      <div className="items-shop">
        <img src={Items3} />
        <img src={Items4} />
        <img src={Items5} />
      </div>
    </div>
  );
};

export default Items;
