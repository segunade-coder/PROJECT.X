import { useSpring, animated } from "@react-spring/web";
import { useNavigate } from "react-router-dom";

const NotFoundPage = () => {
  const navigate = useNavigate();

  const textProps = useSpring({
    opacity: 1,
    transform: "translateY(0)",
    from: { opacity: 0, transform: "translateY(-50px)" },
  });

  const buttonProps = useSpring({
    opacity: 1,
    transform: "translateX(0)",
    from: { opacity: 0, transform: "translateX(-50px)" },
  });

  const handleBack = () => {
    navigate(-1);
  };

  return (
    <div style={{ textAlign: "center", paddingTop: "50px" }}>
      <animated.h1 style={{ fontSize: "6rem", fontWeight: "bold", color: "#ff6b6b", ...textProps }}>
        404
      </animated.h1>
      <animated.h2 style={{ fontSize: "2rem", marginBottom: "2rem", color: "#4d4d4d", ...textProps }}>
        Oops! Page not found
      </animated.h2>
      <animated.p style={{ fontSize: "1.2rem", color: "#4d4d4d", ...textProps }}>
        The page you are looking for might have been removed, had its name changed,
        or is temporarily unavailable.
      </animated.p>
      <animated.button
        style={{
          backgroundColor: "#ff6b6b",
          color: "white",
          border: "none",
          padding: "10px 20px",
          borderRadius: "5px",
          cursor: "pointer",
          marginTop: "30px",
          ...buttonProps
        }}
        onClick={handleBack}
      >
        Go back
      </animated.button>
    </div>
  );
};

export default NotFoundPage;
