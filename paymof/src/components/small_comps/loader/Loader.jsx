import "./loader.css";
import { ProgressSpinner } from "primereact/progressspinner";

const BigLoader = () => {
  return (
    <div className="big-loader-container">
      <ProgressSpinner />

      <br />
    </div>
  );
};

export default BigLoader;
