let events = ["load", "mousemove", "mousedown", "click", "scroll", "keypress"];
import { useEffect } from "react";
import notifications from "./Helpers/Notifications";
import { useNavigate } from "react-router-dom";
const Autologout = ({ children }) => {
  let loggedSchool = localStorage.getItem("school") || null;
  const navigate = useNavigate();
  let timer;
  const handleLogoutTime = () => {
    timer = setTimeout(() => {
      resetTimer();

      Object.values(events).forEach((event) => {
        window.removeEventListener(event, resetTimer);
      });
      logoutAction();
    }, 5 * 60 * 1000);
  };
  const resetTimer = () => {
    if (timer) clearTimeout(timer);
  };
  const logoutAction = () => {
    fetch(`${notifications.url}/logout`, {
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
      },
      method: "GET",
    })
      .then((res) => res.json())
      .then((data) => {
        if (data.status && data.logout) {
          if (loggedSchool !== null && loggedSchool !== "") {
            navigate(
              `../login/${loggedSchool.toLowerCase().replace(/ /g, "-")}`
            );
          } else {
            navigate(`../login/`);
          }
        }
      })
      .catch((err) => console.log(err));
  };
  useEffect(() => {
    Object.values(events).forEach((event) => {
      window.addEventListener(event, () => {
        resetTimer();
        handleLogoutTime();
      });
    });
  }, []);
  return children;
};

export default Autologout;
