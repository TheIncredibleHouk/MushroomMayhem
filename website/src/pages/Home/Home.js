import { Link } from "react-router-dom";
import routes from "../../routing/routes";
import title from "./images/title.png";
import "./Home.css";

var Home = () => {
  return (
    <div className="home">
      <p>
        Welcome to the Official Mario Adventure 3 website! This website
        will give you all the details about Mario's latest NES adventure with
        tips, tricks and secrets exposed directly by the developer!
      </p>

      <h1>Version 1.9.9</h1>
      <p><img src={title} /></p>
      <p>Last updated October 26, 2024 (10:30pm EST)</p>
      <p>
        It's been an extremely long project, but after 12 years, it's finally
        here, Mario Adventure 3 is now live! There are a lot to this game, and I
        mean A LOT! It has gone through a whole month of beta testing, but not
        everything can be found by a small team, so please fill out{" "}
        <a href="https://forms.gle/2pLB4MVcwEUo94fF7" target="_blank">
          this form
        </a> with any issues you may run into the game.
        <br />
        Be sure to check out my Facebook and this site for the latest updates to
        the game!
        <br />
        <br />
        It's highly commended that you check out the{" "}
        <Link to="/basics">Basics</Link> and{" "}
        <Link to="/techniques">Techniques</Link> section of this guide
        <br />
        <br />
        Bring your own ROM and having it patched over in the{" "}
        <Link to="/versions">versions</Link> link and enjoy!!<br />
      </p>
      <p>
        <h1>Story</h1>
        The Malice Mushrooms have taken over Bowser's Kingdom! The Bowser is
        blaming Princess Peach and her own Mushroom Kingdom for the infestation
        and has declared war! Mario is asked to clear the Malice from Bowser's
        Kingdom to clear Peach's name and to stop an impending war. Travel
        through the Koopa Kingdom and exterminate the Malice infestation!
      </p>
      <div className="home-table-contents">
        <h1>Table of Contents</h1>
        <div>
          {routes.slice(1).map((link, index) => (
            <Link className="home-table-contents-list" to={link.path}>
              <div className="page-name">{link.title}</div>
              <div className="page-spacer" />
              <div className="page-number">{index + 2}</div>
            </Link>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Home;
