import PageHeader from "../../components/PageHeader/PageHeader";
import PageTitle from "../../components/PageTitle/PageTitle";
import { blue, green, red, yellow } from "../../styles/colors";
import "./About.css"

import MarioAdventure from './images/MarioAdventure.gif'
import Reuben from './images/Reuben.png';
import LuigiCoinQuest from './images/LuigiCoinQuest.png';
import LuigivsMario from './images/LuigivsMario.jpg';
import KoopaKingdomEscape from './images/KoopaKingdomEscape.png';
import MarioAdventure3 from './images/MarioAdventure3.png'

var About = () => {
    return (
        <div className="about">
            <h1>About</h1>
            <h2>Mario Adventure</h2>
            <section>
                Mario Adventure is a ROM hack of Super Mario Bros. 3. It was developed back in 2001 and released roughly in January of 2002.
                At the time, Mario Adventure was one of the most extensive hacks of not just Super Mario Bros. 3, but any NES hack. It's been highly regarded
                as one of the best ROM hacks of all time. However, the game was created with very little knowledge of proper game design. While technically
                impressive, it was not very accessible to most people.
                <div className="about-screenshots">
                    <img src={MarioAdventure} />
                </div>
            </section>
            <h2>Luigi's Coin Quest</h2>
            <section>
                In 2004, a proof of concept project was started that starred Luigi as the protagonist. This ROM hack aimed to change the Mario formula
                to be more exploration based and include features not seen in Super Mario Bros. 3 ROM hacks yet. Including collecting cherries, gaining abilities and
                completing levels by finding a switch then a hidden coin. The game was meant to have Luigi travel across the lands without cutscenes, but after one
                world, the project was abandoned.
                <div className="about-screenshots">
                    <img src={LuigiCoinQuest} />
                </div>
            </section>
            <h2>Luigi vs. Mario</h2>
            <section>
                Considered by many to be a spiritual successor to Mario Adventure (i.e. Mario Adventure 2), this ROM hack continued the ambition by having
                completely brand new power-ups, including the Panda Suit and Mouser Suit. The game contained two seperate adventures where Mario and Luigi played 
                completely different levels and worlds. Unfortunately, the game had to be shelved due to a PC reset and causing a loss of progress. A total of 7 worlds
                (5 on Luigi's side, 2 on Mario's) were completed.
                <div className="about-screenshots">
                    <img src={LuigivsMario} />
                </div>
            </section>
            <h2>Reuben</h2>
            <section>
                In 2009, a new Super Mario Bros. 3 editor called Reuben was started. This editor aimed to expand the capabilities of Super Mario Bros. 3 and 
                serve as the ultimate editor. It expanded the ROM, changed the level format and was abandoned a few months later since life tends
                to take hold of people who have hobbyist projects.
                <div className="about-screenshots">
                    <img src={Reuben} />
                </div>
            </section>
            
            <h2>Koopa Kingdom Escape</h2>
            <section>
                Thanks to the efforts by a person known as southbird3 (creator of <a href="https://www.romhacking.net/hacks/2068/">Super Mario 3 Mix</a>), Super Mario Bros. 3
                was reversed engineered in to a readable source in 6502 ASM. Curious, the developer of Mario Adventure, Luigi vs Mario and Luigi's Coin Quest decided
                to check out this source code in July of 2012. Within a few months, a new project was started that made use of the abandoned Reuben editor to see a new project to fruition.
                This project was initially called Koopa Kingdom Escape.
                <div className="about-screenshots">
                    <img src={KoopaKingdomEscape} />
                </div>
            </section>
            <h2>Mario Adventure 3</h2>
            <section>
                It has been nearly 12 years since this project began. Many of this game's elements are iterations and polishes on concepts found in prior projects.
                Mario Adventure 3 is more than a 12 year project, it's a 20 year amalgamation of ideas waiting to see fruition. Many of the ideas
                seen in Mario Adventure 3 are improvements of prior game ideas:
                <ul>
                    <li>Day and night system (Mario Adventure)</li>
                    <li>Weather effects (Mario Adventure)</li>
                    <li>Item shop (Mario Adventure and Luigi vs Mario)</li>
                    <li>Exploration heavy (Luigi's Coin Quest)</li>
                    <li>Traversing and backtracking worlds across the entire game with no cutscenes (Luigi's Coin Quest)</li>
                    <li>Hidden collectibles to gain access to blocked areas (Luigi vs Mario)</li>
                    <li>And so much more!</li>
                </ul>
                Overall, this is an ambitious projects that has involved:
                <ul>
                    <li>Completely custom level format</li>
                    <li>A tile collision system built from the ground up</li>
                    <li>Object handling system rewritten from scratch</li>
                    <li>Every enemy rewritten from the ground up</li>
                    <li>4 brand new power-ups and expansions of 4 returning power-ups</li>
                    <li>New graphics effects including weather, new debris types, and displaying more colors than the NES can normally handle</li>
                    <li>And yes, this runs on real NES hardware!</li>
                </ul>
                <div className="about-screenshots">
                    <img src={MarioAdventure3} />
                </div>
            </section>
        </div>
    )
};

export default About;