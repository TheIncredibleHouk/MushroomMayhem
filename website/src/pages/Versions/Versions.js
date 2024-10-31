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
      <h1>Casual Mode - Removed</h1>
      Casual Mode has been removed in favor of an options menu. The options menu can be accessed
      by hitting Start on the world map screen. The options here allow you to access
      the options that were previously enabled by Casual Mode, including invulnerability
      and a "Princess Peach"-style float.
     
      <br />
      <br />
      <h2>October 24, 2024 (v 1.9.9)</h2>
      <br />
      <div className="versions-layout">
      <div>Patch Notes</div>
      <ul>
        <li>Various level layout fixes</li>
      </ul>
      <ul>
        <li>Fixed the final boss fight to end properly</li>
      </ul>
      <div>Patch Notes</div>
      <ul>
        <li>Removed tips screen due to issues on real hardware</li>
        <li>Added option for a Blue Night Sky</li>
        <li>Fixed several level layout issues</li>
      </ul>
      <div>Patch Notes</div>
      <ul>
        <li>Fixed an issue with screen borders at the end of To the Source of Malice</li>
        <li>Fixed the an issue with Star #1 in Scaling the City Sky Master Quest</li>
        <li>Fixed a broken pipe in Chain Chomp Chow Time Master Quest</li>
        <li>Fixed the pointer to the first door in Light Dark Level Duality</li>
        <li>Fixed graphical glitch with coin lock in Pirate Boo Plunder Master Quest</li>
        <li>Fixed graphical glitch with check point flag/frog suit in Pirate Boo Plunder Master Quest</li>
      </ul>
      <div>Patch Notes</div>
      <ul>
        <li>Fixed issue with Breezy Bee Bluffs Master Quest having a duplicate star #1</li>
        <li>Fixed issue with Breezy Bee Bluffs with one of the gusts causing you to get stuck</li>
        <li>Fixed issue in Freezie Frostbite Fjord Master Quest Freezie misplacement</li>
        <li>Fixed pipe in Bonefish Blaze Awash that was previously enterable leading to the 3rd star</li>
        <li>Fixed tile placement in The Source of Malice</li>
      </ul>
      <div>Patch Notes</div>
      <ul>
        <li>Fixed an issue with Boulder Busting Bothers Master Quest</li>
        <li>Fixed a layout issue with The Source of Malice</li>
        <li>Fixed issue with Last Barrier Master Quest</li>
      </ul>
        <div>Patch Notes</div>
        <ul>
          <li>Removed Casual Mode in favor of an options menu</li>
          <li>Added options to control star gating, oxygen meter, etc</li>
          <li>Added option to change status bar color</li>
          <li>Fixed bug with Big Bully boss Bob-ombs getting stuck</li>
          <li>Fixed broken pipe in Freeze Forest transition stage</li>
        </ul>
        <div>Patch Notes</div>
        <ul>
          <li>Autosave is now always on with no option to turn it off</li>
          <li>Title screen updated to include subtitle of the game</li>
          <li>Map pause screen has been updated to reflect its true purpose (and it's not to make toast)</li>
          <li>Altered many world maps to include an item shop near the end for convenience</li>
          <li>Updated tutorial to include Speech Blocks that show explanations only when hit.</li>
          <li>Tutorial now includes a checkpoint.</li>
          <li>Updated Casual Mode to now no longer require collecting stars to progress. First ability is automatically given at the start.</li>
          <li>Casual mode is now an option you choose at the start of a new file</li>
          <li>Fixed a bug when entering upside down pipes on the very edge of the pipe causing issues</li>
          <li>Many levels in World 1 tweaked for better playability</li>
          <li>First training grounds moved to closer to the start along with making the first ability requirement lower</li>
          <li>Fixed a bug on autoscroll levels that caused issues with wall collision</li>
          <li>Modified Ninja Mario to have a dark blue palette against black backgrounds</li>
          <li>All of Master Quest has been play tested and verified completable with collectible stars</li>
          <li>Boss of Master Quest has been modified (no spoilers)</li>
          <li>Big Bully boss has been modified so that he can be stomped on without harm (but not damage to you or him)</li>
          <li>Big Bully will now charge in the direction he's facing rather than switch suddenly when you try to avoid him</li>
          <li>Fixed a major cheese with a few bosses...</li>
        </ul>
      </div>
      <br />
      <div className="versions-layout">
      <div>Patch Notes</div>
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
      <div>Patch Notes</div>
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
      <div>Patch Notes</div>
        <ul>
          <li>Fixed a few minor bugs such as floating Red Koopa Troopas</li>
          <li>Another minor bug with the 2 autoscroller levels in the game where the screen would not crush you</li>
          <li>More minor tweaks to levels</li>
        </ul>
      </div>
      <br />
      <div className="versions-layout">
      <div>Patch Notes</div>
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
      <div>Patch Notes</div>
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
      <div>Patch Notes</div>
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
      <div>Patch Notes</div>
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
