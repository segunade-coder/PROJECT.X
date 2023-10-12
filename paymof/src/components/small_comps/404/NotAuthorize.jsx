import { useNavigate } from "react-router-dom";
import logo from "../../../images/logo-white.png";
const UnauthorizedPage = () => {
  const navigate = useNavigate();

  return (
    <div className="authorise">
      <div
        style={{ fontFamily: "Poppins-Bold", marginTop: "5rem" }}
        className="d-flex justify-content-center mb-5 align-items-center"
      >
        <img src={logo} alt="" width={50} height={50} />
        <h2 style={{ marginLeft: "0.5rem" }}>Paymof</h2>
      </div>
      <div className="d-flex justify-content-center align-items-center w-100 flex-column mt-5 h-100 gap-2">
        <h3>ACCESS DENIED</h3>
        <span>You do not have the necessary permission </span>

        <a
          href="#"
          onClick={() => navigate(-3)}
          style={{ textDecoration: "none" }}
        >
          Back to Dashboard
        </a>
      </div>
    </div>
  );
};

export default UnauthorizedPage;
