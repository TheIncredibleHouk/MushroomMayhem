import PageTitle from "../../components/PageTitle/PageTitle";
import HomeStyles from "./Home.styles";
import { Link } from 'react-router-dom';

import Image3 from "./images/3.png";
import routes from "../../routing/routes";
import PageHeader from "../../components/PageHeader/PageHeader";

import { red } from "../../styles/colors";

var Home = () => {
  var showDemos = () => {
    var date = new Date();
    if(date >= Date.UTC(2023, 11, 23, 18)){
      return true;
    }
    return false;
  };

  return (
    <HomeStyles>
      <PageTitle
        center
        title="Mario Adventure"
      />
      <img className="title-3" src={Image3} />
      <div className="home-description">
        Welcome to the Official Mario Adventure 3 Strategy Guide! This website
        will give you all the details about Mario's latest NES adventure with
        tips, tricks and secrets exposed directly by the developer!{" "}
      </div>
      { showDemos() &&
        <>
          <PageHeader color={red}>New Demo Released (Update)!</PageHeader>
          <div className="home-description">
            A new demo has been on December 23, 2023! This contains the entirety of the first world, which includes 9 levels,
            a fortress (boss level), and having the chance to earn the first ability of the game! Important note: your game save
            from the demo will not transfer to the full version. It's highly commended that you check out
            the <Link to="/basics">Basics</Link> and <Link to="/techniques">Techniques</Link> section of this guide. Download your appropriate patch in <Link to="/demos">Demos</Link> and happy holidays!
            <br />
            <br />
            An update to the demo has been created that includes:
            <ul>
              <li>Reworked levels</li>
              <li>Autosave feature</li>
              <li>Tutorial level</li>
              <li>Alterations to some enemies and mechanics based off feedback</li>
            </ul>
          </div>
        </>
      }
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
    </HomeStyles>
  );
};

export default Home;
