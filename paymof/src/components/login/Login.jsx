import "./login.css";
import { useEffect, useState } from "react";
import { useLocation, useNavigate, useSearchParams } from "react-router-dom";
import toast, { Toaster } from "react-hot-toast";
import { Checkbox } from "primereact/checkbox";
import notifications from "../Main/Helpers/Notifications";

const Login = () => {
  const [school, setSchool] = useState("");
  const [schoolArray, setSchoolArray] = useState([]);
  const [user, setUser] = useState("");
  const [pass, setPass] = useState("");
  const [loading, setLoading] = useState(false);
  const [url] = useState(notifications.url);
  // const [url] = useState("http://localhost:5000");
  const [rememberMe, setRememberMe] = useState(true);
  let location = useLocation();
  let navigate = useNavigate();
  let [searchParams] = useSearchParams();
  let go_to = searchParams.get("redirect");
  document.title = "Login | Paymof";
  try {
    if (location.state === null);
    else {
      var { schoolName, adminName, adminCode } = location.state;
    }
  } catch (error) {
    console.log(error);
  }
  useEffect(() => {
    if (typeof localStorage !== "undefined") {
      try {
        if (window.localStorage.getItem("username")) {
          let username = window.localStorage.getItem("username") || "";
          let schl = window.localStorage.getItem("school") || "";
          if (username !== "" && schl !== "") {
            setUser(username);
            setSchool(schl);
          }
        }
      } catch (error) {
        console.log(error);
      }
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [document.readyState]);

  useEffect(() => {
    if (schoolName || adminCode || adminName) {
      setSchool(schoolName.toLowerCase());
      setUser(adminName);
      setPass(adminCode);
    }
    fetch(`${url}/login/schools`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
    })
      .then((res) => res.json())
      .then((data) => {
        if (!data.status) {
          navigate("../index");
        }
        if (data.error !== true) {
          setSchoolArray([...data.school]);
          if (schoolName) {
            let arr = [document.getElementsByTagName("select")[0].options];
            for (let i = 0; i < arr[0].length; i++) {
              if (arr[0][i].value === schoolName.toLowerCase()) {
                document.getElementsByTagName(
                  "select"
                )[0].options.selectedIndex = i;

                break;
              }
            }
            // console.log(arr[0].length);
          }
        } else {
          toast.error(data.message);
        }
      })
      .catch((err) => console.log(err));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [schoolName, adminName, adminCode, location]);

  const handleClickLogin = (e) => {
    e.preventDefault();
    if (school !== "" && user !== "" && pass !== "") {
      if (school !== "Select School") {
        setLoading(true);
        toast.loading("Loading...", { id: "thid" });
        fetch(`${url}/login`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          credentials: "include",
          body: JSON.stringify({
            school: school,
            user: user,
            pass: pass,
          }),
        })
          .then((res) => res.json())
          .then((data) => {
            // toast.dismiss(loginLoading);
            setLoading(false);
            if (data.error) {
              toast.error(data.message, { id: "thid" });
            } else {
              toast.dismiss("thid");
              if (
                go_to &&
                go_to.includes(`${school.toLowerCase().replace(/ /g, "_")}`)
              ) {
                window.location.href = go_to;
              } else {
                navigate(
                  `../${school.toLowerCase().replace(/ /g, "_")}/dashboard`
                );
              }
              if (typeof localStorage !== "undefined") {
                try {
                  if (rememberMe) {
                    window.localStorage.setItem("school", school);
                    window.localStorage.setItem("username", user);
                  } else {
                    window.localStorage.removeItem("school", school);
                    window.localStorage.removeItem("username", user);
                  }
                } catch (error) {
                  console.log(error);
                }
              }
            }
          })
          .catch((err) => {
            toast.error(err, { id: "thid" });
            setLoading(false);
            // toast.error(err, { id: "hfjfsssgk" });
          });
      } else {
        toast.error("Select a school", { id: "thid" });
        return;
      }
    } else {
      toast.error("All fields are required", { id: "thid" });
    }
  };
  return (
    <div className="login__cont">
      <div className="inner__container">
        <div>
          <Toaster position="top-center" reverseOrder={false} />
        </div>
        <form method="POST">
          <div className="login-label">
            <h1>Welcome!</h1>
            <h4>Log in</h4>
            <span>
              <a href="../index">Sign up for an account? </a>
            </span>
          </div>
          <h2 className="shool-name">
            {school !== "Select School" ? school : ""}
          </h2>
          <select
            id="schools"
            value={schoolName ? school : school}
            onChange={(e) => setSchool(e.target.value)}
          >
            <option value="Select School">Select School</option>
            {schoolArray.map((elem, index) => (
              <option key={index} value={elem.school}>
                {elem.school}
              </option>
            ))}
          </select>
          <input
            type="text"
            className="username"
            onChange={(e) => setUser(e.target.value)}
            value={user}
            placeholder="Enter Username"
            autoComplete="on"
          />
          <input
            type="password"
            name="password"
            className="password"
            onChange={(e) => setPass(e.target.value)}
            value={pass}
            placeholder="Enter Password"
            autoComplete="on"
          />
          <div className="remember-me">
            <Checkbox
              name=""
              id=""
              onChange={(e) => setRememberMe(e.checked)}
              checked={rememberMe}
              className="checked"
            />
            <span>Remember Login</span>
          </div>
          <button
            onClick={(e) => handleClickLogin(e)}
            disabled={loading}
            className="btn btn-success btn-block btn-sm"
          >
            Proceed
          </button>
          <div className="new-account">
            <span>
              <a href="index">Sign up for an account? </a>
            </span>
          </div>
        </form>
      </div>
    </div>
  );
};

export default Login;
