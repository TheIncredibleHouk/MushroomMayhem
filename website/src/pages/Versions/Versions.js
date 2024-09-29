import PageHeader from "../../components/PageHeader/PageHeader";
import PageTitle from "../../components/PageTitle/PageTitle";
import "./Versions.css";
import { green } from "../../styles/colors";
import IpsPatcher from "../../components/IpsPatcher/IpsPatcher";

var Versions = () => {
  return (
    <div className="versions">
      <h1>Versions</h1>
      <section>
        I've made it easy to patch your existing ROM to be modified into Mario
        Adventure 3! Just supply any version of Super Mario Bros 3. and the
        online patcher will patch your ROM for you. You can even supply any past
        version of Mario Adventure 3 to get all the updates added to your
        existing ROM!
        <br />
        <br />
        Please report any bugs using{" "}
        <a href="https://forms.gle/2pLB4MVcwEUo94fF7" target="_blank">
          this form
        </a>
        .
      </section>
      <section>
        I've made even easier for you to know the right patch to use! Simply
        provide your own SMB3 rom and click "Patch my ROM!" and the correct
        patch will be applied to your ROM to get the latest version of Mario
        Adventure 3!.
      </section>
      <IpsPatcher />
      <h1>Casual Mode</h1>
      Not a Mario master? Want a more casual experience? Try Casual Mode! Simply
      enter hit [Down] on the d-pad 8 times to activate casual mode. An effect
      will play to let you know you've entered the code correctly!
      <ul>
        <li>
          Taking damage as small Mario does not kill you (pit deaths still
          count)
        </li>
        <li>
          Holding the jump button while in the air will cause Mario to fall at a
          slower speed
        </li>
      </ul>
      <br />
      <h2>September 29, 2024 (v 1.6.5)</h2>
      <div className="versions-layout">
        <div>Major update</div>
        <ul>
          <li>Added tips at the loading screen</li>
          <li>Shells and spring follow Mario through in-level pipes</li>
          <li>Fixed various graphical glitches</li>
          <li>Added a warp zone when you've beaten the final boss so you travel to worlds easily to get the rest of the stars</li>
          <li>Fixed an unintentional end game bug</li>
        </ul>
      </div>
      <br />
      <div className="versions-layout">
        <div>Major update</div>
        <ul>
          <li>Shells and spring follow Mario through in-level pipes</li>
          <li>Fixed various graphical glitches</li>
          <li>Added a warp zone when you've beaten the final boss so you travel to worlds easily to get the rest of the stars</li>
          <li>Fixed an unintentional end game bug</li>
        </ul>
      </div>
      <br />
      <h2>September 26, 2024 (v 1.5.2)</h2>
      <div className="versions-layout">
        <div>Minor update</div>
        <ul>
          <li>Fixed a few minor bugs such as floating Red Koopa Troopas</li>
          <li>Another minor bug with the 2 autoscroller levels in the game where the screen would not crush you</li>
          <li>More minor tweaks to levels</li>
        </ul>
      </div>
      <br />
      <div className="versions-layout">
        <div>Major update</div>
        <ul>
          <li>Fixed bug with bullets shooting the wrong direction</li>
          <li>Added a new 6th ability!</li>
          <li>Various fixes in the master quest</li>
          <li>Fixed Banzai Blooper fight ending too quickly</li>
        </ul>
      </div>
      <br />
      <h2>September 24, 2024 (v 1.3.0)</h2>
      <div className="versions-layout">
        <div>Game mechanic changes</div>
        <ul>
          <li>Fixed a bug that made explosion not hurt Mario</li>
          <li>Added Casual Mode</li>
          <li>
            Fixed a but that made the Thwomp in World 2's boss not deal massive
            damage
          </li>
          <li>Fixed various level layouts</li>
          <li>Fixed "Mario Run" to show the 2nd star correctly</li>
          <li>
            Fixed "Winter Winged Pursuit" 2nd star to contain the right number
            of star coins to make the star appear
          </li>
        </ul>
      </div>
      <br />
      <h2>September 23, 2024 (v 1.2.0)</h2>
      <div className="versions-layout">
        <div>Game mechanic changes</div>
        <ul>
          <li>
            Banzai Blooper has less health, mine explosions cause more damage
          </li>
          <li>
            Beginning Basics (tutorial) updated so ? blocks regen with level
            alterations
          </li>
          <li>Wall jump mechanic altered to be more forgiving</li>
          <li>
            Fixes a bug with vertical oriented stages reseting upon every screen
            transition
          </li>
          <li>
            Fixed a bug with Perennial Piranha boss fight crashing the game
          </li>
        </ul>
        <br />
        <div>Fixes various bugs including</div>
        <ul>
          <li>Glitched graphics when going to the Training Grounds</li>
          <li>Pwing Peril being incoompletable</li>
        </ul>
        <div>
          Alterations to several levels to make theam easier, including:
        </div>
        <ul>
          <li>Shy Guy Retro Revival</li>
          <li>Fungal Block Fling</li>
          <li>Winged Winter Pursuit</li>
          <li>Frigid Waters Freezie Fling</li>
          <li>Frozen Festive Frenzy</li>
          <li>Blizzard Brawl With Ice Bros</li>
          <li>Fierce Fwoosh Freeze</li>
          <li>Mystery Mansion</li>
        </ul>
      </div>
      <br />
      <br />
      <h2>September 22, 2024 (v 1.0.1)</h2>
      <div className="versions-layout">
        <div>Fixes various bugs including</div>
        <ul>
          <li>Fixed minor level layout issue in Winter Winged Pursuit</li>
          <li>Glitch issue with World 2 boss fight</li>
          <li>
            Fixed issue where World 2 boss doesn't affect snow effect as it
            should
          </li>
          <li>Fixed potential soft lock with World 3 boss</li>
          <li>Fixed graphical glitch in World 3 Buccaneer Sea Battle</li>
        </ul>
      </div>
      {/* <h2>September 21, 2024 (v 1.0.0)</h2>
      <div className="versions-layout">
        <ul>
          <li>
            <a href="/patches/1.0.0/Mario Adventure 3 (PRG 0).ips">
              Patch for Super Mario Bros. 3 (PRG 0) version
            </a>
          </li>
          <li>
            <a href="/patches/1.0.0/Mario Adventure 3 (PRG 1).ips">
              Patch for Super Mario Bros. 3 (PRG 1) version
            </a>
          </li>
          <li>
            <a href="/patches/1.0.0/Mario Adventure 3 (PC10).ips">
              Patch for Super Mario Bros. 3 (PC10) version
            </a>
          </li>
        </ul>
      </div> */}
    </div>
  );
};

export default Versions;
