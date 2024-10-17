import { useEffect, useState } from "react";
import "./SaveEditor.css";
import levelEntries from "./level-entries.json";

const SaveEditor = () => {
  const [rom, setRom] = useState();
  const [save, setSave] = useState();
  const [saveValues, setSaveValues] = useState();
  const [levelStatus, setLevelStatus] = useState(levelEntries);

  //   const loadRom = (event) => {
  //     const file = event.target.files[0];

  //     if (file) {
  //       const reader = new FileReader();

  //       reader.onload = (e) => {
  //         const arrayBuffer = e.target.result;
  //         const byteArray = new Uint8Array(arrayBuffer);
  //         setRom(byteArray);
  //       };

  //       reader.readAsArrayBuffer(file);
  //     }
  //   };

  const loadSave = (event) => {
    const file = event.target.files[0];

    if (file) {
      const reader = new FileReader();

      reader.onload = (e) => {
        const arrayBuffer = e.target.result;
        const byteArray = new Uint8Array(arrayBuffer);
        setSave(byteArray);
      };

      reader.readAsArrayBuffer(file);
    }
  };

  const LEVEL_TABLE_OFFSET = 0xdc10;
  const LEVEL_NAME_OFFSET = 12;
  const LEVEL_NAME_LENGTH = 0x22;
  const BANK_SIZE = 0x2000;
  const ROM_HEADER = 0x10;
  const ENTERABLE_FROM_WORLD = 11;
  const HAS_STARS_OFFSET = 7;

  //   const loadLevels = () => {
  //     const romLevelEntries = [];

  //     for (
  //       let levelTableOffset = LEVEL_TABLE_OFFSET, levelIndex = 0;
  //       levelIndex < 255;
  //       levelIndex++, levelTableOffset += 4
  //     ) {
  //       if (rom[levelTableOffset + 3] === 0) {
  //         continue;
  //       }

  //       const levelLocation =
  //         rom[levelTableOffset] * BANK_SIZE +
  //         (rom[levelTableOffset + 2] << 8) +
  //         rom[levelTableOffset + 1] +
  //         ROM_HEADER -
  //         0xa000;

  //       const stringBuilder = [];
  //       const levelNameOffset = levelLocation + LEVEL_NAME_OFFSET;

  //       for (let i = 0; i < LEVEL_NAME_LENGTH; i++) {
  //         stringBuilder.push(rom[levelNameOffset + i] == 0 ? " " : String.fromCharCode(rom[levelNameOffset + i]));
  //       }

  //       romLevelEntries.push({
  //         name: stringBuilder.join(''),
  //         id: levelIndex,
  //         hasStars: rom[levelLocation + HAS_STARS_OFFSET] !== 1,
  //         world: 0,
  //         number: "1-0"
  //       });
  //     }

  //     setLevelEntries(romLevelEntries);
  //   };

  const SAVE_RAM = 0x1e51;
  const LEVELS_COMPLETED_OFFSET = 0x1e65;
  const STAR_COUNT_OFFSET = 0x1e75;
  const FIRST_STARS_COLLECTED_OFFSET = 0x1e76;
  const SECOND_STARS_COLLECTED_OFFSET = 0x1e86;
  const THIRD_STARS_COLLECTED_OFFSET = 0x1e96;
  const PLAYER_CHERRIES_OFFSET = 0x1eae;
  const PLAYER_ABILITY_OFFSET = 0x1eb0;
  const PLAYER_COINS_OFFSET = 0x1eab;
  const PLAYER_XP_OFFSET = 0x1eb1;
  const CHECKSUM_OFFSET = 0x1EB8;
  const CHECKSUM_START = 0x1E50;

  const CHECK_SUM_LENGTH = 103;

  const loadSaveValues = () => {
    setSaveValues({
      Levels_Complete: save.slice(
        LEVELS_COMPLETED_OFFSET,
        LEVELS_COMPLETED_OFFSET + 16
      ),
      Magic_Stars: save.slice(STAR_COUNT_OFFSET, STAR_COUNT_OFFSET + 1),
      Magic_Stars_Collected1: save.slice(
        FIRST_STARS_COLLECTED_OFFSET,
        FIRST_STARS_COLLECTED_OFFSET + 16
      ),
      Magic_Stars_Collected2: save.slice(
        SECOND_STARS_COLLECTED_OFFSET,
        SECOND_STARS_COLLECTED_OFFSET + 16
      ),
      Magic_Stars_Collected3: save.slice(
        THIRD_STARS_COLLECTED_OFFSET,
        THIRD_STARS_COLLECTED_OFFSET + 16
      ),
      Save_Ram_CheckSum: `${save[CHECKSUM_OFFSET + 1].toString(16).padStart(2, "0")}${save[CHECKSUM_OFFSET].toString(16).padStart(2, "0")}`,
      Player_Cherries: save[PLAYER_CHERRIES_OFFSET],
      Player_Level: save[PLAYER_ABILITY_OFFSET],
      Player_Coins: parseInt(`${save[PLAYER_COINS_OFFSET + 1].toString(16)}${save[PLAYER_COINS_OFFSET].toString(16)}`, 16),
      Player_Exp: parseInt(`${save[PLAYER_XP_OFFSET + 2].toString(16)}${save[PLAYER_XP_OFFSET + 1].toString(16)}${save[PLAYER_XP_OFFSET].toString(16)}`, 16)
    });
  };

  const markCompletedLevels = () => {
    const completionFlagSets = [];
    const collectedStar1Sets = [];
    const collectedStar2Sets = [];
    const collectedStar3Sets = [];

    for (let i = 0; i < 16; i++) {
      completionFlagSets.push(
        saveValues.Levels_Complete[i]
          .toString(2)
          .padStart(8, "0")
          .split("")
          .reverse()
          .join("")
      );
      collectedStar1Sets.push(
        saveValues.Magic_Stars_Collected1[i]
          .toString(2)
          .padStart(8, "0")
          .split("")
          .reverse()
          .join("")
      );
      collectedStar2Sets.push(
        saveValues.Magic_Stars_Collected2[i]
          .toString(2)
          .padStart(8, "0")
          .split("")
          .reverse()
          .join("")
      );
      collectedStar3Sets.push(
        saveValues.Magic_Stars_Collected3[i]
          .toString(2)
          .padStart(8, "0")
          .split("")
          .reverse()
          .join("")
      );
    }

    const completionFlags = completionFlagSets.join("");
    const collectedStar1 = collectedStar1Sets.join("");
    const collectedStar2 = collectedStar2Sets.join("");
    const collectedStar3 = collectedStar3Sets.join("");

    for (let i = 1; i < 255; i++) {
      const levelById = levelStatus.find((entry) => entry.id === i);
      const completed = completionFlags[i] === "1";
      const star1Collected = collectedStar1[i] === "1";
      const star2Collected = collectedStar2[i] === "1";
      const star3Collected = collectedStar3[i] === "1";

      if (levelById) {
        levelById.completed = completed;
        levelById.star1Collected = star1Collected;
        levelById.star2Collected = star2Collected;
        levelById.star3Collected = star3Collected;
      }
    }

    levelStatus.sort((a, b) => a.number.localeCompare(b.number));

    setLevelStatus([...levelStatus]);
  };

  const updateLevelCompletion = (level, completed) => {
    level.completed = completed;
    setLevelStatus([...levelStatus]);
  };

  const updateStar1 = (level, collected) => {
    level.star1Collected = collected;
    setLevelStatus([...levelStatus]);
  };

  const updateStar2 = (level, collected) => {
    level.star2Collected = collected;
    setLevelStatus([...levelStatus]);
  };

  const updateStar3 = (level, collected) => {
    level.star3Collected = collected;
    setLevelStatus([...levelStatus]);
  };

  const updateLevel = (levelNumber) => {
    levelNumber = parseInt(levelNumber);

    saveValues.Player_Level = levelNumber;
    setSaveValues({...saveValues});
  }

  const updateCoins = (coins) => {
    coins = parseInt(coins);
    if(isNaN(coins)){
        coins = 0;
    }

    if(coins < 0){
        coins = 0;
    }

    if(coins > 9999){
        coins = 9999;
    }

    saveValues.Player_Coins = coins;
    setSaveValues({...saveValues});
  }

  const updateXp = (xp) => {
    xp = parseInt(xp);
    if(isNaN(xp)){
        xp = 0;
    }

    if(xp < 0){
        xp = 0;
    }
    
    if(xp > 999999){
        xp = 999999;
    }

    saveValues.Player_Exp = xp;
    setSaveValues({...saveValues});
  }

  const updateCherries = (cherries) => {
    cherries = parseInt(cherries);

    if(isNaN(cherries)){
        cherries = 0;
    }

    if(cherries > 99){
        cherries = 99;
    }
    
    saveValues.Player_Cherries = cherries;
    setSaveValues({...saveValues});
  }

  const saveSaveFile = () => {
    let magicStarCount = 0;
    const levelCompletionFlags = [];
    const stars1CollectedFlags = [];
    const stars2CollectedFlags = [];
    const stars3CollectedFlags = [];

    for (let i = 0; i < 255; i++) {
      const levelById = levelStatus.find((entry) => entry.id === i);

      if (levelById) {
        levelCompletionFlags.push(levelById.completed ? "1" : "0");
        stars1CollectedFlags.push(levelById.star1Collected ? "1" : "0");
        stars2CollectedFlags.push(levelById.star2Collected ? "1" : "0");
        stars3CollectedFlags.push(levelById.star3Collected ? "1" : "0");

        if(levelById.hasStars){
            if (levelById.star1Collected) {
            magicStarCount++;
            }

            if (levelById.star2Collected) {
            magicStarCount++;
            }

            if (levelById.star3Collected) {
            magicStarCount++;
            }
        }
      } else {
        levelCompletionFlags.push("0");
        stars1CollectedFlags.push("0");
        stars2CollectedFlags.push("0");
        stars3CollectedFlags.push("0");
      }
    }

    const completionFlagSets = [];
    const collectedStar1Sets = [];
    const collectedStar2Sets = [];
    const collectedStar3Sets = [];

    for (let i = 0; i < 16; i++) {
      completionFlagSets.push(
        levelCompletionFlags.splice(0, 8).reverse().join("")
      );
      collectedStar1Sets.push(
        stars1CollectedFlags.splice(0, 8).reverse().join("")
      );
      collectedStar2Sets.push(
        stars2CollectedFlags.splice(0, 8).reverse().join("")
      );
      collectedStar3Sets.push(
        stars3CollectedFlags.splice(0, 8).reverse().join("")
      );
    }

    for (let i = 0; i < 16; i++) {
      save[LEVELS_COMPLETED_OFFSET + i] = parseInt(completionFlagSets[i], 2);
      save[FIRST_STARS_COLLECTED_OFFSET + i] = parseInt(
        collectedStar1Sets[i],
        2
      );
      save[SECOND_STARS_COLLECTED_OFFSET + i] = parseInt(
        collectedStar2Sets[i],
        2
      );
      save[THIRD_STARS_COLLECTED_OFFSET + i] = parseInt(
        collectedStar3Sets[i],
        2
      );
    }

    save[STAR_COUNT_OFFSET] = magicStarCount;
    save[PLAYER_CHERRIES_OFFSET] = saveValues.Player_Cherries;
    save[PLAYER_ABILITY_OFFSET] = saveValues.Player_Level;
    save[PLAYER_COINS_OFFSET] = (saveValues.Player_Coins & 0x00ff);
    save[PLAYER_COINS_OFFSET + 1] = (saveValues.Player_Coins & 0xff00) >> 8;
    save[PLAYER_XP_OFFSET] =  (saveValues.Player_Exp & 0x0000ff);
    save[PLAYER_XP_OFFSET + 1] = (saveValues.Player_Exp & 0x00ff00) >> 8;
    save[PLAYER_XP_OFFSET + 2] = (saveValues.Player_Exp & 0xff0000) >> 16;

    let checkSum = 0;
    for (let i = 0; i <= CHECK_SUM_LENGTH; i++) {
      checkSum += save[CHECKSUM_START + i];
    }

    save[CHECKSUM_OFFSET] = checkSum & 0x00ff;
    save[CHECKSUM_OFFSET + 1] = (checkSum & 0xff00) >> 8;

    const blob = new Blob([save], {
      type: "application/octet-stream",
    });

    const link = document.createElement("a");
    link.href = URL.createObjectURL(blob);
    link.download = "Mario Adventure 3.sav"; // Set the desired file name and extension
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  //   useEffect(() => {
  //     if (rom) {
  //       loadLevels();
  //     }
  //   }, [rom]);

  useEffect(() => {
    if (save) {
      loadSaveValues();
    }
  }, [save]);

  useEffect(() => {
    if (saveValues) {
      markCompletedLevels();
    }
  }, [saveValues]);

  return (
    <div className="save-editor">
      {/* ROM: <input type="file" onChange={(e) => loadRom(e)} /> */}
      <p>
        Use this tool to inspect and fix your save file. Be sure to save a copy
        of your save file in case something goes wrong.
      </p>
      <div className="upload-save">
        Save File: <input type="file" onChange={(e) => loadSave(e)} />
      </div>
      {saveValues && levelStatus && (
        <>
          <div className="download-button"><button onClick={saveSaveFile}>Download Save File</button></div>
          <p>Checksum: 0x{saveValues.Save_Ram_CheckSum}</p>
          <p>Magic Star Count: {saveValues.Magic_Stars}</p>
          <p>Ability Level: <select onChange={(e) => updateLevel(e.target.value)} >
            <option selected={saveValues.Player_Level === 0 ? true: false} value="0">None</option>
            <option selected={saveValues.Player_Level === 1 ? true: false} value="1">#1 Extra Hit</option>
            <option selected={saveValues.Player_Level === 2 ? true: false} value="2">#2 Start Super</option>
            <option selected={saveValues.Player_Level === 3 ? true: false} value="3">#3 Extended invulnerability</option>
            <option selected={saveValues.Player_Level === 4 ? true: false} value="4">#4 Full Power-ups</option>
            <option selected={saveValues.Player_Level === 5 ? true: false} value="5">#5 Double Jump</option>
            <option selected={saveValues.Player_Level === 6 ? true: false} value="6">#6 Cherry Star</option>
            </select>
        </p>
          <p>Cherries: <input type="text" onChange={(e) => updateCherries(e.target.value)} width={5} value={saveValues.Player_Cherries} /></p>
          <p>Coins: <input type="text" onChange={(e) => updateCoins(e.target.value)} width={5} value={saveValues.Player_Coins} /></p>
          <p>XP: <input type="text" onChange={(e) => updateXp(e.target.value)} width={5} value={saveValues.Player_Exp} /></p>
          <table>
            <tr>
              <th>Completed</th>
              <th>Name</th>
              <th>Star 1</th>
              <th>Star 2</th>
              <th>Star 3</th>
            </tr>
            {levelStatus?.map((level) => (
              <tr>
                <td>
                  <input
                    onChange={(e) =>
                      updateLevelCompletion(level, e.target.checked)
                    }
                    type="checkbox"
                    checked={level.completed}
                  />
                </td>
                <td>
                  ({level.number}) {level.name}
                </td>
                {level.hasStars ? (
                  <>
                    <td>
                      {level.hasStars && (
                        <input
                          onChange={(e) => updateStar1(level, e.target.checked)}
                          type="checkbox"
                          checked={level.star1Collected}
                        />
                      )}
                    </td>
                    <td>
                      {level.hasStars && (
                        <input
                          onChange={(e) => updateStar2(level, e.target.checked)}
                          type="checkbox"
                          checked={level.star2Collected}
                        />
                      )}
                    </td>
                    <td>
                      {level.hasStars && (
                        <input
                          onChange={(e) => updateStar3(level, e.target.checked)}
                          type="checkbox"
                          checked={level.star3Collected}
                        />
                      )}
                    </td>
                  </>
                ) : (
                  <td colSpan={3}>No stars</td>
                )}
              </tr>
            ))}
          </table>
        </>
      )}
    </div>
  );
};

export default SaveEditor;
