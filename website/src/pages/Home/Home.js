import PageTitle from "../../components/PageTitle/PageTitle";
import { Link } from "react-router-dom";

import Image3 from "./images/3.png";
import routes from "../../routing/routes";
import PageHeader from "../../components/PageHeader/PageHeader";

import { red } from "../../styles/colors";
import title from './images/title.png';
import "./Home.css";

var Home = () => {
  return (
    <div className="home">
      <div className="home-description">
        Welcome to the Official Mario Adventure 3 Strategy Guide! This website
        will give you all the details about Mario's latest NES adventure with
        tips, tricks and secrets exposed directly by the developer!{" "}
      </div>

      <h1>Version 1.0.1 Out!</h1>
      <img src={title} />
      <div className="home-description">
        It's been an extremely long project, but after 12 years, it's finally here. Version 1.0 of
        Mario Adventure 3 is now live! There are a lot to this game, and I mean
        A LOT! It has gone through a whole month of beta testing, but not
        everything can be found by a small team, so please fill out{" "}
        <a href="https://forms.gle/2pLB4MVcwEUo94fF7" target="_blank">
          this form
        </a>{" "}
        with any issues you may run into the game. Be sure to check out my
        Facebook and this site for the latest updates to the game!
        <br />
        <br />
        It's highly commended that you check out the{" "}
        <Link to="/basics">Basics</Link> and{" "}
        <Link to="/techniques">Techniques</Link> section of this guide
        <br />
        <br />
        Download your appropriate patch in <Link to="/versions">
          versions
        </Link>{" "}
        link and enjoy!!
      </div>
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
