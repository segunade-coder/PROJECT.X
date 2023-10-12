/* eslint-disable react/prop-types */
import "./box.css";
const Box = ({ children, style, onClick }) => {
  return (
    <div className="box" style={style} onClick={onClick}>
      {children}
    </div>
  );
};

export default Box;
