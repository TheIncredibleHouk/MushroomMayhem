import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import "./LevelGuide.css";

const LevelGuide = () => {
    const { world, level } = useParams();
    const [levelData, setLevelData] = useState();

    const loadLevelData = async () => {
        const data = (await import(`./levels/${world}/${level}/data.json`)).default;
        setLevelData(data);
    };

    useEffect(() => {
        loadLevelData();
    }, []);

    if (!levelData) {
        return null;
    }

    return (
        <div className="level-guide">
            {levelData.sections.map((section) => (
                <>
                    <h1>{levelData.name} - {section.name}</h1>
                    <section className="level-guide-section-image">
                        <div className={`level-guide-map ${section.crop ? 'crop' : ''}`} style={{
                            ['--crop-x']: `${section.crop?.x * -16}px`,
                            ['--crop-y']: `${section.crop?.y * -16}px`,
                            ['--crop-height']: `${section.crop?.height * 16}px`,
                            ['--crop-width']: `${section.crop?.width * 16}px`,
                        }}>
                            <img src={require(`./levels/${world}/${level}/${section.image}`)} />
                            {section.annotations?.map((annotation) => (
                                <div
                                    className="level-guide-section-annotation"
                                    style={{
                                        ["--x"]: `${annotation.col * 16}px`,
                                        ["--y"]: `${annotation.row * 16}px`,
                                        ["--height"]: `${annotation.height * 16}px`,
                                        ["--width"]: `${annotation.width * 16}px`,
                                    }}
                                >
                                    {annotation.image &&
                                        <img
                                            src={require(`./levels/annotations/${annotation.image}`)}
                                        />}
                                    {annotation.label && (
                                        <label className={annotation.location}>
                                            {annotation.label}
                                        </label>
                                    )}
                                    {/* {annotation.text && <span>{annotation.text}</span>} */}
                                </div>
                            ))}


                            {section.tips?.map((tip) => (
                                <div
                                    onClick={() => (window.location.href = `#${tip.title}`)}
                                    className="level-guide-tip-marker"
                                    style={{
                                        ["--x"]: `${tip.col * 16}px`,
                                        ["--y"]: `${tip.row * 16}px`,
                                        ["--height"]: `${tip.height * 16}px`,
                                        ["--width"]: `${tip.width * 16}px`,
                                    }}
                                ></div>
                            ))}
                        </div>
                    </section>
                    {section.tips?.map((tip) => (
                        <div className="level-guide-tip">
                            <a name={tip.title}>
                                <h2>{tip.title}</h2>
                            </a>
                            <section>
                                <p>{tip.description}</p>
                                <div className="level-guide-tip-images">
                                    {tip.images?.map(image => (
                                        <img src={require(`./levels/${world}/${level}/${image}`)} />
                                    ))}
                                </div>
                            </section>
                        </div>
                    ))}
                </>
            ))}
        </div>
    );
};

export default LevelGuide;
