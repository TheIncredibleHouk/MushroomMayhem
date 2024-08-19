import "./App.css";
import Router from "./routing/Router";

import Facebook from "./images/Facebook.png";
import Discord from "./images/Discord.png";
import YouTube from "./images/YouTube.png";
import Block from "./components/Block/Block";
import PageTitle from "./components/PageTitle/PageTitle";

var App = () => {
  return (
    <div>
      <PageTitle className="main-header" title="Mario Adventure 3" center />
      <div className="social-media">
        <a href="https://www.facebook.com/MarioAdventure3" target="_blank">
          <img className="facebook" src={Facebook} />
        </a>
        <a href="https://discord.gg/7YBRwB5K" target="_blank">
          <img className="discord" src={Discord} />
        </a>
        <a
          href="https://www.youtube.com/channel/UCDiJTcJzZxpOzXkmJsKKPag"
          target="_blank"
        >
          <img className="youtube" src={YouTube} />
        </a>
      </div>
      <div className="content">
        <Router />
      </div>
    </div>
  );
};

export default App;
