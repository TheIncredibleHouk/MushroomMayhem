import "./App.css";
import Router from "./routing/Router";

import Facebook from "./images/Facebook.png";
import Discord from "./images/Discord.png";
import YouTube from "./images/YouTube.png";
import Block from "./components/Block/Block";

var App = () => {
  return (
    <div>
      <Block className="corner-block" color="#ee9b4e"  boltSize={2} />
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
      <Router />
    </div>
  );
};

export default App;
