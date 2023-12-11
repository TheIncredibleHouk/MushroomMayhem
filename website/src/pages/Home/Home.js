import PageTitle from "../../components/PageTitle/PageTitle";
import HomeStyles from "./Home.styles";
import { Link } from 'react-router-dom';

import Image3 from "./images/3.png";

var links = [
  {
    title: "Power-ups",
    path: "/power-ups",
    page: 2,
  },
  {
    title: "Items",
    path: "/items",
    page: 3,
  },
  {
    title: "Player Stats",
    path: "/stats",
    page: 4,
  },
];

var Home = () => {
  return (
    <HomeStyles>
      <PageTitle
        center
        title="Mario&#10;Adventure"
      />
      <img src={Image3} />
      <div className="home-description">
        Welcome to the Official Mario Adventure 3 Strategy Guide! This website
        will give you all the details about Mario's latest NES adventure with
        tips, tricks and secrets exposed directly by the developer!{" "}
      </div>
      <div className="home-table-contents">
        <h1>Table of Contents</h1>
        <div>
          {links.map((link) => (
            <Link className="home-table-contents-list" to={link.path}>
              <div className="page-name">{link.title}</div>
              <div className="page-spacer" />
              <div className="page-number">{link.page}</div>
            </Link>
          ))}
        </div>
      </div>
    </HomeStyles>
  );
};

export default Home;
