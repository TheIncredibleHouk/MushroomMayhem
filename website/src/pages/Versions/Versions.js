import PageHeader from "../../components/PageHeader/PageHeader";
import PageTitle from "../../components/PageTitle/PageTitle";
import "./Versions.css";
import { green } from "../../styles/colors";

var Versions = () => {

  return (
    <div className="versions">
      <h1>Versions</h1>
      <section>
        Versions of Mario Adventure 3 are distributed via IPS patch files. This
        patch files require an original Super Mario Bros 3. ROM. These patch
        files do not contain copyrighted content and require the original ROM
        for application. Choose the correct patch file based on the NES ROM you
        have. In order to apply a IPS, be sure to download{" "}
        <a href="https://www.romhacking.net/utilities/240/" target="_blank">
          Lunar IPS
        </a>.
        <br />
        <br />
        Please report any bugs using <a href="https://forms.gle/2pLB4MVcwEUo94fF7" target="_blank">this form</a>.
      </section>
      <h2>September 22, 2024 (v 1.0.1)</h2>
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
        <div>Fixes various bugs including</div>
        <ul>
            <li>Fixed minor level layout issue in Winter Winged Pursuit</li>
            <li>Glitch issue with World 2 boss fight</li>
            <li>Fixed issue where World 2 boss doesn't affect snow effect as it should</li>
            <li>Fixed potential soft lock with World 3 boss</li>
            <li>Fixed graphical glitch in World 3 Buccaneer Sea Battle</li>
        </ul>
      </div>
      <h2>September 21, 2024 (v 1.0.0)</h2>
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
      </div>
    </div>
  );
};

export default Versions;
