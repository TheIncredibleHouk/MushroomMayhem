import PageHeader from "../../components/PageHeader/PageHeader"
import PageTitle from "../../components/PageTitle/PageTitle"
import "./Demos.css";
import { green } from '../../styles/colors';

var Demos = () => {
    var showDemos = () => {
        var date = new Date();
        if(date >= Date.UTC(2023, 11, 23, 18)){
          return true;
        }
        return false;
      };
    return <div className="demos">
        { showDemos() && 
        <>
            <PageTitle title="Demos">
                Demos of Mario Adventure 3 are distributed via IPS patch files. This patch files require an original Super Mario Bros 3. ROM. These
                patch files do not contain copyrighted content and require the original ROM for application. Choose the correct patch
                file based on the NES ROM you have. In order to apply a IPS, be sure to download <a href="https://www.romhacking.net/utilities/240/" target="_blank">Lunar IPS</a>.
            </PageTitle>
            <PageHeader color={green}>January 4, 2024</PageHeader>
            <div className="demos-layout">
                <ul>
                    <li><a href="/patches/Mario Adventure 3 (PRG0).ips">Patch for Super Mario Bros. 3 (PRG0) version</a></li>
                    <li><a href="/patches/Mario Adventure 3 (PRG1).ips">Patch for Super Mario Bros. 3 (PRG1) version</a></li>
                    <li><a href="/patches/Mario Adventure 3 (PC10).ips">Patch for Super Mario Bros. 3 (PC10) version</a></li>
                </ul>
            </div>
        </>
        } {
            !showDemos() &&
            <>
              <PageTitle title="Demos">
                Check back at 1PM EST!
            </PageTitle>
            </>
        }
    </div>
};

export default Demos;