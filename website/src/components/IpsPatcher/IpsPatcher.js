import { useState } from "react";
import "./IpsPatcher.css";
import { patch } from "semver";

const IpsPatcher = () => {
  const [patching, setPatching] = useState(false);
  const patchFile = () => {
    if (!file) {
      alert("Please select a file to patch.");
      return;
    }

    setTimeout(makePatchApiCall, 1500);
    setPatching(true);
  };

  const makePatchApiCall = () => {
    fetch("/patcher/patch")
    .then((response) => response.text()) // Get base64 string
    .then((base64) => {
      // Remove header part of the base64 string if present
      const base64WithoutHeader = base64;

      // Convert base64 string to binary data
      const binaryString = atob(base64WithoutHeader);
      const binaryLength = binaryString.length;
      const binaryData = new Uint8Array(binaryLength);

      for (let i = 0; i < binaryLength; i++) {
        binaryData[i] = binaryString.charCodeAt(i);
      }

      // Create a blob from the binary data
      const blob = new Blob([binaryData], {
        type: "application/octet-stream",
      });

      // Trigger file download
      const link = document.createElement("a");
      link.href = URL.createObjectURL(blob);
      link.download = "Mario Adventure 3.nes"; // Set the desired file name and extension
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
      setPatching(false);
    });
  }

  const [file, setFile] = useState();

  return (
    <div class="ips-patcher">
        {
            patching ? <>Patching ROM...</> :
            <><input onChange={(e) => setFile(e.target.value)} type="file" />
      <button onClick={patchFile}>Patch my ROM!</button></>
        }
      
    </div>
  );
};

export default IpsPatcher;
